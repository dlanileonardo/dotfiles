-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", "P", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Comment
keymap("n", "<leader>\\", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Comment toggle current line" })
keymap("x", "<leader>\\", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Comment block" })
-- keymap("n", "<leader>\\", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment toggle current line" })

keymap("n", "<leader>;", "<cmd>Alpha<CR>", { desc = "Dashboard" })
keymap("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
keymap("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit" })
keymap("n", "<leader><Del>", "<cmd>BufferKill<CR>", { desc = "Close Buffer" })
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })
keymap("n", "<leader>e", "<cmd>Telescope file_browser<CR>", { desc = "Telescope Explorer" })
keymap("n", "<leader>n", "<cmd>Telescope notify<CR>", { desc = "Notifications" })

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Fold Preview
keymap('n', 'zp', "<CMD>lua require('fold-preview').show_preview()<CR>", opts)

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
keymap("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Right>", "<CMD>CybuNext<CR>", opts)
keymap("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-Left>", "<CMD>CybuPrev<CR>", opts)
