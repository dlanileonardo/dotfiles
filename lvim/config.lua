--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.opt.shell = "/bin/sh"

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "kanagawa"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-l>"] = ":bn<cr>"
lvim.keys.normal_mode["<C-h>"] = ":bp<cr>"
-- lvim.keys.normal_mode["<C-j>"] = ":bd<cr>"

-- unmap a default keymapping
lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["b"]["n"] = { "<cmd>:bnext<cr>", "Next Buffer" }
lvim.builtin.which_key.mappings["b"]["1"] = { "<cmd>:bfirst<cr>", "First Buffer" }
lvim.builtin.which_key.mappings["b"]["0"] = { "<cmd>:blast<cr>", "Last Buffer" }

lvim.builtin.which_key.mappings["L"]["h"] = { "<cmd>:CheckHealth<cr>", "Check Health" }

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>:TroubleToggle<cr>", "Toggle" },
  r = { "Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plug sins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "dart",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

vim.cmd([[
  setlocal foldmethod=indent
  set nofoldenable
  set foldlevel=99
]])

-- transparencia
lvim.transparent_window = true

-- keymappings hop
lvim.builtin.which_key.mappings['r'] = {
  name = "Hop",
  w = { "<cmd>:HopWord<CR>", "Search by Word" },
  e = { "<cmd>:HopPattern<CR>", "Search by Pattern" },
  f = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", "After Cursor" },
  F = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", "Before Cursor" },
}

lvim.builtin.which_key.mappings['s']['e'] = { "<cmd>lua require('spectre').open()<cr>", "Spectre" }

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  -- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  -- { "BufWinEnter", "*.js", "setlocal ts=4 sw=4" },
  -- { "InsertEnter", "*", ":normal zz" },
  { "BufWinEnter", "*.*", "setlocal foldmethod=indent" },
}

vim.api.nvim_set_keymap('n', 'ff', ":HopWord<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fp', ":HopPattern<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fd', "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fs', ":HopLineStart<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fl', ":HopLine<cr>", { silent = true })

vim.opt.timeoutlen = 500

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false
-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "dartls" })

-- Additional Plugins
lvim.plugins = {
  { "rebelot/kanagawa.nvim" },
  { 'cpea2506/one_monokai.nvim' },
  { 'tiagovla/tokyodark.nvim' },
  { 'onsails/lspkind.nvim' },
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
  { 'shaunsingh/nord.nvim' },
  { 'shaunsingh/moonlight.nvim' },
  { 'bluz71/vim-nightfly-guicolors' },
  { 'morhetz/gruvbox' },
  { 'Rigellute/shades-of-purple.vim' },
  { "p00f/nvim-ts-rainbow" },
  { "sainnhe/sonokai" },
  { "yamatsum/nvim-cursorline" },
  { 'norcalli/nvim_utils' },
  { 'famiu/bufdelete.nvim' },
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  -- {
  --   'rmagatti/goto-preview',
  --   config = function()
  --     require('goto-preview').setup {
  --       width = 120; -- Width of the floating window
  --       height = 25; -- Height of the floating window
  --       default_mappings = false; -- Bind default mappings
  --       debug = false; -- Print debug information
  --       opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
  --       post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
  --       -- You can use "default_mappings = true" setup option
  --       -- Or explicitly set keybindings
  --       vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>");
  --       vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>");
  --       vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>");
  --     }
  --   end
  -- },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   setup = function()
  --     vim.g.indentLine_enabled = 1
  --     vim.g.indent_blankline_char = "▏"
  --     vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
  --     vim.g.indent_blankline_buftype_exclude = { "terminal" }
  --     vim.g.indent_blankline_show_trailing_blankline_indent = false
  --     vim.g.indent_blankline_show_first_indent_level = false
  --     vim.g.indent_blankline_use_treesitter = false
  --   end
  -- },
  { 'ludovicchabant/vim-gutentags',
    config = function()
      vim.g.gutentags_ctags_exclude = { '.venv', '.mypy_cache', '.git' }
      vim.g.gutentags_project_root = { '.gutentags' }
      vim.g.gutentags_modules = { 'ctags' }
      vim.g.gutentags_cache_dir = '~/.cache/lvim/ctags/'
      vim.g.gutentags_generate_on_new = true
      vim.g.gutentags_generate_on_missing = true
      vim.g.gutentags_generate_on_write = true
      vim.g.gutentags_generate_on_empty_buffer = 0
      vim.g.gutentags_ctags_extra_args = { '--fields=+ailmnS' }
    end
  },
  { "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end
  },
  { 'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
    end
  },
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    -- ft = "dartls",
    config = function()
      require "telescope".load_extension("flutter")
    end,
  },
  {
    'declancm/cinnamon.nvim',
    config = function()
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  { 'anuvyklack/pretty-fold.nvim',
    requires = 'anuvyklack/nvim-keymap-amend',
    config = function()
      require('pretty-fold').setup({
        keep_indentation = false,
        fill_char = '-',
        sections = {
          left = {
            '+', function() return string.rep('-', vim.v.foldlevel) end, '-| ', 'content', ' |-'
          },
          right = {
            '-| ', 'number_of_folded_lines', ': ', 'percentage', ' |-',
          }
        }
      })
      require('pretty-fold.preview').setup()
    end
  },
  {
    'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp',
    config = function()
      local tabnine = require('cmp_tabnine.config')
      tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
        run_on_every_keystroke = true;
        snippet_placeholder = '..';
        ignored_file_types = { -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
          html = true
        };
        show_prediction_strength = false;
      })
    end
  },
}

require('cinnamon').setup {
  default_keymaps = true,
  extra_keymaps = true,
  centered = true,
  scroll_limit = 150,
  default_delay = 7,
}

require("flutter-tools").setup {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  lsp = {
    on_attach = require("lvim.lsp").common_on_attach,
  },
  flutter_lookup_cmd = "asdf where flutter",
}

require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require("nvim-gps").setup()
local gps = require("nvim-gps")

lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch", "diff", "diagnostics" },
  lualine_c = {
    -- { require('auto-session-library').current_session_name },
    "filename",
    { gps.get_location, cond = gps.is_available }
  },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = { "progress" },
  lualine_z = { "location" },
}

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

-- Plugins

-- lvim.builtin.telescope.extensions = { "flutter" }

-- LSP Config
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  cmd = { "/Users/dlani/.asdf/shims/vscode-json-languageserver", "--stdio" }
}

-- require 'lspconfig'.dartls.setup {
--   cmd = { "dart", "/Users/dlani/.asdf/installs/flutter/2.10.4-stable/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" }
-- }

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- end


lvim.builtin.which_key.mappings['l']['K'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" }

local servers = { 'solargraph', 'dartls', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    -- on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end


vim.cmd [[
  au BufRead,BufNewFile Fastfile set filetype=ruby
  set cmdheight=1
  set tags=tags
  let g:easytags_cmd = "/usd/local/bin/ctags"
]]
