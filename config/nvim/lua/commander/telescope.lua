local commands = {
  {
    desc = "Telescope View Notification",
    cmd = "<CMD>Telescope notify<cr>",
    cat = "Telescope",
  },
  {
    desc = "Telescope Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope File Explorer",
    cmd = "<CMD>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope Search Word",
    cmd = "<CMD>lua require('telescope.builtin').live_grep()<CR>",
    keys = { "n", "<M-r>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope Search Word Args",
    cmd = "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    keys = { "n", "<M-o>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope git Files",
    cmd = "<CMD>lua require('telescope.builtin').git_files()<CR>",
    keys = { "n", "<C-S-p>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope Files",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
    keys = { "n", "<C-p>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope Buffers",
    cmd = "<CMD>lua require('telescope.builtin').buffers()<CR>",
    keys = { "n", "<M-b>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope Keymaps",
    cmd = "<CMD>lua require('telescope.builtin').keymaps()<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope Current Buffer",
    cmd = "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    keys = { "n", "<M-p>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope Modified Files",
    cmd = "<CMD>lua require('telescope.builtin').git_status()<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope Projects",
    cmd = "<cmd>Telescope projects<CR>",
    keys = { "n", "<Leader>sP" },
    cat = "Telescope",
  },
  {
    desc = "Telescope Workspaces",
    cmd = "<cmd>Telescope workspaces<cr>",
    keys = { "n", "<M-w>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope Explorer",
    cmd = "<cmd>Telescope file_browser respect_gitignore=false<CR>",
    keys = { { "n", "<M-x>" } },
    cat = "Telescope",
  },
  {
    desc = "Telescope Explorer Current Folder",
    cmd = "<cmd>Telescope file_browser path=%:p:h respect_gitignore=false<CR>",
    -- cmd =
    -- "<CMD>lua require('telescope').extensions.file_browser.file_browser({path='%:p:h',respect_gitignore=false})<CR>",
    keys = { "n", "<M-c>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope TODO",
    cmd = "<CMD>TodoTelescope<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope yank",
    cmd = "<CMD>Telescope yank_history<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope Treesiter",
    cmd = "<CMD>Telescope treesitter<CR>",
    keys = { "n", "<M-t>" },
    cat = "Telescope",
  },
  {
    desc = "Telescope themes",
    cmd = "<CMD>Telescope colorscheme<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope Git Branches",
    cmd = "<CMD>Telescope git_branches<CR>",
    cat = "Telescope",
  },
  {
    desc = "Telescope Help",
    cmd = "<CMD>Telescope help_tags<CR>",
    cat = "Telescope",
  },
}
return commands
