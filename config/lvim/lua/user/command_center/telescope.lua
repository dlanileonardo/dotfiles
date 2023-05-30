local commands = {
  {
    description = "Telescope View Notification",
    cmd = "<CMD>Telescope notify<cr>",
    category = "Telescope",
  },
  {
    description = "Telescope Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope File Explorer",
    cmd = "<CMD>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Search Word",
    cmd = "<CMD>lua require('telescope.builtin').live_grep()<CR>",
    keybindings = { "n", "<M-r>" },
    category = "Telescope",
  },
  {
    description = "Telescope Search Word Args",
    cmd = "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    keybindings = { "n", "<M-o>" },
    category = "Telescope",
  },
  {
    description = "Telescope git Files",
    cmd = "<CMD>lua require('telescope.builtin').git_files()<CR>",
    keybindings = { "n", "<C-S-p>" },
    category = "Telescope",
  },
  {
    description = "Telescope Files",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
    keybindings = { "n", "<C-p>" },
    category = "Telescope",
  },
  {
    description = "Telescope Buffers",
    cmd = "<CMD>lua require('telescope.builtin').buffers()<CR>",
    keybindings = { "n", "<M-b>" },
    category = "Telescope",
  },
  {
    description = "Telescope Keymaps",
    cmd = "<CMD>lua require('telescope.builtin').keymaps()<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Current Buffer",
    cmd = "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    keybindings = { "n", "<M-p>" },
    category = "Telescope",
  },
  {
    description = "Telescope Modified Files",
    cmd = "<CMD>lua require('telescope.builtin').git_status()<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Projects",
    cmd = "<cmd>Telescope projects<CR>",
    keybindings = { "n", "<Leader>sP" },
    category = "Telescope",
  },
  {
    description = "Telescope Workspaces",
    cmd = "<cmd>Telescope workspaces<cr>",
    keybindings = { "n", "<M-w>" },
    category = "Telescope",
  },
  {
    description = "Telescope Explorer",
    cmd = "<cmd>Telescope file_browser respect_gitignore=false<CR>",
    keybindings = { { "n", "<M-x>" } },
    category = "Telescope",
  },
  {
    description = "Telescope Explorer Current Folder",
    cmd = "<cmd>Telescope file_browser path=%:p:h respect_gitignore=false<CR>",
    -- cmd =
    -- "<CMD>lua require('telescope').extensions.file_browser.file_browser({path='%:p:h',respect_gitignore=false})<CR>",
    keybindings = { "n", "<M-c>" },
    category = "Telescope",
  },
  {
    description = "Telescope TODO",
    cmd = "<CMD>TodoTelescope<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope yank",
    cmd = "<CMD>Telescope yank_history<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Treesiter",
    cmd = "<CMD>Telescope treesitter<CR>",
    keybindings = { "n", "<M-t>" },
    category = "Telescope",
  },
  {
    description = "Telescope Git Branches",
    cmd = "<CMD>Telescope git_branches<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Help",
    cmd = "<CMD>Telescope help_tags<CR>",
    category = "Telescope",
  }
};
return commands;
