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
lvim.colorscheme = "tokyonight"

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
lvim.builtin.which_key.mappings["e"] = { "<cmd>Telescope file_browser<CR>", "Telescope Explorer" }
lvim.builtin.which_key.mappings["s"]["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["s"]["E"] = { "<cmd>Telescope file_browser<CR>", "Telescope Explorer" }

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
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = { "*" },
  command = ":normal zz",
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = { "*.*" },
  command = "setlocal foldmethod=indent"
})

vim.api.nvim_set_keymap('n', 'ff', ":HopWord<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fp', ":HopPattern<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fd', "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fs', ":HopLineStart<cr>", { silent = true })
vim.api.nvim_set_keymap('n', 'fl', ":HopLine<cr>", { silent = true })

vim.api.nvim_set_keymap('n', '<C-p>', ":Telescope find_files<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<C-M-p>', ":Telescope command_center<CR>", { silent = true })

vim.opt.timeoutlen = 500

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true
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
  -- THEMES
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
  { 'Mofiqul/dracula.nvim' },
  { "p00f/nvim-ts-rainbow" },
  { "sainnhe/sonokai" },
  -- PLUGINS
  -- { "yamatsum/nvim-cursorline" },
  { "RRethy/vim-illuminate" },
  { 'norcalli/nvim_utils' },
  { 'famiu/bufdelete.nvim' },
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  { "gfeiyou/command-center.nvim" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'mg979/vim-visual-multi', branch = "master" },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
    end,
    requires = { "tami5/sqlite.lua" }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
    end,
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
        ignored_file_types = {
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
  extra_keymaps = false,
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

-- require('nvim-cursorline').setup {
--   cursorline = {
--     enable = true,
--     timeout = 1000,
--     number = false,
--   },
--   cursorword = {
--     enable = true,
--     min_length = 3,
--     hl = { underline = true },
--   }
-- }

local opts = {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },

    file_browser = {
      hidden = true,
      respect_gitignore = false,
    },
    frecency = {
      show_scores = true,
      -- devicons_disabled = true,
      workspaces = {
        ["conf"] = "/Users/dlani/.config/",
        ["projects"] = "/Volumes/Workspace/",
        ["achievemore"] = "/Volumes/Workspace/achievemore/",
        ["crypto"] = "/Volumes/Workspace/crypto/"
      }
    }
  }
}
lvim.builtin.telescope.extensions = vim.tbl_extend("force", lvim.builtin.telescope.extensions, opts.extensions)

-- Plugins
lvim.builtin.telescope.on_config_done = function(tele)
  tele.load_extension('command_center')
  tele.load_extension("frecency")
  tele.load_extension("file_browser")
  tele.load_extension("ui-select")
  -- tele.setup(opts.extensions)
  -- require('telescope').setup(lvim.builtin.telescope)
end

-- LSP Config
--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require 'lspconfig'.jsonls.setup {
--   capabilities = capabilities,
--   cmd = { "/Users/dlani/.asdf/shims/vscode-json-languageserver", "--stdio" }
-- }

-- require 'lspconfig'.dartls.setup {
--   cmd = { "dart", "/Users/dlani/.asdf/installs/flutter/2.10.4-stable/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" }
-- }

-- require 'lspconfig'.rome.setup {}
require 'lspconfig'.tsserver.setup {}

lvim.builtin.which_key.mappings['l']['K'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" }

vim.cmd [[
  au BufRead,BufNewFile Fastfile set filetype=ruby
  set cmdheight=1
]]


local command_center = require("command_center")
local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

command_center.add({
  { description = "Save File",
    cmd = "<CMD>w <CR>",
  },
  { description = "Find files",
    cmd = "<CMD>Telescope find_files<CR>",
  },
  { description = "Search inside current buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
  },
  { description = "Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
  },
  { description = "Show document symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
  },
  { description = "Code Actions",
    cmd = "<CMD>lua vim.lsp.buf.code_action()<CR>",
  },
  { description = "Telescope File Explorer",
    cmd = "<CMD>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
  },
  { description = "Telescope File Browser",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
  },
  { description = "Telescope Search Word",
    cmd = "<CMD>lua require('telescope.builtin').live_grep()<CR>",
  },
  { description = "Telescope git Files",
    cmd = "<CMD>lua require('telescope.builtin').git_files()<CR>",
  },
  { description = "Telescope Files",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
  },
  { description = "Telescope Buffers",
    cmd = "<CMD>lua require('telescope.builtin').buffers()<CR>",
  },
  { description = "Telescope Keymaps",
    cmd = "<CMD>lua require('telescope.builtin').keymaps()<CR>"
  },
  { description = "Check Health",
    cmd = "<CMD>checkhealth<CR>",
  },
  { description = "Update LunarVim",
    cmd = "<CMD>LvimUpdate<CR>",
  },
  { description = "View Notification",
    cmd = "<cmd>Telescope notify<cr>",
  },
  { description = "Reload LunarVim's configuration",
    cmd = "<cmd>LvimReload<cr>",
  },
  { description = "Open Config File",
    cmd = "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>"
  }
}, command_center.mode.ADD_ONLY)
