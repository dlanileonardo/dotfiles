local M = {
  "nvim-telescope/telescope.nvim",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    { dir = "/home/linuxbrew/.linuxbrew/opt/fzf/" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
}

function M.config()
  local telescope = require "telescope"
  local actions = require "telescope.actions"

  telescope.load_extension "fzf"
  telescope.load_extension "workspaces"
  telescope.load_extension "file_browser"
  telescope.load_extension "ui-select"
  telescope.load_extension "live_grep_args"
  telescope.load_extension "vim_bookmarks"
  telescope.load_extension "yank_history"

  telescope.setup {
    -- theme = "dropdown", ---@type telescope_themes
    defaults = {
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_config = {
        vertical = { width = 0.9 },
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
      layout_strategy = "vertical",
      prompt_prefix = " > ",
      pickers = {
        find_files = {
          hidden = true,
          -- theme = "dropdown",
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
          -- theme = "dropdown",
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
        },
        grep_string = {
          only_sort_text = true,
          -- theme = "dropdown",
        },
        buffers = {
          -- theme = "dropdown",
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
          -- theme = "dropdown",
        },
        git_files = {
          hidden = true,
          show_untracked = true,
          -- theme = "dropdown",
        },
        colorscheme = {
          enable_preview = true,
          -- theme = "dropdown",
        },
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
        },
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
        workspaces = {},
      },
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
