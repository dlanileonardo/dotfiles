-- GRUVBOX-BABY
local config = require("gruvbox-baby.config")
local colors = require("gruvbox-baby.colors")
local c = colors.config(config)
lvim.builtin.lualine.options.theme = "gruvbox"

vim.g.gruvbox_baby_highlights = {
  -- Visual = { bg = c.medium_gray },
  -- IncSearch = { bg = colors.p.medium_red },
  Search = { fg = c.background, bg = c.soft_yellow },
  -- VisualNOS = { bg = c.medium_gray },
}

vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_transparent_mode = 1
vim.g.gruvbox_baby_background_color = "medium"
