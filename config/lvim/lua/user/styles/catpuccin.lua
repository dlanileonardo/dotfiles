vim.g.catppuccin_flavour = "mocha"
lvim.builtin.lualine.options.theme = "catppuccin"

require("catppuccin").setup({
  integrations = {
    telescope = true,
  }
})
