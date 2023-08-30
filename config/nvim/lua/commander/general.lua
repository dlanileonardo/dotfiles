local commands = {
  {
    desc = "Window Close",
    cmd = "<CMD>close<CR>",
    keys = { "n", "<C-q>" },
    cat = "Window",
  },
  {
    desc = "Exit Vim",
    cmd = "<CMD>qa<CR>",
    keys = { "n", "<C-M-q>" },
    cat = "NeoVim",
  },
  {
    desc = "Git - History",
    cmd = "<CMD>DiffviewFileHistory<CR>",
    cat = "git",
  },
  {
    desc = "Git - Diff",
    cmd = "<CMD>DiffviewOpen<CR>",
    cat = "git",
  },
  {
    desc = "Git - Diff Close",
    cmd = "<CMD>DiffviewClose<CR>",
    cat = "git",
  },
  {
    desc = "Lazygit",
    cmd = "<leader>gg",
    cat = "git",
  },
  -- {
  --   desc = "Toggle Git - Blame",
  --   cmd = "<CMD>GitBlameToggle<CR>",
  --   cat = "git",
  -- },
  {
    desc = "Split in Horizontal",
    cmd = "<CMD>sp<CR>",
    cat = "Window",
  },
  {
    desc = "Split in Vertical",
    cmd = "<CMD>vsp<CR>",
    cat = "Window",
  },
  {
    desc = "Toggle Trouble",
    cmd = "<cmd>TroubleToggle<cr>",
    keys = { "n", "<leader>tt" },
    cat = "Trouble",
  },
  {
    desc = "Diagnostics",
    cmd = "<cmd>Trouble document_diagnostics<cr>",
    keys = { "n", "<leader>td" },
    cat = "Trouble",
  },
  {
    desc = "QuickFix",
    cmd = "<cmd>Trouble quickfix<cr>",
    keys = { "n", "<leader>tq" },
    cat = "Trouble",
  },
  {
    desc = "LocationList",
    cmd = "<cmd>Trouble loclist<cr>",
    keys = { "n", "<leader>tl" },
    cat = "Trouble",
  },
  {
    desc = "Wordspace Diagnostics",
    cmd = "<cmd>Trouble workspace_diagnostics<cr>",
    keys = { "n", "<leader>tw" },
    cat = "Trouble",
  },
  {
    desc = "Retab to Space",
    cmd = "<CMD>set expandtab<CR><CMD>retab<CR>",
    cat = "LunarVim",
  },
  {
    desc = "TestFile",
    cmd = "<CMD>TestFile<CR>",
    keys = { "n", "<leader>yf" },
    cat = "Tests",
  },
  {
    desc = "TestSuite",
    cmd = "<CMD>TestSuite<CR>",
    keys = { "n", "<leader>ys" },
    cat = "Tests",
  },
  {
    desc = "TestNearest",
    cmd = "<CMD>TestNearest<CR>",
    keys = { "n", "<leader>yn" },
    cat = "Tests",
  },
  {
    desc = "Trouble TODO",
    cmd = "<CMD>TodoTrouble<CR>",
    keys = { "n", "<Leader>a" },
    cat = "Trouble",
  },
  {
    desc = "Toggle Task Overseer",
    cmd = "<Leader>ot",
    keys = { "n", "<Leader>ot" },
    cat = "Task",
  },
  {
    desc = "Task Overseer Run",
    cmd = "<Leader>or",
    keys = { "n", "<Leader>or" },
    cat = "Task",
  },
  {
    desc = "Task Overseer Tasks Action",
    cmd = "<Leader>oa",
    keys = { "n", "<Leader>oa" },
    cat = "Task",
  },
  {
    desc = "Trigger Node Action",
    cmd = "T",
    keys = { "n", "T" },
    cat = "Treesitter",
  },
  {
    desc = "Toggle Context Virtual Line",
    cmd = "<CMD>NvimContextVtToggle<CR>",
    keys = { "n", "<C-;>" },
    cat = "Treesitter"
  },
  {
    desc = "Preview Definitions",
    cmd = "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
    keys = { "n", "gpd" },
    cat = "GoTo Preview",
  },
  {
    desc = "Preview Type Definitions",
    cmd = "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
    keys = { "n", "gpt" },
    cat = "GoTo Preview",
  },
  {
    desc = "Preview Implementation",
    cmd = "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
    keys = { "n", "gpi" },
    cat = "GoTo Preview",
  },
  {
    desc = "Preview References",
    cmd = "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
    keys = { "n", "gpr" },
    cat = "GoTo Preview",
  },
  {
    desc = "Close Preview",
    cmd = "<cmd>lua require('goto-preview').close_all_win()<CR>",
    keys = { "n", "gpc" },
    cat = "GoTo Preview",
  },
  {
    desc = "Bookmarks All",
    cmd = "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<CR>",
    cat = "Bookmarks",
  },
  {
    desc = "Bookmarks Current File",
    cmd = "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<CR>",
    cat = "Bookmarks",
  },
};
return commands;
