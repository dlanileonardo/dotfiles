local M = {
  enabled = true,
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({})
    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
    vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
    vim.keymap.set("n", "<M-,>", "<Plug>(YankyCycleForward)")
    vim.keymap.set("n", "<M-.>", "<Plug>(YankyCycleBackward)")
  end
}
return M
