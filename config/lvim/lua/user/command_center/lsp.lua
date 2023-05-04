local commands = {
  {
    description = "Toggle Outline",
    cmd = "<leader>lo",
    category = "LSP",
  },
  {
    description = "LSP - Show document symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
    category = "LSP",
  },
  {
    description = "LSP - Code Actions",
    cmd = "<CMD>lua vim.lsp.buf.code_action()<CR>",
    -- keybindings = { "n", "ca" }
    category = "LSP",
  },
  {
    description = "LSP - Range Code Action",
    cmd = "<CMD>lua vim.lsp.buf.range_code_action()<CR>",
    -- keybindings = { "x", "ca" }
    category = "LSP",
  },
  {
    description = "LSP - Definition",
    cmd = "<CMD>Telescope lsp_definitions<CR>",
    keybindings = { "n", "gd" },
    category = "LSP",
  },
  {
    description = "LSP - References",
    cmd = "<cmd>Telescope lsp_references show_line=false<CR>",
    keybindings = { "n", "gr" },
    category = "LSP",
  },
  {
    description = "LSP - Implementations",
    cmd = "<cmd>Telescope lsp_implementations<CR>",
    keybindings = { "n", "gI" },
    category = "LSP",
  },
  {
    description = "LSP - Type Definitions",
    cmd = "<cmd>Telescope lsp_type_definitions<CR>",
    keybindings = { "n", "gt" },
    category = "LSP",
  },
  {
    description = "LSP - Workspace Symbols",
    cmd = "<cmd>Telescope lsp_workspace_symbols<cr>",
    keybindings = { "n", "gW" },
    category = "LSP",
  },
  {
    description = "LSP - Document Symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
    keybindings = { "n", "gS" },
    category = "LSP",
  },
  {
    description = "LSP - Diagnostics",
    cmd = "<CMD>Telescope diagnostics no_unlisted=true<CR>",
    -- keybindings = {  },
    category = "LSP"
  },
  {
    description = "LSP - Hover",
    cmd = "<CMD>lua vim.lsp.buf.hover()<cr>",
    keybindings = { "n", "K" },
    category = "LSP",
  },
  {
    description = "LSP - Show Diagnostic",
    cmd = "<CMD>lua vim.diagnostic.open_float()<CR>",
    keybindings = { "n", "K" },
    category = "LSP",
  },
  {
    description = "LSP - Definitions",
    cmd = "<cmd>Trouble lsp_definitions<cr>",
    keybindings = { "n", "<leader>tf" },
    category = "LSP",
  },
  {
    description = "LSP Restart",
    cmd = "<cmd>LspRestart<cr>",
    category = "LSP",
  },
};
return commands;
