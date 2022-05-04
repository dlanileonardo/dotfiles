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
lvim.colorscheme = "tokyonight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-l>"] = ":bn<cr>"
lvim.keys.normal_mode["<C-h>"] = ":bp<cr>"
lvim.keys.normal_mode["<C-j>"] = ":bd<cr>"

-- unmap a default keymapping
lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

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
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
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
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- vim.api.nvim_exec([[ :highlight Normal guibg=none ]], false)
-- vim.api.nvim_exec([[ :highlight NonText guibg=none ]], false)
-- vim.api.nvim_eval(expr: :highlight Normal guibg=none)


-- autocmd ColorScheme * highlight Normal guibg=none
-- autocmd ColorScheme * highlight NonText guibg=none
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

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  -- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  -- { "BufWinEnter", "*.js", "setlocal ts=4 sw=4" },
  -- { "InsertEnter", "*", ":normal zz" },
  { "BufWinEnter", "*.*", "setlocal foldmethod=indent" },
}

vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'ff', "<cmd>lua require'hop'.hint_words({ })<cr>", {})
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", {})

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
  -- { 'lewis6991/gitsigns.nvim' },
  { 'onsails/lspkind.nvim' },
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
  { 'morhetz/gruvbox' },
  { 'Rigellute/shades-of-purple.vim' },
  { "p00f/nvim-ts-rainbow" },
  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end
  },
  {
    'declancm/cinnamon.nvim',
    config = function()
      require('cinnamon').setup {
        extra_keymaps = true,
        default_keymaps = true,
        centered = true,
      }
    end
  },
  { "yamatsum/nvim-cursorline" },
  { 'norcalli/nvim_utils' },
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' },
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
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  { "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  },
  { 'ojroques/nvim-hardline',
    requires = "lewis6991/gitsigns.nvim"
  },
  { 'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    'famiu/bufdelete.nvim'
  },
  -- {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup {
  --       log_level = 'info',
  --       auto_session_suppress_dirs = { '~/' },
  --       auto_session_use_git_branch = true,
  --     }
  --   end
  -- },
  -- {
  --   'wfxr/minimap.vim',
  --   run = "cargo install --locked code-minimap",
  --   -- cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  --   config = function()
  --     vim.cmd("let g:minimap_width = 10")
  --     vim.cmd("let g:minimap_auto_start = 1")
  --     vim.cmd("let g:minimap_auto_start_win_enter = 1")
  --   end,
  -- }
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

-- require('hardline').setup({
--   sections = {
--     { class = 'session', item = require('auto-session-library').current_session_name }
--   }
-- })

-- require('lualine').setup {
--   sections = { lualine_c = { require('auto-session-library').current_session_name } }
-- }

require("nvim-treesitter.configs").setup {
  -- highlight = {
  -- },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require("nvim-gps").setup()
local gps = require("nvim-gps")

require('hardline').setup {
  bufferline = false, -- enable bufferline
  bufferline_settings = {
    exclude_terminal = false, -- don't show terminal buffers in bufferline
    show_index = false, -- show buffer indexes (not the actual buffer numbers) in bufferline
  },
  theme = 'default', -- change theme
  sections = { -- define sections
    { class = 'mode', item = require('hardline.parts.mode').get_item },
    { class = 'med', item = require('hardline.parts.git').get_item, hide = 100 },
    { class = 'high', item = require('hardline.parts.filename').get_item },
    { class = 'med', item = gps.get_location, cond = gps.is_available },
    '%<',
    { class = 'med', item = '%=' },
    { class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100 },
    { class = 'error', item = require('hardline.parts.lsp').get_error },
    { class = 'warning', item = require('hardline.parts.lsp').get_warning },
    { class = 'warning', item = require('hardline.parts.whitespace').get_item },
    { class = 'high', item = require('hardline.parts.filetype').get_item, hide = 60 },
    -- { class = 'med', item = require('auto-session-library').current_session_name },
    { class = 'mode', item = require('hardline.parts.line').get_item },
  },
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

require("flutter-tools").setup {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  flutter_lookup_cmd = "asdf where flutter",
}

require("telescope").load_extension("flutter")


-- require('neoscroll').setup({
--   -- All these keys will be mapped to their corresponding default scrolling animation
--   mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
--     '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
--   hide_cursor = true, -- Hide cursor while scrolling
--   stop_eof = true, -- Stop at <EOF> when scrolling downwards
--   use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
--   respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
--   cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
--   easing_function = nil, -- Default easing function
--   pre_hook = nil, -- Function to run before the scrolling animation starts
--   post_hook = nil, -- Function to run after the scrolling animation ends
--   performance_mode = false,
-- })

-- require('gitsigns').setup()

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
