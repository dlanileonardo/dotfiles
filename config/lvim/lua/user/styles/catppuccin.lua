vim.opt.background = "light"

vim.g.catppuccin_flavour = "latte"
lvim.builtin.lualine.options.theme = "catppuccin"

require("catppuccin").setup({
  flavour = "latte",
  integrations = {
    telescope = true,
  }
})
