local M = {
  enabled = true,
  'petertriho/nvim-scrollbar',
  config = function()
    require("scrollbar").setup()
    require("scrollbar.handlers.search").setup()
  end
}
return M
