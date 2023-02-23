lvim.builtin.lualine.options.theme = "nord"

-- vim.g.nord_contrast = true

local highlights = require("nord").bufferline.highlights({
  italic = false,
  bold = true,
})

lvim.builtin.bufferline.options.separator_style = "slant"
lvim.builtin.bufferline.options.highlights = highlights
