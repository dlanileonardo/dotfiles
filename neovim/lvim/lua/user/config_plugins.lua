vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require('pretty-fold').setup({
  -- keep_indentation = true,
  fill_char = '-',
  sections = {
    left = {
      -- function() return string.rep('-', vim.v.foldlevel) end, '-| ', 'content', ' |-'
      'content', ' |-'
    },
    right = {
      '-| ', 'number_of_folded_lines', ': ', 'percentage', ' |-',
    }
  }
})

require('pretty-fold.preview').setup()

require("indent_blankline").setup {
  char = '|',
  char_blankline = '┊',
  -- char_list = { '|', '¦', '┆', '┊' },
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  show_first_indent_level = true,
  filetype_exclude = { "help", "terminal", "dashboard", "man", "checkhealth", "packer", "flutterToolsOutline", "Outline" },
  buftype_exclude = { "terminal", "nofile", "quickfix", "flutterToolsOutline", "Outline" },
  bufname_exclude = {},
  show_trailing_blankline_indent = false,
}

require('neoscroll').setup({
  -- easing_function = "quadratic",
  mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', '<PageUp>', 'PageDown', },
  -- performance_mode = true,
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

lvim.builtin.lualine.options.disabled_filetypes = {
  "alpha", "NvimTree", "Outline", "flutterToolsOutline"
}
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

-- lvim.builtin.lualine.active = false
-- require('user.ui.feline')

lvim.builtin.bufferline.options.always_show_bufferline = true
-- lvim.builtin.bufferline.options.enforce_regular_tabs = true
-- lvim.builtin.bufferline.options.separator_style = "thick"
-- lvim.builtin.bufferline.options.sort_by = "relative_directory"
-- lvim.builtin.bufferline.options.show_close_icon = false

local opts = {
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

lvim.builtin.telescope.defaults = {
  -- devicons_disabled = true,
  catppuccin_flavour = "frappe"
}

-- print(vim.inspect(lvim.builtin.telescope.extensions))

-- Plugins
lvim.builtin.telescope.on_config_done = function(tele)
  tele.load_extension('command_center')
  tele.load_extension("frecency")
  tele.load_extension("file_browser")
  tele.load_extension("ui-select")
  tele.load_extension("live_grep_args")
  -- tele.load_extension("flutter")
  -- tele.setup(opts.extensions)
  -- require('telescope').setup(lvim.builtin.telescope)
end

require('nvim-test').setup {
  run = true, -- run tests (using for debug)
  commands_create = true, -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
  silent = false, -- less notifications
  term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 96, -- terminal's width (for vertical|float)
    height = 24, -- terminal's height (for horizontal|float)
    go_back = false, -- return focus to original window after executing
    stopinsert = "auto", -- exit from insert mode (true|false|"auto")
    keep_one = true, -- keep only one terminal for testing
  },
  runners = {
    cs = "nvim-test.runners.dotnet",
    go = "nvim-test.runners.go-test",
    haskell = "nvim-test.runners.hspec",
    javacriptreact = "nvim-test.runners.jest",
    javascript = "nvim-test.runners.jest",
    lua = "nvim-test.runners.busted",
    python = "nvim-test.runners.pytest",
    ruby = "nvim-test.runners.rspec",
    rust = "nvim-test.runners.cargo-test",
    typescript = "nvim-test.runners.jest",
    typescriptreact = "nvim-test.runners.jest",
  }
}

require('config-local').setup {
  -- Default configuration (optional)
  config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
  hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
  autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
  commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
  silent = false, -- Disable plugin messages (Config loaded/ignored)
  lookup_parents = false, -- Lookup config files in parent directories
}

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

-- vim.keymap.set("n", "<C-h>", "<Plug>(CybuPrev)")
-- vim.keymap.set("n", "<C-l>", "<Plug>(CybuNext)")

vim.keymap.set({ "n", "v" }, "<M-s-tab>", "<plug>(CybuLastusedPrev)")
vim.keymap.set({ "n", "v" }, "<M-tab>", "<plug>(CybuLastusedNext)")

-- require("bookmarks").setup({
--   keymap = {
--     toggle = "<tab><tab>", -- toggle bookmarks
--     add = "\\z", -- add bookmarks
--     jump = "<CR>", -- jump from bookmarks
--     delete = "dd", -- delete bookmarks
--     order = "<space><space>", -- order bookmarks by frequency or updated_time
--   },
--   width = 0.8, -- bookmarks window width:  (0, 1]
--   height = 0.6, -- bookmarks window height: (0, 1]
--   preview_ratio = 0.4, -- bookmarks preview window ratio (0, 1]
--   hl_cursorline = "guibg=Gray guifg=White" -- hl bookmarsk window cursorline
-- })
