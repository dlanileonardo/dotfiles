vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- vim.notify = require("notify")

local keymap = vim.keymap
keymap.amend = require('keymap-amend')
local map = require('fold-preview').mapping

keymap.amend('n', 'zp', map.show_close_preview_open_fold)

lvim.builtin.nvimtree.active = false
-- lvim.builtin.breadcrumbs.active = false

-- RAINBOW
lvim.builtin.treesitter.rainbow.enable = true
-- lvim.builtin.treesitter.rainbow.extended_mode = true

-- LUALINE
-- require("nvim-gps").setup()
-- local gps = require("nvim-gps")
vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
local git_blame = require('gitblame')

lvim.builtin.lualine.options.disabled_filetypes = {
  "alpha", "NvimTree", "Outline", "flutterToolsOutline"
}
lvim.builtin.lualine.style = "default"
-- lvim.builtin.lualine.tabline = {
--   lualine_a = {},
--   lualine_b = { 'branch' },
--   lualine_c = { 'filename' },
--   lualine_x = {},
--   lualine_y = {},
--   lualine_z = {}
-- }
lvim.builtin.lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch", "diff", "diagnostics" },
  lualine_c = {
    -- { require('auto-session-library').current_session_name },
    "filename",
    { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
    -- { gps.get_location, cond = gps.is_available }
  },
  lualine_x = { "tabnine", "encoding", "fileformat", "filetype" },
  lualine_y = { "progress" },
  lualine_z = {
    "location",
    -- require('pomodoro').statusline
  },
}

local options = {
  component_separators = { left = '\\', right = '/' },
  section_separators = { left = '', right = '' },
}

lvim.builtin.lualine.options = vim.tbl_extend("force", lvim.builtin.lualine.options, options)

-- lvim.builtin.lualine.active = false
lvim.builtin.bufferline.active = true

lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.options.separator_style = "slope"
-- lvim.builtin.bufferline.options.sort_by = "relative_directory"
lvim.builtin.bufferline.options.show_close_icon = false
-- lvim.builtin.bufferline.options.close_icon = ''
-- lvim.builtin.bufferline.options.buffer_close_icon = '󰅖'

local opts = {
  defaults = {
    -- devicons_disabled = false,
    -- catppuccin_flavour = "mocha",
    -- color_devicons = false,
    layout_config = {
      -- vertical = { width = 0.9 },
      height = 0.95,
      width = 0.95,
      prompt_position = "top",
      mirror = true,
    },
    layout_strategy = 'vertical',
    prompt_prefix = " > ",
    pickers = {
      git_files = {
        hidden = true,
        show_untracked = true,
      },
      live_grep = {

      }
    }
  },
  pickers = {
    git_files = {
      hidden = true,
      show_untracked = true,
    },
    live_grep = {

    },
    find_files = {

    },
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
        ["conf"] = "/Users/dlani/.config/",
        ["projects"] = "/Volumes/Workspace/",
        ["achievemore"] = "/Volumes/Workspace/achievemore/",
        ["crypto"] = "/Volumes/Workspace/crypto/"
      }
    },
    -- z = {
    --   cmd = { "fish", '-c', 'z --list' }
    -- }
  }
}

lvim.builtin.telescope.defaults = vim.tbl_extend("force", lvim.builtin.telescope.defaults, opts.defaults)
lvim.builtin.telescope.extensions = vim.tbl_extend("force", lvim.builtin.telescope.extensions, opts.extensions)
lvim.builtin.telescope.pickers = vim.tbl_extend("force", lvim.builtin.telescope.pickers, opts.pickers)

-- print(vim.inspect(lvim.builtin.telescope))

-- Plugins
-- require("z").setup {
--   cmd = { "fish", '-c', 'z --list' },
-- }

lvim.builtin.telescope.on_config_done = function(tele)
  tele.load_extension('command_center')
  tele.load_extension("frecency")
  tele.load_extension("file_browser")
  tele.load_extension("ui-select")
  tele.load_extension("live_grep_args")
  tele.load_extension("vim_bookmarks")


  tele.load_extension('workspaces')
  -- tele.load_extension("conduct")
  tele.load_extension("yank_history")

  -- tele.load_extension("z")
  -- tele.load_extension("repo")
  -- tele.load_extension("zoxide")

  -- local z_utils = require("telescope._extensions.zoxide.utils")
  -- require("telescope._extensions.zoxide.config").setup({
  --   -- Zoxide list command with score
  --   list_command = "z --list",
  -- })

  -- tele.load_extension("flutter")
  -- tele.setup(opts.extensions)
  -- require('telescope').setup(lvim.builtin.telescope)
end

require('nvim-test').setup {
  run = true,               -- run tests (using for debug)
  commands_create = true,   -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
  silent = false,           -- less notifications
  term = "terminal",        -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 96,             -- terminal's width (for vertical|float)
    height = 24,            -- terminal's height (for horizontal|float)
    go_back = false,        -- return focus to original window after executing
    stopinsert = "auto",    -- exit from insert mode (true|false|"auto")
    keep_one = true,        -- keep only one terminal for testing
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

lvim.builtin.cmp.on_config_done = function(cmp)
  -- lvim.builtin.cmp.mapping = {}
end


vim.cmd([[
  let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
]])

vim.cmd([[
  highlight BookmarkSign ctermbg=NONE ctermfg=1
  highlight BookmarkLine ctermbg=1 ctermfg=NONE
  let g:bookmark_sign = '♥'
  let g:bookmark_highlight_lines = 1
]])
