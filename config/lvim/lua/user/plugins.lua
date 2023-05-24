-- Additional Plugins
lvim.plugins = {
  -- THEMES
  -- { dir = '~/.dotfiles/themes/vim/',               name = "themer" },
  { "olimorris/onedarkpro.nvim",                   priority = 1000 },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { "luisiacc/gruvbox-baby",                       branch = "main" },
  -- { 'shaunsingh/nord.nvim' },
  -- { 'ramojus/mellifluous.nvim',        dependencies = 'rktjmp/lush.nvim' },
  -- { 'titanzero/zephyrium' },
  -- { 'folke/tokyonight.nvim',         branch = 'main' },
  -- { "catppuccin/nvim",                 name = "catppuccin" },
  -- { "casonadams/walh" },
  -- { 'olivercederborg/poimandres.nvim' },

  -- PLUGINS
  { dir = '/usr/local/opt/fzf' },

  -- ------------------------------------------------------------
  -- nvim-dap-vscode-js
  -- (https://github.com/mxsdev/nvim-dap-vscode-js)
  -- ------------------------------------------------------------
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   dependencies = { "mfussenegger/nvim-dap" }
  -- },

  -- ------------------------------------------------------------
  -- telescope-ui-select.nvim
  -- (https://github.com/nvim-telescope/telescope-ui-select.nvim)
  -- ------------------------------------------------------------
  { 'nvim-telescope/telescope-ui-select.nvim' },

  -- ------------------------------------------------------------
  -- telescope-live-grep-args.nvim
  -- (https://github.com/nvim-telescope/telescope-live-grep-args.nvim)
  -- ------------------------------------------------------------
  { "nvim-telescope/telescope-live-grep-args.nvim" },

  -- ------------------------------------------------------------
  -- telescope-file-browser.nvim
  -- (https://github.com/nvim-telescope/telescope-file-browser.nvim)
  -- ------------------------------------------------------------
  { "nvim-telescope/telescope-file-browser.nvim", },

  -- ------------------------------------------------------------
  -- telescope-frecency.nvim
  -- (https://github.com/nvim-telescope/telescope-frecency.nvim)
  -- ------------------------------------------------------------
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "tami5/sqlite.lua" }
  },

  -- ------------------------------------------------------------
  -- tmux-navigate
  -- (https://github.com/sunaku/tmux-navigate)
  -- ------------------------------------------------------------
  -- { 'sunaku/tmux-navigate' },

  {
    "aserowy/tmux.nvim",
    keys = {
      { "<C-h>", "<cmd>lua require('tmux').resize_left()<cr>" },
      { "<C-j>", "<cmd>lua require('tmux').resize_bottom()<cr>" },
      { "<C-k>", "<cmd>lua require('tmux').resize_top()<cr>" },
      { "<C-l>", "<cmd>lua require('tmux').resize_right()<cr>" },
    },
    opts = {}
  },

  -- ------------------------------------------------------------
  -- nvim_utils
  -- (https://github.com/norcalli/nvim_utils)
  -- ------------------------------------------------------------
  { 'norcalli/nvim_utils' },

  -- ------------------------------------------------------------
  -- bufdelete.nvim
  -- (https://github.com/famiu/bufdelete.nvim)
  -- ------------------------------------------------------------
  { 'famiu/bufdelete.nvim' },

  -- ------------------------------------------------------------
  -- trouble.nvim
  -- (https://github.com/folke/trouble.nvim)
  -- ------------------------------------------------------------
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  -- ------------------------------------------------------------
  -- vim-visual-multi
  -- (https://github.com/mg979/vim-visual-multi)
  -- ------------------------------------------------------------
  {
    'mg979/vim-visual-multi',
    branch = "master"
  },

  {
    'Bekaboo/deadcolumn.nvim',
    opts = {
      modes = { 'i', 'ic', 'ix', 'R', 'Rc', 'Rx', 'Rv', 'Rvc', 'Rvx' },
      blending = {
        threshold = 0.75,
        colorcode = '#000000',
        hlgroup = {
          'Normal',
          'background',
        },
      },
      warning = {
        alpha = 0.2,
        offset = 0,
        colorcode = '#FF0000',
        hlgroup = {
          'Error',
          'background',
        },
      },
    },
  },

  -- ------------------------------------------------------------
  -- nvim-ts-rainbow
  -- (https://github.com/mrjones2014/nvim-ts-rainbow)
  -- ------------------------------------------------------------
  -- { "mrjones2014/nvim-ts-rainbow", },

  -- ------------------------------------------------------------
  -- nvim-spider
  -- (https://github.com/chrisgrieser/nvim-spider)
  -- ------------------------------------------------------------
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      { "w",  "<cmd>lua require('spider').motion('w')<CR>",  desc = "Spider-w",  mode = { "n", "o", "x" } },
      { "e",  "<cmd>lua require('spider').motion('e')<CR>",  desc = "Spider-e",  mode = { "n", "o", "x" } },
      { "b",  "<cmd>lua require('spider').motion('b')<CR>",  desc = "Spider-b",  mode = { "n", "o", "x" } },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", desc = "Spider-ge", mode = { "n", "o", "x" } },
    },
  },

  -- ------------------------------------------------------------
  -- command-center.nvim
  -- (https://github.com/FeiyouG/command_center.nvim)
  -- ------------------------------------------------------------
  {
    "gfeiyou/command-center.nvim",
    lazy = false,
    keys = {
      { "<C-M-p>", ":Telescope command_center<CR>", desc = "Command Center" }
    },
    -- config = function()
    --   vim.api.nvim_set_keymap('n', '<C-M-p>', ":Telescope command_center<CR>", { silent = true })
    -- end
  },

  -- ------------------------------------------------------------
  -- nvim-config-local
  -- (https://github.com/klen/nvim-config-local)
  -- ------------------------------------------------------------
  {
    "klen/nvim-config-local",
    opts = {
      config_files = { ".vimrc.lua", ".vimrc" },            -- Config file patterns to load (lua supported)
      hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
      autocommands_create = true,                           -- Create autocommands (VimEnter, DirectoryChanged)
      commands_create = true,                               -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
      silent = false,                                       -- Disable plugin messages (Config loaded/ignored)
      lookup_parents = false,                               -- Lookup config files in parent directories
    },
  },

  -- ------------------------------------------------------------
  -- nvim-test
  -- (https://github.com/klen/nvim-test)
  -- ------------------------------------------------------------
  {
    "klen/nvim-test",
    lazy = true,
    init = function()
      lvim.builtin.which_key.mappings["y"] = { name = "NvimTests" }
    end,
    keys = {
      { "<leader>yf", "<CMD>TestFile<CR>",    desc = "Test File" },
      { "<leader>ys", "<CMD>TestSuite<CR>",   desc = "Test Suite" },
      { "<leader>yn", "<CMD>TestNearest<CR>", desc = "Test Nearest" },
    },
  },

  -- ------------------------------------------------------------
  -- vim-bookmarks
  -- (https://github.com/MattesGroeger/vim-bookmarks)
  -- ------------------------------------------------------------
  -- {
  --   "MattesGroeger/vim-bookmarks",
  --   lazy = false,
  --   init = function()
  --     lvim.builtin.which_key.mappings["B"] = { name = "Bookmarks" }
  --     -- vim.g.bookmark_auto_save = 1
  --     -- vim.g.bookmark_manage_per_buffer = 1
  --     vim.g.bookmark_auto_close = 1
  --   end,
  --   keys = {
  --     { "<leader>Bt",  "<cmd>BookmarkToggle<CR>",     desc = "Toggle" },
  --     { "<leader>Bi",  "<cmd>BookmarkAnnotate<CR>",   desc = "Annotate" },
  --     { "<leader>Ba",  "<cmd>BookmarkShowAll<CR>",    desc = "Show All" },
  --     { "<leader>Bj",  "<cmd>BookmarkNext<CR>",       desc = "Next" },
  --     { "<leader>Bk",  "<cmd>BookmarkPrev<CR>",       desc = "Previous" },
  --     { "<leader>Bc",  "<cmd>BookmarkClear<CR>",      desc = "Clear" },
  --     { "<leader>Bx",  "<cmd>BookmarkClearAll<CR>",   desc = "Clear All" },
  --     { "<leader>Bkk", "<cmd>BookmarkMoveUp<CR>",     desc = "Move Up" },
  --     { "<leader>Bjj", "<cmd>BookmarkMoveDown<CR>",   desc = "Move Down" },
  --     { "<leader>Bg",  "<cmd>BookmarkMoveToLine<CR>", desc = "Move to Line" },
  --     desc = "Bookmarks",
  --   },
  -- },

  -- ------------------------------------------------------------
  -- cutlass.nvim
  -- (https://github.com/gbprod/cutlass.nvim)
  -- ------------------------------------------------------------
  -- {
  --   "gbprod/cutlass.nvim",
  --   opts = {
  --     cut_key = "x",
  --     registers = {
  --       select = "s",
  --       delete = "d",
  --       change = "c",
  --     },
  --   },
  -- },

  -- ------------------------------------------------------------
  -- telescope-vim-bookmarks.nvim
  -- (https://github.com/tom-anders/telescope-vim-bookmarks.nvim)
  -- ------------------------------------------------------------
  -- {
  --   "tom-anders/telescope-vim-bookmarks.nvim"
  -- },

  -- {
  --   "crusj/bookmarks.nvim",
  --   init = function()
  --     require("bookmarks").setup({
  --       keymap = {
  --         toggle = "<tab><tab>",  -- Toggle bookmarks
  --         add = "\\z",            -- Add bookmarks
  --         jump = "<CR>",          -- Jump from bookmarks
  --         delete = "dd",          -- Delete bookmarks
  --         order = "<space><space>", -- Order bookmarks by frequency or updated_time
  --         delete_on_virt = "\\dd", -- Delete bookmark at virt text line
  --         show_desc = "\\sd",     -- show bookmark desc
  --       }
  --     })
  --   end
  -- },

  -- ------------------------------------------------------------
  -- diffview
  -- (https://github.com/sindrets/diffview.nvim)
  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  -- ------------------------------------------------------------
  {
    "sindrets/diffview.nvim",
    lazy = true,
    -- event = "BufRead",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", },
    dependencies = 'nvim-lua/plenary.nvim'
  },

  -- ------------------------------------------------------------
  -- git-blame
  -- (https://github.com/f-person/git-blame.nvim)
  -- Git Blame plugin for Neovim written in Lua
  -- ------------------------------------------------------------
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },

  -- ------------------------------------------------------------
  -- twilight
  -- (https://github.com/folke/twilight.nvim)
  -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
  -- ------------------------------------------------------------
  {
    "folke/twilight.nvim",
    lazy = true,
    keys = {
      { "<leader>Tt", "<cmd>Twilight<cr>", desc = "Twilight" },
    },
    opts = {},
  },

  -- ------------------------------------------------------------
  -- vim-sandwich
  -- (https://github.com/machakann/vim-sandwich)
  -- Surround text like a boss
  -- ------------------------------------------------------------
  -- {
  --   "machakann/vim-sandwich",
  --   lazy = true,
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd([[
  --       let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
  --     ]])
  --   end
  -- },

  -- ------------------------------------------------------------
  -- nvim-surround
  -- (https://github.com/kylechui/nvim-surround)
  -- Add/change/delete surrounding delimiter pairs with ease. Written in Lua.
  -- ------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "sa",
        delete = "sd",
        change = "sr",
      },
    }
  },

  -- ------------------------------------------------------------
  -- nvim-notify
  -- (https://github.com/rcarriga/nvim-notify)
  -- Beautiful notifcations
  -- ------------------------------------------------------------
  -- {
  --   'rcarriga/nvim-notify',
  --   config = function() vim.notify = require('notify') end
  -- },

  -- ------------------------------------------------------------
  -- auto-session
  -- (https://github.com/rmagatti/auto-session)
  -- session management
  -- ------------------------------------------------------------
  {
    'rmagatti/auto-session',
    opts = {
      auto_restore_enabled = true,
      log_level = "error",
    },
  },

  ------------------------------------------------------------
  -- workspaces.nvim
  -- (https://github.com/natecraddock/workspaces.nvim)
  -- workspaces
  ------------------------------------------------------------
  {
    "natecraddock/workspaces.nvim",
    opts = {
      auto_open = false,
      -- path = vim.fn.stdpath("data") .. "/workspaces",
      hooks = {
        open_pre = { "SessionSave", "bufdo bd" },
        open = { "SessionRestore" }
      },
    },
  },

  -- ------------------------------------------------------------
  -- neoscroll
  -- (https://github.com/karb94/neoscroll.nvim)
  -- Scroll with motion
  -- ------------------------------------------------------------
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    opts = {
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', '<PageUp>', 'PageDown', },
      -- performance_mode = true,
      hide_cursor = true,          -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      -- easing_function = nil, -- Default easing function
      pre_hook = nil,              -- Function to run before the scrolling animation starts
      post_hook = nil,             -- Function to run after the scrolling animation ends
    },
  },

  -- ------------------------------------------------------------
  -- nvim-ts-autotag
  -- (https://github.com/windwp/nvim-ts-autotag)
  -- auto close html tags
  -- ------------------------------------------------------------
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = "BufRead",
    opts = {}
  },

  -- ------------------------------------------------------------
  -- nvim-treesitter-context
  -- (https://github.com/nvim-treesitter/nvim-treesitter-context)
  -- awsome show context on top
  -- ------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
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
    },
  },

  -- ------------------------------------------------------------
  -- ts-node-action
  -- (https://github.com/CKolkey/ts-node-action)
  -- toggle kinds of code
  -- ------------------------------------------------------------
  {
    'ckolkey/ts-node-action',
    lazy = true,
    keys = {
      { "T", "<CMD>lua require('ts-node-action').node_action()<CR>", desc = "Node Action" },
    },
    dependencies = { 'nvim-treesitter' },
    opts = {}
  },


  -- ------------------------------------------------------------
  -- numb.nvim
  -- (https://github.com/nacro90/numb.nvim)
  -- ------------------------------------------------------------
  {
    'nacro90/numb.nvim',
    lazy = true,
    event = "BufRead",
    opts = {
      show_numbers = true,
      show_cursorline = true,
    }
  },

  -- ------------------------------------------------------------
  -- hop.nvim
  -- (https://github.com/phaazon/hop.nvim)
  -- like easymotion but better
  -- ------------------------------------------------------------
  {
    'phaazon/hop.nvim',
    lazy = true,
    -- event = "BufRead",
    branch = 'v2',
    keys = {
      { "ff", "<cmd>HopWord<cr>",                                                   desc = "Hop Word" },
      { "fl", "<cmd>HopLine<cr>",                                                   desc = "Hop Line" },
      { "fs", "<cmd>HopLineStart<cr>",                                              desc = "Hop Line Start" },
      { "fd", "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", desc = "Hop in Current Line" },
      { "fc", "<cmd>HopChar1<cr>",                                                  desc = "Hop Char1" },
      { "fp", "<cmd>HopPattern<cr>",                                                desc = "Hop Pattern" },
    },
    opts = {}
  },

  -- ------------------------------------------------------------
  -- pretty-fold.nvim
  -- (https://github.com/anuvyklack/pretty-fold.nvim)
  -- ------------------------------------------------------------
  {
    'anuvyklack/pretty-fold.nvim',
    opts = {
      -- keep_indentation = true,
      fill_char = '-',
      sections = {
        left = {
          'content', ' |-'
        },
        right = {
          '-| ', 'number_of_folded_lines', ': ', 'percentage', ' |-',
        },
      },
    },
  },

  -- ------------------------------------------------------------
  -- todo-comments.nvim
  -- (https://github.com/folke/todo-comments.nvim)
  -- ------------------------------------------------------------
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {}
  },

  -- ------------------------------------------------------------
  -- fold-preview.nvim
  -- (https://github.com/anuvyklack/fold-preview.nvim)
  -- ------------------------------------------------------------
  {
    'anuvyklack/fold-preview.nvim',
    dependencies = 'anuvyklack/keymap-amend.nvim',
    opts = {},
  },

  -- ------------------------------------------------------------
  -- nvim-hlslens
  -- (https://github.com/kevinhwang91/nvim-hlslens)
  -- show progress of search
  -- ------------------------------------------------------------
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()

      local kopts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

      vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end
  },

  -- ------------------------------------------------------------
  -- nvim-scrollbar
  -- (https://github.com/petertriho/nvim-scrollbar)
  -- better scrollbar
  -- ------------------------------------------------------------
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
    end
  },

  -- ------------------------------------------------------------
  -- cmp-tabnine
  -- (https://github.com/tzachar/cmp-tabnine)
  -- TabNine plugin for hrsh7th/nvim-cmp
  -- ------------------------------------------------------------
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

  -- ------------------------------------------------------------
  -- cybu.nvim
  -- (https://github.com/ghillb/cybu.nvim)
  -- Neovim plugin that offers context when cycling buffers in the form of a customizable notification window.
  -- ------------------------------------------------------------
  {
    "ghillb/cybu.nvim",
    branch = "main", -- timely updates
    -- branch = "v1.x", -- won't receive breaking changes
    -- dependencies = { "kyazdani42/nvim-web-devicons" }, -- optional
    keys = {
      { "<M-s-tab>", "<plug>(CybuLastusedPrev)", desc = "Last Previous Buffer", mode = { "n", "v" } },
      { "<M-tab>",   "<plug>(CybuLastusedNext)", desc = "Last Next Buffer",     mode = { "n", "v" } },
      { "<S-l>",     "<CMD>CybuNext<CR>",        desc = "Next Buffer" },
      { "<S-h>",     "<CMD>CybuPrev<CR>",        desc = "Previous Buffer" },
    },
    cmd = { "CybuPrev", "CybuNext", "CybuLastusedPrev", "CybuLastusedNext" },
    lazy = true,
    config = function()
      local ok, cybu = pcall(require, "cybu")
      if not ok then
        return
      end

      require("cybu").setup({
        position = {
          relative_to = "editor",
          anchor = "topcenter",
          vertical_offset = 5,
        },
        style = {
          border = "rounded",
          padding = 7,
          hide_buffer_id = true,
          highlights = {
            current_buffer = "BufferLineModifiedSelected",
            adjacent_buffers = "CybuAdjacent",
            background = "CybuBackground",
            border = "CybuBorder",
          },
        },
        behavior = {
          mode = {
            default = {
              switch = "immediate",
              view = "paging"
            },
          }
        }
      })
    end,
  },

  -- ------------------------------------------------------------
  -- flutter-tools.nvim
  -- (https://github.com/akinsho/flutter-tools.nvim)
  -- flutter equipments
  -- ------------------------------------------------------------
  {
    'akinsho/flutter-tools.nvim',
    lazy = true,
    ft = { 'dart', 'pubspec.yaml' },
  },

  -- ------------------------------------------------------------
  -- overseer.nvim
  -- (https://github.com/stevearc/overseer.nvim)
  -- A task runner and job management plugin for Neovim
  -- ------------------------------------------------------------
  {
    'stevearc/overseer.nvim',
    lazy = true,
    keys = {
      { "<leader>ot", "<cmd>OverseerToggle<cr>",     desc = "Overseer Tasks Toggle" },
      { "<leader>or", "<cmd>OverseerRun<cr>",        desc = "Overseer Tasks Run" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Overseer Tasks Action" },
    },
    init = function()
      lvim.builtin.which_key.mappings["o"] = { name = "Overseer" }
    end,
    config = function()
      require('overseer').setup({
        task_list = {
          direction = "right",
          default_detail = 2,
        }
      })
    end
  },

  -- ------------------------------------------------------------
  -- ssr.nvim
  -- (https://github.com/cshuaimin/ssr.nvim)
  -- Treesitter based structural search and replace plugin for Neovim.
  -- ------------------------------------------------------------
  {
    "cshuaimin/ssr.nvim",
    -- module = "ssr",
    lazy = true,
    opts = {
      min_width = 50,
      min_height = 5,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_all = "<cr>",
      },
    },
  },

  -- ------------------------------------------------------------
  -- goto-preview
  -- (https://github.com/rmagatti/goto-preview)
  -- ------------------------------------------------------------
  {
    'rmagatti/goto-preview',
    lazy = true,
    opts = {
      default_mappings = false,
      width = 120,
      height = 25,
      debug = false,
    },
  },

  -- LSP
  -- ------------------------------------------------------------
  -- lspkind
  -- (https://github.com/onsails/lspkind.nvim)
  -- show icons from type on float window
  -- ------------------------------------------------------------
  { 'onsails/lspkind.nvim' },

  -- ------------------------------------------------------------
  -- inc-rename.nvim
  -- https://github.com/smjonas/inc-rename.nvim
  -- ------------------------------------------------------------
  -- {
  --   "smjonas/inc-rename.nvim",
  --   lazy = true,
  --   event = "BufRead",
  --   config = function()
  --     require("inc_rename").setup()
  --     lvim.builtin.which_key.mappings['l']['R'] = { ":IncRename ", "Inc Rename" }
  --   end,
  -- },

  -- ------------------------------------------------------------
  -- lsp_signature.nvim
  -- (https://github.com/ray-x/lsp_signature.nvim)
  -- shows function signature
  -- ------------------------------------------------------------
  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
    event = "BufRead",
    opts = {
      hint = false,
    },
  },

  -- ------------------------------------------------------------
  -- vim-cursorword
  -- (https://github.com/itchyny/vim-cursorword)
  -- ------------------------------------------------------------
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

  -- ------------------------------------------------------------
  -- fidget.nvim
  -- (https://github.com/j-hui/fidget.nvim)
  -- lsp status notification thing
  -- ------------------------------------------------------------
  {
    'j-hui/fidget.nvim',
    opts = {},
  },

  -- ------------------------------------------------------------
  -- nvim_context_vt
  -- (https://github.com/haringsrob/nvim_context_vt)
  -- ------------------------------------------------------------
  {
    "haringsrob/nvim_context_vt",
    lazy = true,
    event = "BufRead",
    opts = {
      enabled = false,
    },
  },

  -- ------------------------------------------------------------
  -- symbols-outline.nvim
  -- (https://github.com/simrat39/symbols-outline.nvim)
  -- ------------------------------------------------------------
  {
    'simrat39/symbols-outline.nvim',
    lazy = true,
    -- event = "BufRead",
    keys = {
      { "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
    },
    opts = {
      auto_preview = false,
      preview_bg_highlight = "Pmenu",
      highlight_hovered_item = true,
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "q" },
      },
      symbols = {
        File = { icon = lvim.icons.kind.File, hl = "@text.uri" },
        Module = { icon = lvim.icons.kind.Module, hl = "@namespace" },
        Namespace = { icon = lvim.icons.kind.Namespace, hl = "@namespace" },
        Package = { icon = lvim.icons.kind.Package, hl = "@namespace" },
        Class = { icon = lvim.icons.kind.Class, hl = "@constant" },
        Method = { icon = lvim.icons.kind.Method, hl = "@method" },
        Property = { icon = lvim.icons.kind.Property, hl = "@method" },
        Field = { icon = lvim.icons.kind.Field, hl = "@field" },
        Constructor = { icon = lvim.icons.kind.Constructor, hl = "@constructor" },
        Enum = { icon = lvim.icons.kind.Enum, hl = "@type" },
        Interface = { icon = lvim.icons.kind.Interface, hl = "@type" },
        Function = { icon = lvim.icons.kind.Function, hl = "@function" },
        Variable = { icon = lvim.icons.kind.Variable, hl = "Statement" },
        Constant = { icon = lvim.icons.kind.Constant, hl = "Statement" },
        String = { icon = lvim.icons.kind.String, hl = "@string" },
        Number = { icon = lvim.icons.kind.Number, hl = "@number" },
        Boolean = { icon = lvim.icons.kind.Boolean, hl = "@boolean" },
        Array = { icon = lvim.icons.kind.Array, hl = "@constant" },
        Object = { icon = lvim.icons.kind.Object, hl = "@constant" },
        Key = { icon = lvim.icons.kind.Key, hl = "@type" },
        Null = { icon = lvim.icons.kind.Null, hl = "@type" },
        EnumMember = { icon = lvim.icons.kind.EnumMember, hl = "@field" },
        Struct = { icon = lvim.icons.kind.Struct, hl = "@type" },
        Event = { icon = lvim.icons.kind.Event, hl = "@type" },
        Operator = { icon = lvim.icons.kind.Operator, hl = "@operator" },
        TypeParameter = { icon = lvim.icons.kind.TypeParameter, hl = "@parameter" },
        Component = { icon = lvim.icons.kind.Function, hl = "@function" },
        Fragment = { icon = lvim.icons.kind.Constant, hl = "@constant" },
      },
    },
  },

  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set("n", "<M-,>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<M-.>", "<Plug>(YankyCycleBackward)")
    end
  },

  -- ------------------------------------------------------------
  -- lsp_lines.nvim
  -- (https://git.sr.ht/~whynothugo/lsp_lines.nvim)
  -- ------------------------------------------------------------
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
