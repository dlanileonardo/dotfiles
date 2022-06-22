vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

-- require('ufo').setup {

-- }

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
  easing_function = "quadratic",
  mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', '<PageUp>', 'PageDown', },
  performance_mode = true,
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

vim.g.tokyonight_style = "night"
vim.g.catppuccin_flavour = "mocha"

lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch", "diff", "diagnostics" },
  lualine_c = {
    { require('auto-session-library').current_session_name },
    "filename",
    { gps.get_location, cond = gps.is_available }
  },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = { "progress" },
  lualine_z = { "location" },
}
lvim.builtin.lualine.options.theme = "catppuccin"

lvim.builtin.bufferline.options.always_show_bufferline = true
-- lvim.builtin.bufferline.options.enforce_regular_tabs = true
-- lvim.builtin.bufferline.options.separator_style = "thick"
-- lvim.builtin.bufferline.options.sort_by = "relative_directory"
-- lvim.builtin.bufferline.options.show_close_icon = false

local opts = {
  extensions = {
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

-- Plugins
lvim.builtin.telescope.on_config_done = function(tele)
  tele.load_extension('command_center')
  tele.load_extension("frecency")
  tele.load_extension("file_browser")
  tele.load_extension("ui-select")
  -- tele.load_extension("flutter")
  -- tele.setup(opts.extensions)
  -- require('telescope').setup(lvim.builtin.telescope)
end
