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
lvim.colorscheme = "catppuccin"
lvim.transparent_window = true

-- lvim.builtin.dap.active = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping


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
lvim.builtin.nvimtree.show_icons.git = 1

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
  set nofoldenable
  set foldlevel=99
]])

-- keymappings hop
lvim.builtin.which_key.mappings['r'] = {
  name = "Hop",
  w = { "<cmd>:HopWord<CR>", "Search by Word" },
  e = { "<cmd>:HopPattern<CR>", "Search by Pattern" },
  f = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", "After Cursor" },
  F = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", "Before Cursor" },
}

-- lvim.builtin.which_key.mappings['s']['e'] = { "<cmd>lua require('spectre').open()<cr>", "Spectre" }

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
--   pattern = { "*" },
--   command = ":normal zz",
-- })

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
lvim.lsp.automatic_servers_installation = false
lvim.lsp.document_highlight = true
lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "after", "ftplugin")

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

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "dartls" })

-- Additional Plugins
lvim.plugins = {
  -- THEMES
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", as = "catppuccin" },
  -- { 'tiagovla/tokyodark.nvim' },
  -- { "rebelot/kanagawa.nvim" },
  -- { 'cpea2506/one_monokai.nvim' },
  -- { 'shaunsingh/nord.nvim' },
  -- { 'shaunsingh/moonlight.nvim' },
  -- { 'bluz71/vim-nightfly-guicolors' },
  -- { 'morhetz/gruvbox' },
  -- { 'Rigellute/shades-of-purple.vim' },
  -- { 'Mofiqul/dracula.nvim' },
  -- { "sainnhe/sonokai" },
  -- { 'yashguptaz/calvera-dark.nvim' },
  -- { "rafamadriz/neon" },
  -- { "RRethy/nvim-base16" },
  -- { 'Soares/base16.nvim' },
  -- PLUGINS
  {
    "sindrets/diffview.nvim",
    requires = 'nvim-lua/plenary.nvim'
  },
  {
    'simrat39/symbols-outline.nvim'
  },
  -- { "yamatsum/nvim-cursorline" },
  -- { "RRethy/vim-illuminate" },
  { "p00f/nvim-ts-rainbow" },
  { 'onsails/lspkind.nvim' },
  { 'norcalli/nvim_utils' },
  { 'famiu/bufdelete.nvim' },
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  { "gfeiyou/command-center.nvim" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'mg979/vim-visual-multi', branch = "master" },
  -- {
  --   "andymass/vim-matchup",
  --   event = "CursorMoved",
  --   config = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- },
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
  },
  {
    "karb94/neoscroll.nvim",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup {
        ---@diagnostic disable-next-line: missing-parameter
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
    "lukas-reineke/indent-blankline.nvim",
    config = function()
    end
  },
  -- {
  --   'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp',
  --   config = function()
  --     local tabnine = require('cmp_tabnine.config')
  --     tabnine:setup({
  --       max_lines = 1000;
  --       max_num_results = 20;
  --       sort = true;
  --       run_on_every_keystroke = true;
  --       snippet_placeholder = '..';
  --       ignored_file_types = {
  --         -- uncomment to ignore in lua:
  --         -- lua = true
  --         html = true
  --       };
  --       show_prediction_strength = false;
  --     })
  --   end
  -- },
}

-- CINNAMON
-- require('cinnamon').setup {
--   default_keymaps = true,
--   extra_keymaps = true,
--   centered = false,
--   -- scroll_limit = 300,
--   default_delay = 3,
-- }

-- vim.cmd [[
--   nnoremap <PageUp> <C-b>
--   nnoremap <PageDown> <C-f>
-- ]]

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

vim.cmd [[
  au BufRead,BufNewFile *.* hi IndentBlanklineContextChar guifg=grey gui=nocombine
]]

require("indent_blankline").setup {
  char = '|',
  char_blankline = '┊',
  -- char_list = { '|', '¦', '┆', '┊' },
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = false,
  show_first_indent_level = true,
  filetype_exclude = { "help", "terminal", "dashboard", "man", "checkhealth", "packer" },
  buftype_exclude = { "terminal", "nofile", "quickfix" },
  show_trailing_blankline_indent = false,
}

require('neoscroll').setup({
  easing_function = "quadratic",
  mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', '<PageUp>', 'PageDown', },
  performance_mode = true,
})

vim.g.symbols_outline = {
  auto_preview = false,
  preview_bg_highlight = "Pmenu",
  highlight_hovered_item = true,
}

-- RAINBOW
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.extended_mode = true

-- LUALINE
require("nvim-gps").setup()
local gps = require("nvim-gps")

vim.g.tokyonight_style = "storm"
vim.g.catppuccin_flavour = "mocha"

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
lvim.builtin.lualine.options.theme = "tokyonight"

local opts = {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },

    file_browser = {
      -- hidden = true,
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
  -- tele.load_extension("flutter")
  -- tele.setup(opts.extensions)
  -- require('telescope').setup(lvim.builtin.telescope)
end

lvim.builtin.which_key.mappings['l']['K'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" }

vim.cmd [[
  au BufRead,BufNewFile Fastfile set filetype=ruby
  set cmdheight=1
]]


local command_center = require("command_center")
-- local noremap = { noremap = true }
-- local silent_noremap = { noremap = true, silent = true }


-- lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
-- lvim.keys.normal_mode["<C-l>"] = ":bn<CR>"
-- lvim.keys.normal_mode["<C-h>"] = ":bp<CR>"
-- lvim.keys.normal_mode["<M-w>"] = ":tabclose<CR>"
-- lvim.keys.normal_mode["<C-j>"] = ":bd<cr>"

-- unmap a default keymapping
lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

command_center.add({
  {
    description = "Save File",
    cmd = "<CMD>w <CR>",
    keybindings = { "n", "<C-s>" },
  },
  {
    description = "Buffer Next",
    cmd = "<CMD>:bn<CR>",
    keybindings = { "n", "<C-l>" },
  },
  {
    description = "Buffer Previous",
    cmd = "<CMD>:bp<CR>",
    keybindings = { "n", "<C-h>" },
  },
  {
    description = "Tab Close",
    cmd = "<CMD>:tabclose<CR>",
    keybindings = { "n", "<M-w>" },
  },
  {
    description = "Exit Vim",
    cmd = "<CMD>:q<CR>",
    keybindings = { "n", "<C-q>" },
  },
  {
    description = "Find files",
    cmd = "<CMD>Telescope find_files<CR>",
  },
  {
    description = "Search inside current buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
  },
  {
    description = "Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
  },
  {
    description = "Show document symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
  },
  {
    description = "Code Actions",
    cmd = "<CMD>lua vim.lsp.buf.code_action()<CR>",
  },
  {
    description = "LSP Hover",
    cmd = "<cmd>lua vim.lsp.buf.hover()<cr>",
    keybindings = { "n", "K" }
  },
  {
    description = "Telescope File Explorer",
    cmd = "<CMD>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
  },
  {
    description = "Telescope File Browser",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
  },
  {
    description = "Telescope Search Word",
    cmd = "<CMD>lua require('telescope.builtin').live_grep()<CR>",
  },
  {
    description = "Telescope git Files",
    cmd = "<CMD>lua require('telescope.builtin').git_files()<CR>",
  },
  {
    description = "Telescope Files",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
  },
  {
    description = "Telescope Buffers",
    cmd = "<CMD>lua require('telescope.builtin').buffers()<CR>",
  },
  {
    description = "Telescope Keymaps",
    cmd = "<CMD>lua require('telescope.builtin').keymaps()<CR>"
  },
  {
    description = "Check Health",
    cmd = "<CMD>checkhealth<CR>",
  },
  {
    description = "Update LunarVim",
    cmd = "<CMD>LvimUpdate<CR>",
  },
  {
    description = "View Notification",
    cmd = "<cmd>Telescope notify<cr>",
  },
  {
    description = "Reload LunarVim's configuration",
    cmd = "<cmd>LvimReload<cr>",
  },
  {
    description = "Open Config File",
    cmd = "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>"
  },
  {
    description = "Git - History",
    cmd = "<CMD>:DiffviewFileHistory<CR>",
  },
  {
    description = "Git - Diff",
    cmd = "<CMD>:DiffviewOpen<CR>",
  },
  {
    description = "Surround with \"",
    cmd = "ciw\"\"<Esc>P",
    keybindings = { "n", "cs\"" },
  },
  {
    description = "Surround with \'",
    cmd = "ciw''<Esc>P",
    keybindings = { "n", "cs'" },
  },
  {
    description = "Unsurround",
    cmd = "mpeld bhd `ph",
    keybindings = { "n", "csd" }
  },
  {
    description = "Outline",
    cmd = "<CMD>SymbolsOutline<CR>",
  },
  {
    description = "NvimTree - Toggle",
    cmd = "<CMD>:NvimTreeToggle<CR>",
    keybindings = { "n", "<M-b>" }
  },

  {
    description = "NvimTree - Find File",
    cmd = "<CMD>:NvimTreeFindFile<CR>",
  }
})

-- local dap = require('dap')
-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js" }
-- }

-- dap.configurations.javascript = { -- change this to javascript if needed
--   {
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   }
-- }

-- local api = vim.api
-- local keymap_restore = {}
-- dap.listeners.after['event_initialized']['me'] = function()
--   for _, buf in pairs(api.nvim_list_bufs()) do
--     local keymaps = api.nvim_buf_get_keymap(buf, 'n')
--     for _, keymap in pairs(keymaps) do
--       if keymap.lhs == "K" then
--         table.insert(keymap_restore, keymap)
--         api.nvim_buf_del_keymap(buf, 'n', 'K')
--       end
--     end
--   end
--   api.nvim_set_keymap(
--     'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
-- end

-- dap.listeners.after['event_terminated']['me'] = function()
--   for _, keymap in pairs(keymap_restore) do
--     api.nvim_buf_set_keymap(
--       keymap.buffer,
--       keymap.mode,
--       keymap.lhs,
--       keymap.rhs,
--       { silent = keymap.silent == 1 }
--     )
--   end
--   keymap_restore = {}
-- end

lvim.builtin.alpha.dashboard.section.header.val = {
  "                                      ",
  "                  ▄                   ",
  "                ▄▄▄▄▄                 ",
  "              ▄▄▄▄▄▄▄▄▄               ",
  "           ▗  ▄▄▄▄▄▄▄▄▄  ▖            ",
  "          ▄▄▄   ▄▄▄▄▄   ▄▄▄           ",
  "        ▄▄▄▄▄▄▄   ▄   ▄▄▄▄▄▄▄         ",
  "      ▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄       ",
  "    ▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄     ",
  "  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ",
  "                                      ",
  "           C Y B E R D Y N E          ",
  "               SYSTEMS                ",
}
