local M = {
  enabled = true,
  "neovim/nvim-lspconfig",
  lazy = false,
  event = { "BufReadPre" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/noice.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  ---@param opts PluginLspOpts
  config = function(_, opts)
    -- setup autoformat
    LazyVim.format.register(LazyVim.lsp.formatter())

    -- setup keymaps
    LazyVim.lsp.on_attach(function(client, buffer)
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    end)

    LazyVim.lsp.setup()
    LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

    LazyVim.lsp.words.setup(opts.document_highlight)

    -- diagnostics signs
    if vim.fn.has "nvim-0.10.0" == 0 then
      if type(opts.diagnostics.signs) ~= "boolean" then
        for severity, icon in pairs(opts.diagnostics.signs.text) do
          local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
          name = "DiagnosticSign" .. name
          vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
        end
      end
    end

    if vim.fn.has "nvim-0.10" == 1 then
      -- inlay hints
      if opts.inlay_hints.enabled then
        LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
          if
            vim.api.nvim_buf_is_valid(buffer)
            and vim.bo[buffer].buftype == ""
            and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
          then
            LazyVim.toggle.inlay_hints(buffer, true)
          end
        end)
      end

      -- code lens
      if opts.codelens.enabled and vim.lsp.codelens then
        LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
          vim.lsp.codelens.refresh()
          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = buffer,
            callback = vim.lsp.codelens.refresh,
          })
        end)
      end
    end

    if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
      opts.diagnostics.virtual_text.prefix = vim.fn.has "nvim-0.10.0" == 0 and "●"
        or function(diagnostic)
          local icons = LazyVim.config.icons.diagnostics
          for d, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local servers = opts.servers
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    -- get all the servers that are available through mason-lspconfig
    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local all_mslp_servers = {}
    if have_mason then
      all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        if server_opts.enabled ~= false then
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end
    end

    if have_mason then
      mlsp.setup {
        ensure_installed = vim.tbl_deep_extend(
          "force",
          ensure_installed,
          LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
        ),
        handlers = { setup },
      }
    end

    if LazyVim.lsp.is_enabled "denols" and LazyVim.lsp.is_enabled "vtsls" then
      local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
      LazyVim.lsp.disable("vtsls", is_deno)
      LazyVim.lsp.disable("denols", function(root_dir, config)
        if not is_deno(root_dir) then
          config.settings.deno.enable = false
        end
        return false
      end)
    end

    -- Function to check if a floating dialog exists and if not
    -- then check for diagnostics under the cursor
    function OpenDiagnosticIfNoFloat()
      for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_config(winid).zindex then
          return
        end
      end
      -- THIS IS FOR BUILTIN LSP
      vim.diagnostic.open_float {
        scope = "cursor",
        focusable = false,
        close_events = {
          "CursorMoved",
          "CursorMovedI",
          "BufHidden",
          "InsertCharPre",
          "WinLeave",
        },
      }
    end

    -- local signs = {
    --   { name = "DiagnosticSignError", text = "" },
    --   { name = "DiagnosticSignWarn", text = "" },
    --   { name = "DiagnosticSignHint", text = "" },
    --   { name = "DiagnosticSignInfo", text = "" },
    -- }

    -- Show diagnostics under the cursor when holding position
    vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
      pattern = "*",
      command = "lua OpenDiagnosticIfNoFloat()",
      group = "lsp_diagnostics_hold",
    })

    local config = {
      -- disable virtual text
      virtual_text = false,
      -- show signs
      -- signs = {
      --   active = signs,
      -- },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        suffix = "",
      },
    }
    vim.diagnostic.config(config)
  end,
}

-- function M.config()
--   local cmp_nvim_lsp = require "cmp_nvim_lsp"

--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

--   local function lsp_keymaps(bufnr)
--     local opts = { noremap = true, silent = true }
--     local keymap = vim.api.nvim_buf_set_keymap
--     keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--     keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--     keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--     keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--     keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--     keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--     keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
--     keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
--     keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
--     keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
--     keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
--     keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
--     keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--     keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
--   end

--   local lspconfig = require "lspconfig"

--   local on_attach = function(client, bufnr)
--     lsp_keymaps(bufnr)
--     require("illuminate").on_attach(client)
--   end

--   for _, server in pairs(require("plugins.utils.servers").servers) do
--     Opts = {
--       on_attach = on_attach,
--       capabilities = capabilities,
--     }

--     server = vim.split(server, "@")[1]

--     local require_ok, conf_opts = pcall(require, "settings." .. server)
--     if require_ok then
--       Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
--     end

--     lspconfig[server].setup(Opts)
--   end

--   local signs = {
--     { name = "DiagnosticSignError", text = "" },
--     { name = "DiagnosticSignWarn", text = "" },
--     { name = "DiagnosticSignHint", text = "" },
--     { name = "DiagnosticSignInfo", text = "" },
--   }

--   for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
--   end

--   local config = {
--     -- disable virtual text
--     virtual_text = false,
--     -- show signs
--     signs = {
--       active = signs,
--     },
--     update_in_insert = true,
--     underline = true,
--     severity_sort = true,
--     float = {
--       focusable = false,
--       style = "minimal",
--       border = "rounded",
--       source = "always",
--       header = "",
--       prefix = "",
--       suffix = "",
--     },
--   }

--   vim.diagnostic.config(config)
--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(require("noice.lsp.hover").on_hover, { border = "rounded" })
--   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(require("noice.lsp.signature"), { border = "rounded"  })

--   -- Function to check if a floating dialog exists and if not
--   -- then check for diagnostics under the cursor
--   function OpenDiagnosticIfNoFloat()
--     for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
--       if vim.api.nvim_win_get_config(winid).zindex then
--         return
--       end
--     end
--     -- THIS IS FOR BUILTIN LSP
--     vim.diagnostic.open_float({
--       scope = "cursor",
--       focusable = false,
--       close_events = {
--         "CursorMoved",
--         "CursorMovedI",
--         "BufHidden",
--         "InsertCharPre",
--         "WinLeave",
--       },
--     })
--   end

return M
