local commands = {
  {
    description = "Window Close",
    cmd = "<CMD>close<CR>",
    keys = { "n", "<C-q>" },
    category = "Window",
  },
  {
    description = "Exit Vim",
    cmd = "<CMD>qa<CR>",
    keys = { "n", "<C-M-q>" },
    category = "NeoVim",
  },
  {
    description = "Git - History",
    cmd = "<CMD>DiffviewFileHistory<CR>",
    category = "git",
  },
  {
    description = "Git - Diff",
    cmd = "<CMD>DiffviewOpen<CR>",
    category = "git",
  },
  {
    description = "Git - Diff Close",
    cmd = "<CMD>DiffviewClose<CR>",
    category = "git",
  },
  {
    description = "Lazygit",
    cmd = "<leader>gg",
    category = "git",
  },
  -- {
  --   description = "Toggle Git - Blame",
  --   cmd = "<CMD>GitBlameToggle<CR>",
  --   category = "git",
  -- },
  {
    description = "Split in Horizontal",
    cmd = "<CMD>sp<CR>",
    category = "Window",
  },
  {
    description = "Split in Vertical",
    cmd = "<CMD>vsp<CR>",
    category = "Window",
  },
  {
    description = "Toggle Trouble",
    cmd = "<cmd>TroubleToggle<cr>",
    keys = { "n", "<leader>tt" },
    category = "Trouble",
  },
  {
    description = "Diagnostics",
    cmd = "<cmd>Trouble document_diagnostics<cr>",
    keys = { "n", "<leader>td" },
    category = "Trouble",
  },
  {
    description = "QuickFix",
    cmd = "<cmd>Trouble quickfix<cr>",
    keys = { "n", "<leader>tq" },
    category = "Trouble",
  },
  {
    description = "LocationList",
    cmd = "<cmd>Trouble loclist<cr>",
    keys = { "n", "<leader>tl" },
    category = "Trouble",
  },
  {
    description = "Wordspace Diagnostics",
    cmd = "<cmd>Trouble workspace_diagnostics<cr>",
    keys = { "n", "<leader>tw" },
    category = "Trouble",
  },
  {
    description = "Retab to Space",
    cmd = "<CMD>set expandtab<CR><CMD>retab<CR>",
    category = "LunarVim",
  },
  {
    description = "TestFile",
    cmd = "<CMD>TestFile<CR>",
    keys = { "n", "<leader>yf" },
    category = "Tests",
  },
  {
    description = "TestSuite",
    cmd = "<CMD>TestSuite<CR>",
    keys = { "n", "<leader>ys" },
    category = "Tests",
  },
  {
    description = "TestNearest",
    cmd = "<CMD>TestNearest<CR>",
    keys = { "n", "<leader>yn" },
    category = "Tests",
  },
  {
    description = "Trouble TODO",
    cmd = "<CMD>TodoTrouble<CR>",
    keys = { "n", "<Leader>a" },
    category = "Trouble",
  },
  {
    description = "Toggle Task Overseer",
    cmd = "<Leader>ot",
    keys = { "n", "<Leader>ot" },
    category = "Task",
  },
  {
    description = "Task Overseer Run",
    cmd = "<Leader>or",
    keys = { "n", "<Leader>or" },
    category = "Task",
  },
  {
    description = "Task Overseer Tasks Action",
    cmd = "<Leader>oa",
    keys = { "n", "<Leader>oa" },
    category = "Task",
  },
  {
    description = "Trigger Node Action",
    cmd = "T",
    keys = { "n", "T" },
    category = "Treesitter",
  },
  {
    description = "Toggle Context Virtual Line",
    cmd = "<CMD>NvimContextVtToggle<CR>",
    keys = { "n", "<C-;>" },
    category = "Treesitter"
  },
  {
    description = "Preview Definitions",
    cmd = "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
    keys = { "n", "gpd" },
    category = "GoTo Preview",
  },
  {
    description = "Preview Type Definitions",
    cmd = "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
    keys = { "n", "gpt" },
    category = "GoTo Preview",
  },
  {
    description = "Preview Implementation",
    cmd = "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
    keys = { "n", "gpi" },
    category = "GoTo Preview",
  },
  {
    description = "Preview References",
    cmd = "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
    keys = { "n", "gpr" },
    category = "GoTo Preview",
  },
  {
    description = "Close Preview",
    cmd = "<cmd>lua require('goto-preview').close_all_win()<CR>",
    keys = { "n", "gpc" },
    category = "GoTo Preview",
  },
  {
    description = "Bookmarks All",
    cmd = "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<CR>",
    category = "Bookmarks",
  },
  {
    description = "Bookmarks Current File",
    cmd = "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<CR>",
    category = "Bookmarks",
  },
};
return commands;
