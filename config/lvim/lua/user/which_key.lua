-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings['l']['K'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" }
lvim.builtin.which_key.mappings["e"] = { "<cmd>Telescope file_browser<CR>", "Telescope Explorer" }

lvim.builtin.which_key.mappings["s"]["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["s"]["E"] = { "<cmd>Telescope file_browser<CR>", "Telescope Explorer" }

lvim.builtin.which_key.mappings["b"]["n"] = { "<cmd>:bnext<cr>", "Next Buffer" }
lvim.builtin.which_key.mappings["b"]["1"] = { "<cmd>:bfirst<cr>", "First Buffer" }
lvim.builtin.which_key.mappings["b"]["0"] = { "<cmd>:blast<cr>", "Last Buffer" }

lvim.builtin.which_key.mappings["L"]["h"] = { "<cmd>:CheckHealth<cr>", "Check Health" }

lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble",
  t = { "<cmd>TroubleToggle<cr>", "Toggle" },
  r = { "Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
  a = { "<cmd>TodoTrouble<cr>", "TODO" }
}


lvim.builtin.which_key.mappings["y"] = {
  name = "NvimTests",
  f = { "<CMD>TestFile<CR>", "Test File" },
  s = { "<CMD>TestSuite<CR>", "Test Suite" },
  n = { "<CMD>TestNearest<CR>", "Test Nearest" },
}
-- keymappings hop
lvim.builtin.which_key.mappings['r'] = {
  name = "Hop",
  w = { "<cmd>HopWord<CR>", "Search by Word" },
  e = { "<cmd>HopPattern<CR>", "Search by Pattern" },
  f = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    "After Cursor" },
  F = { "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    "Before Cursor" },
  d = { "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", "Jump to Word" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["s"]["p"] = {
  "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
  "Colorscheme with Preview",
}

vim.api.nvim_set_keymap('n', '<C-M-p>', ":Telescope command_center<CR>", { silent = true })

lvim.builtin.which_key.mappings["B"] = {
  name = "Bookmark",
  t = { "<cmd>BookmarkToggle<CR>", "Toggle" },
  i = { "<cmd>BookmarkAnnotate<CR>", "Annotate" },
  a = { "<cmd>BookmarkShowAll<CR>", "Show All" },
  j = { "<cmd>BookmarkNext<CR>", "Next" },
  k = { "<cmd>BookmarkPrev<CR>", "Previous" },
  c = { "<cmd>BookmarkClear<CR>", "Clear" },
  x = { "<cmd>BookmarkClearAll<CR>", "CLear All" },
  kk = { "<cmd>BookmarkMoveUp<CR>", "Move Up" },
  jj = { "<cmd>BookmarkMoveDown<CR>", "Move Down" },
  g = { "<cmd>BookmarkMoveToLine<CR>", "Move to Line" },
}
