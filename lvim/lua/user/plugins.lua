-- Additional Plugins
lvim.plugins = {
  -- THEMES
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", as = "catppuccin" },
  { 'morhetz/gruvbox' },
  { "RRethy/nvim-base16" },
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
    "Djancyp/cheat-sheet",
    config = function()
      require("cheat-sheet").setup({
        auto_fill = {
          filetype = true,
          current_word = true,
        },

        main_win = {
          style = "minimal",
          border = "double",
        },

        input_win = {
          style = "minimal",
          border = "double",
        },
      })
    end
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
  {
    "machakann/vim-sandwich",
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
