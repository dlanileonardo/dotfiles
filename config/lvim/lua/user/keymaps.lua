local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Override Home Key to ^
keymap("n", "<Home>", "^", opts)

-- Better window navigation
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)

keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)

keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-Up>", ":resize -2<CR>", opts)

keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-Down>", ":resize +2<CR>", opts)

keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)

keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<CMD>CybuNext<CR>", opts)
keymap("n", "<S-Right>", "<CMD>CybuNext<CR>", opts)
keymap("n", "<S-h>", "<CMD>CybuPrev<CR>", opts)
keymap("n", "<S-Left>", "<CMD>CybuPrev<CR>", opts)
