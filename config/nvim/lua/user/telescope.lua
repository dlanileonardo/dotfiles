local M = {
  "nvim-telescope/telescope.nvim",
  commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
    },
    {
      "gfeiyou/command-center.nvim",
      event = "VimEnter",
      keys = {
        { "<C-M-p>", ":Telescope command_center<CR>", desc = "Command Center" }
      },
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    { dir = '/home/linuxbrew/.linuxbrew/opt/fzf/' },
  },
}

function M.config()
  local telescope = require "telescope"
  local actions = require "telescope.actions"
  local command_center = require('command_center')

  telescope.load_extension("command_center")
  telescope.load_extension('fzf')
  telescope.load_extension('workspaces')
  telescope.load_extension("file_browser")
  telescope.load_extension("ui-select")
  telescope.load_extension("live_grep_args")
  telescope.load_extension("vim_bookmarks")
  telescope.load_extension("yank_history")

  telescope.setup({
    theme = "dropdown", ---@type telescope_themes
    defaults = {
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = nil,
      layout_config = {
        -- vertical = { width = 0.9 },
        height = 0.95,
        width = 0.95,
        prompt_position = "top",
        mirror = true,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      layout_strategy = 'vertical',
      prompt_prefix = " > ",
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
        },
        grep_string = {
          only_sort_text = true,
        },
        buffers = {
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        planets = {
          show_pluto = true,
          show_moon = true,
        },
        git_files = {
          hidden = true,
          show_untracked = true,
        },
        colorscheme = {
          enable_preview = true,
        },
        git_files = {
          hidden = true,
          show_untracked = true,
        },
        live_grep = {

        }
      },
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules" },
      mappings = {
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          ["<C-q>"] = function(...)
            actions.smart_send_to_qflist(...)
            actions.open_qflist(...)
          end,
          ["<CR>"] = actions.select_default,
        },
        n = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-q>"] = function(...)
            actions.smart_send_to_qflist(...)
            actions.open_qflist(...)
          end,
        },
      },
      file_ignore_patterns = {},
      path_display = { "smart" },
      winblend = 0,
      border = {},
      borderchars = nil,
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
    extensions = {
      live_grep_args = {
        auto_quoting = true,
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
        }
      },
      file_browser = {
        -- theme = "ivy",
        hidden = false,
        -- respect_gitignore = false,
        auto_depth = true,
        depth = 1,
        hide_parent_dir = false,
        -- display_stat = { date = false, size = false, mode = false },
        grouped = true,
      },
      frecency = {
        show_scores = true,
        -- devicons_disabled = true,
        workspaces = {
        }
      },
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      },
      command_center = {
        components = {
          command_center.component.CATEGORY,
          command_center.DESCRIPTION,
          command_center.component.KEYBINDINGS,
          command_center.component.COMMAND,
        },
        sort_by = {
          command_center.component.CATEGORY,
          command_center.component.DESCRIPTION,
          -- command_center.component.COMMAND,
        },
        -- command_center.component.KEYBINDINGS,
        separator = "  ",
        auto_replace_desc_with_cmd = true,
        prompt_title = "Command Center",
      }
    },
  })
end

return M
