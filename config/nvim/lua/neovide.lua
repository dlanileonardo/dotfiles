-- if vim.g.neovide then
vim.opt.guifont = "Tamzen Nerd Font Mono:h16" -- the font used in graphical neovim applications
vim.g.neovide_transparency = 0.95
vim.g.transparency = 0.95
vim.g.neovide_input_use_logo = false
vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_cursor_vfx_mode = "wireframe"
vim.g.neovide_remember_window_size = true
vim.g.neovide_confirm_quit = true
-- vim.g.neovide_fullscreen = true

-- Allow clipboard copy paste in neovim
-- vim.g.neovide_input_use_logo = 1
-- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

vim.opt.mouse = ""

-- if vim.g.neovide then
--   vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
--   vim.keymap.set('v', '<D-c>', '"+y') -- Copy
--   vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
--   vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
--   vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
--   vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
-- end

-- -- Allow clipboard copy paste in neovim
-- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- end
