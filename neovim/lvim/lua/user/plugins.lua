-- Additional Plugins
lvim.plugins = {
  { '/usr/local/opt/fzf' },
  -- THEMES
  { "lunarvim/colorschemes" },
  { "luisiacc/gruvbox-baby", branch = "main" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    requires = 'nvim-lua/plenary.nvim'
  },
  { 'simrat39/symbols-outline.nvim' },
  {
    "machakann/vim-sandwich",
    -- event = "BufRead",
  },
  {
    'sunaku/tmux-navigate',
  },
  {
    'rcarriga/nvim-notify'
  },
  { 'onsails/lspkind.nvim' },
  { 'norcalli/nvim_utils' },
  { 'famiu/bufdelete.nvim' },
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  { "gfeiyou/command-center.nvim" },
  { 'mg979/vim-visual-multi', branch = "master" },
  { "karb94/neoscroll.nvim", },
  { 'anuvyklack/pretty-fold.nvim' },
  { 'anuvyklack/fold-preview.nvim', requires = 'anuvyklack/keymap-amend.nvim', },
  { "klen/nvim-test" },
  { "klen/nvim-config-local" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } },
  { "nvim-telescope/telescope-file-browser.nvim", },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "p00f/nvim-ts-rainbow" },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup {
        enable = true,
        throttle = false,
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
  {
    'nacro90/numb.nvim',
    event = "BufRead",
    config = function()
      require('numb').setup({
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      })
    end
  },
  {
    'phaazon/hop.nvim',
    event = "BufRead",
    branch = 'v2',
    config = function()
      require 'hop'.setup {}
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
    'tzachar/cmp-tabnine',
    run = './install.sh',
    requires = 'hrsh7th/nvim-cmp',
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
  -- {
  --   'crusj/bookmarks.nvim',
  --   branch = 'main',
  --   requires = { 'kyazdani42/nvim-web-devicons' }
  -- },
  {
    "ghillb/cybu.nvim",
    branch = "main", -- timely updates
    -- branch = "v1.x", -- won't receive breaking changes
    requires = { "kyazdani42/nvim-web-devicons" }, -- optional
    config = function()
      local ok, cybu = pcall(require, "cybu")
      if not ok then
        return
      end
    end,
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
    end
  },
  -- { "anuvyklack/hydra.nvim" },
  -- {
  --   'wthollingsworth/pomodoro.nvim',
  --   requires = 'MunifTanjim/nui.nvim',
  --   config = function()
  --     require('pomodoro').setup({
  --       time_work = 25,
  --       time_break_short = 5,
  --       time_break_long = 20,
  --       timers_to_long_break = 4
  --     })
  --   end
  -- },
  -- { "szw/vim-maximizer" },
}
