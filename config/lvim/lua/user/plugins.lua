-- Additional Plugins
lvim.plugins = {
  -- THEMES
  { dir = '~/.dotfiles/themes/vim/',               name = "themer" },
  { "olimorris/onedarkpro.nvim",                   priority = 1000 },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { "luisiacc/gruvbox-baby",                       branch = "main" },
  { 'shaunsingh/nord.nvim' },
  -- { 'ramojus/mellifluous.nvim',        dependencies = 'rktjmp/lush.nvim' },
  -- { 'titanzero/zephyrium' },
  -- { 'folke/tokyonight.nvim',         branch = 'main' },
  -- { "catppuccin/nvim",                 name = "catppuccin" },
  -- { "casonadams/walh" },
  -- { 'olivercederborg/poimandres.nvim' },

  -- PLUGINS
  { dir = '/usr/local/opt/fzf' },
  { 'anuvyklack/pretty-fold.nvim' },
  { "klen/nvim-test" },
  { "klen/nvim-config-local" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim", },
  { 'sunaku/tmux-navigate' },
  { 'norcalli/nvim_utils' },
  { 'famiu/bufdelete.nvim' },
  { "gfeiyou/command-center.nvim" },
  { "MattesGroeger/vim-bookmarks" },
  { 'simrat39/symbols-outline.nvim',               lazy = true },
  { "nvim-telescope/telescope-frecency.nvim",      dependencies = { "tami5/sqlite.lua" } },
  { "folke/trouble.nvim",                          cmd = "TroubleToggle", },
  { 'mg979/vim-visual-multi',                      branch = "master" },
  { 'anuvyklack/fold-preview.nvim',                dependencies = 'anuvyklack/keymap-amend.nvim', },
  { "folke/todo-comments.nvim",                    dependencies = "nvim-lua/plenary.nvim", },
  -- { "mrjones2014/nvim-ts-rainbow", },
  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = 'nvim-lua/plenary.nvim'
  },
  -- Git Blame plugin for Neovim written in Lua
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
  {
    "folke/twilight.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("twilight").setup {}
    end
  },
  -- Surround text like a boss
  {
    "machakann/vim-sandwich",
    lazy = true,
    event = "BufRead",
  },
  -- Beatiful notifcations
  {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify') end
  },
  -- session management
  {
    'shatur/neovim-session-manager',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('session_manager').setup {
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
        -- autosave_only_in_session = true,
      }
    end
  },
  -- Scroll with motion
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', '<PageUp>', 'PageDown', },
        -- performance_mode = true,
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        -- easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  -- auto close html tags
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- awsome show context on top
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup {
        enable = true,
        throttle = true,
        max_lines = 0,
        -- mode = 'topline',
        patterns = {
          default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
          },
        },
      }
    end
  },
  -- toggle kinds of code
  {
    'ckolkey/ts-node-action',
    lazy = true,
    dependencies = { 'nvim-treesitter' },
    config = function()
      require("ts-node-action").setup({})
    end
  },
  {
    'nacro90/numb.nvim',
    lazy = true,
    event = "BufRead",
    config = function()
      require('numb').setup({
        show_numbers = true,
        show_cursorline = true,
      })
    end
  },
  -- like easymotion but better
  {
    'phaazon/hop.nvim',
    lazy = true,
    event = "BufRead",
    branch = 'v2',
    config = function()
      require 'hop'.setup {}
    end
  },
  -- show progress of search
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
    end
  },
  -- better scrollbar
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
    end
  },
  -- TabNine plugin for hrsh7th/nvim-cmp
  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      local tabnine = require('cmp_tabnine.config')
      tabnine:setup({
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = '..',
        ignored_file_types = {
          html = true
        },
        show_prediction_strength = false,
      })
    end
  },
  -- Neovim plugin that offers context when cycling buffers in the form of a customizable notification window.
  {
    "ghillb/cybu.nvim",
    branch = "main", -- timely updates
    -- branch = "v1.x", -- won't receive breaking changes
    -- dependencies = { "kyazdani42/nvim-web-devicons" }, -- optional
    config = function()
      local ok, cybu = pcall(require, "cybu")
      if not ok then
        return
      end
    end,
  },
  -- flutter equipments
  {
    'akinsho/flutter-tools.nvim',
    lazy = true,
    ft = { 'dart', 'pubspec.yaml' },
  },
  -- A task runner and job management plugin for Neovim
  {
    'stevearc/overseer.nvim',
    config = function()
      require('overseer').setup({
        task_list = {
          direction = "right",
          default_detail = 2,
        }
      })
    end
  },
  -- Treesitter based structural search and replace plugin for Neovim.
  {
    "cshuaimin/ssr.nvim",
    -- module = "ssr",
    -- Calling setup is optional.
    config = function()
      require("ssr").setup {
        min_width = 50,
        min_height = 5,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_all = "<cr>",
        },
      }
    end
  },

  -- LSP
  -- show icons from type on float window
  { 'onsails/lspkind.nvim' },
  -- shows function signature
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup {
        -- bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = 'rounded'
        },
        hint = false,
      }
    end
  },
  -- lsp status notification thing
  {
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup {} end
  },
}
