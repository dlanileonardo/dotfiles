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
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim", },
  { 'sunaku/tmux-navigate' },
  { 'norcalli/nvim_utils' },
  { 'famiu/bufdelete.nvim' },
  { "nvim-telescope/telescope-frecency.nvim",      dependencies = { "tami5/sqlite.lua" } },
  { "folke/trouble.nvim",                          cmd = "TroubleToggle", },
  { 'mg979/vim-visual-multi',                      branch = "master" },
  { "folke/todo-comments.nvim",                    dependencies = "nvim-lua/plenary.nvim", },
  -- { "mrjones2014/nvim-ts-rainbow", },

  -- ----------------------
  -- COMMAND CENTER
  -- ----------------------
  {
    "gfeiyou/command-center.nvim",
    config = function()
      vim.api.nvim_set_keymap('n', '<C-M-p>', ":Telescope command_center<CR>", { silent = true })
    end
  },

  -- ----------------------
  -- nvim-config-local
  -- ----------------------
  {
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        -- Default configuration (optional)
        config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
        hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
        silent = false, -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = false, -- Lookup config files in parent directories
      }
    end
  },

  -- ----------------------
  -- nvim-test
  -- ----------------------
  {
    "klen/nvim-test",
    config = function()
      lvim.builtin.which_key.mappings["y"] = {
        name = "NvimTests",
        f = { "<CMD>TestFile<CR>", "Test File" },
        s = { "<CMD>TestSuite<CR>", "Test Suite" },
        n = { "<CMD>TestNearest<CR>", "Test Nearest" },
      }
    end
  },


  -- ----------------------
  -- vim-bookmarks
  -- ----------------------
  {
    "MattesGroeger/vim-bookmarks",
    config = function()
      lvim.builtin.which_key.mappings["B"] = {
        name = "Bookmark",
        t = { "<cmd>BookmarkToggle<CR>", "Toggle" },
        i = { "<cmd>BookmarkAnnotate<CR>", "Annotate" },
        a = { "<cmd>BookmarkShowAll<CR>", "Show All" },
        j = { "<cmd>BookmarkNext<CR>", "Next" },
        k = { "<cmd>BookmarkPrev<CR>", "Previous" },
        c = { "<cmd>BookmarkClear<CR>", "Clear" },
        x = { "<cmd>BookmarkClearAll<CR>", "CLear All" },
        kk = { "<cmd>BookmarkMoveUp<CR>", "Move Up" },
        jj = { "<cmd>BookmarkMoveDown<CR>", "Move Down" },
        g = { "<cmd>BookmarkMoveToLine<CR>", "Move to Line" },
      }
    end
  },

  -- ----------------------
  -- diffview
  -- ----------------------
  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = 'nvim-lua/plenary.nvim'
  },

  -- ----------------------
  -- git-blame
  -- ----------------------
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

  -- ----------------------
  -- twilight
  -- ----------------------
  -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
  {
    "folke/twilight.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("twilight").setup {}
    end
  },

  -- ----------------------
  -- vim-sandwich
  -- ----------------------
  -- Surround text like a boss
  {
    "machakann/vim-sandwich",
    lazy = true,
    event = "BufRead",
  },

  -- ----------------------
  -- nvim-notify
  -- ----------------------
  -- Beautiful notifcations
  {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify') end
  },

  -- ----------------------
  -- auto-session
  -- ----------------------
  -- session management
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        -- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },

  -- ----------------------
  -- neoscroll
  -- ----------------------
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

  -- ----------------------
  -- nvim-ts-autotag
  -- ----------------------
  -- auto close html tags
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- ----------------------
  -- nvim-treesitter-context
  -- ----------------------
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

  -- ----------------------
  -- ts-node-action
  -- ----------------------
  -- toggle kinds of code
  {
    'ckolkey/ts-node-action',
    lazy = true,
    dependencies = { 'nvim-treesitter' },
    config = function()
      require("ts-node-action").setup({})
    end
  },


  -- ----------------------
  -- numb.nvim
  -- ----------------------
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

  -- ----------------------
  -- hop.nvim
  -- ----------------------
  -- like easymotion but better
  {
    'phaazon/hop.nvim',
    lazy = true,
    event = "BufRead",
    branch = 'v2',
    config = function()
      require 'hop'.setup {}

      lvim.builtin.which_key.mappings['r'] = {
        name = "Hop",
        w = { "<cmd>HopWord<CR>", "Search by Word" },
        e = { "<cmd>HopPattern<CR>", "Search by Pattern" },
        f = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
          "After Cursor" },
        F = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
          "Before Cursor" },
        d = { "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", "Jump to Word" },
      }
    end
  },

  -- ----------------------
  -- pretty-fold.nvim
  -- ----------------------
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({
        -- keep_indentation = true,
        fill_char = '-',
        sections = {
          left = {
            'content', ' |-'
          },
          right = {
            '-| ', 'number_of_folded_lines', ': ', 'percentage', ' |-',
          }
        }
      })
    end
  },

  -- ----------------------
  -- fold-preview.nvim
  -- ----------------------
  {
    'anuvyklack/fold-preview.nvim',
    dependencies = 'anuvyklack/keymap-amend.nvim',
    config = function()
      require('fold-preview').setup()
    end
  },

  -- ----------------------
  -- nvim-hlslens
  -- ----------------------
  -- show progress of search
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
    end
  },

  -- ----------------------
  -- nvim-scrollbar
  -- ----------------------
  -- better scrollbar
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
    end
  },

  -- ----------------------
  -- cmp-tabnine
  -- ----------------------
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

  -- ----------------------
  -- cmp-fuzzy-buffer
  -- ----------------------
  -- {
  --   'tzachar/cmp-fuzzy-buffer',
  --   dependencies = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' },
  --   config = function()
  --     lvim.builtin.cmp.sources = vim.tbl_extend("force", lvim.builtin.cmp.sources, {
  --       { name = "fuzzy_buffer" }
  --     })
  --   end
  -- },
  -- {

  -- ----------------------
  -- tabnine-nvim
  -- ----------------------
  --   'codota/tabnine-nvim', build = "./dl_binaries.sh",
  --   config = function()
  --     require('tabnine').setup({
  --       disable_auto_comment = true,
  --       accept_keymap = "<C-y>",
  --       dismiss_keymap = "<C-]>",
  --       debounce_ms = 800,
  --       suggestion_color = { gui = "#808080", cterm = 244 },
  --       exclude_filetypes = { "TelescopePrompt" }
  --     })
  --   end
  -- },

  -- ----------------------
  -- cybu.nvim
  -- ----------------------
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

      require("cybu").setup({
        position = {
          relative_to = "editor",
          anchor = "topcenter",
          vertical_offset = 3,
        },
        style = {
          border = "rounded",
          padding = 7,
          hide_buffer_id = true,
        },
        behavior = {
          mode = {
            default = {
              switch = "immediate",
              view = "paging"
            }
          }
        }
      })

      vim.keymap.set({ "n", "v" }, "<M-s-tab>", "<plug>(CybuLastusedPrev)")
      vim.keymap.set({ "n", "v" }, "<M-tab>", "<plug>(CybuLastusedNext)")
    end,
  },

  -- ----------------------
  -- flutter-tools.nvim
  -- ----------------------
  -- flutter equipments
  {
    'akinsho/flutter-tools.nvim',
    lazy = true,
    ft = { 'dart', 'pubspec.yaml' },
  },

  -- ----------------------
  -- overseer.nvim
  -- ----------------------
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

  -- ----------------------
  -- ssr.nvim
  -- ----------------------
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

  -- ----------------------
  -- goto-preview
  -- ----------------------
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        default_mappings = false,
        width = 120,
        height = 25,
        debug = false,
      }
    end
  },

  -- LSP
  -- ----------------------
  -- lspkind
  -- ----------------------
  -- show icons from type on float window
  { 'onsails/lspkind.nvim' },

  -- ----------------------
  -- inc-rename.nvim
  -- ----------------------
  -- {
  --   "smjonas/inc-rename.nvim",
  --   lazy = true,
  --   event = "BufRead",
  --   config = function()
  --     require("inc_rename").setup()
  --     lvim.builtin.which_key.mappings['l']['R'] = { ":IncRename ", "Inc Rename" }
  --   end,
  -- },

  -- ----------------------
  -- lsp_signature.nvim
  -- ----------------------
  -- shows function signature
  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require('lsp_signature').on_attach {
        -- bind = true, -- This is mandatory, otherwise border config won't get registered.
        -- handler_opts = {
        --   border = 'rounded'
        -- },
        hint = false,
      }
    end
  },

  -- ----------------------
  -- vim-cursorword
  -- ----------------------
  -- {
  --   "itchyny/vim-cursorword",
  --   event = { "BufEnter", "BufNewFile" },
  --   config = function()
  --     vim.api.nvim_command("augroup user_plugin_cursorword")
  --     vim.api.nvim_command("autocmd!")
  --     vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
  --     vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
  --     vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
  --     vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
  --     vim.api.nvim_command("augroup END")
  --   end
  -- },

  -- ----------------------
  -- fidget.nvim
  -- ----------------------
  -- lsp status notification thing
  {
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup {} end
  },

  -- ----------------------
  -- nvim_context_vt
  -- ----------------------
  {
    "haringsrob/nvim_context_vt",
    lazy = true,
    event = "BufRead",
    config = function()
      require('nvim_context_vt').setup({
        enabled = false,
      })
    end
  },

  -- ----------------------
  -- symbols-outline.nvim
  -- ----------------------
  {
    'simrat39/symbols-outline.nvim',
    lazy = true,
    event = "BufRead",
    config = function()
      require("symbols-outline").setup({
        auto_preview = false,
        preview_bg_highlight = "Pmenu",
        highlight_hovered_item = true,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { "q" },
        },
      })
    end
  },

  -- ----------------------
  -- lsp_lines.nvim
  -- ----------------------
  -- {
  --   url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --     vim.diagnostic.config({
  --       virtual_lines = { only_current_line = true }
  --     })
  --   end,
  -- }
}
