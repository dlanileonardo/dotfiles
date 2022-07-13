-- Additional Plugins
lvim.plugins = {
  -- THEMES
  -- { "lunarvim/colorschemes" },
  { "luisiacc/gruvbox-baby", branch = "main" },
  -- { "EdenEast/nightfox.nvim" },
  -- { "folke/tokyonight.nvim" },
  -- { 'glepnir/zephyr-nvim' },
  -- { "sainnhe/gruvbox-material" },
  -- { "sainnhe/sonokai" },
  -- { "catppuccin/nvim", as = "catppuccin" },
  -- { 'morhetz/gruvbox' },

  -- PLUGINS
  -- {
  --   'feline-nvim/feline.nvim',
  --   config = function()
  --   end
  -- },
  { "sindrets/diffview.nvim", requires = 'nvim-lua/plenary.nvim' },
  { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
  { 'simrat39/symbols-outline.nvim' },
  { "machakann/vim-sandwich" },
  { "RRethy/vim-illuminate" },
  { "p00f/nvim-ts-rainbow" },
  { 'onsails/lspkind.nvim' },
  { 'norcalli/nvim_utils' },
  { 'famiu/bufdelete.nvim' },
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  { "gfeiyou/command-center.nvim" },
  { 'mg979/vim-visual-multi', branch = "master" },
  { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" },
  { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim', },
  { "karb94/neoscroll.nvim", },
  { 'anuvyklack/pretty-fold.nvim', requires = 'anuvyklack/nvim-keymap-amend', },
  { "lukas-reineke/indent-blankline.nvim" },
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
    config = function()
      require('numb').setup()
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v1',
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
  -- { "github/copilot.vim" },
  {
    'crusj/bookmarks.nvim',
    branch = 'main',
    requires = { 'kyazdani42/nvim-web-devicons' }
  },
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
  }
}
