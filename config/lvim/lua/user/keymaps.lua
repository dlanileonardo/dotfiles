local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Override Home Key to ^
keymap("n", "<Home>", "^", opts)
