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
    -- keys = { "n", "ca" }
    category = "LSP",
  },
  {
    description = "LSP - Range Code Action",
    cmd = "<CMD>lua vim.lsp.buf.range_code_action()<CR>",
    -- keys = { "x", "ca" }
    category = "LSP",
  },
  {
    description = "LSP - Definition",
    cmd = "<CMD>Telescope lsp_definitions<CR>",
    keys = { "n", "gd" },
    category = "LSP",
  },
  {
    description = "LSP - References",
    cmd = "<cmd>Telescope lsp_references show_line=false<CR>",
    keys = { "n", "gr" },
    category = "LSP",
  },
  {
    description = "LSP - Implementations",
    cmd = "<cmd>Telescope lsp_implementations<CR>",
    keys = { "n", "gI" },
    category = "LSP",
  },
  {
    description = "LSP - Type Definitions",
    cmd = "<cmd>Telescope lsp_type_definitions<CR>",
    keys = { "n", "gt" },
    category = "LSP",
  },
  {
    description = "LSP - Workspace Symbols",
    cmd = "<cmd>Telescope lsp_workspace_symbols<cr>",
    keys = { "n", "gW" },
    category = "LSP",
  },
  {
    description = "LSP - Document Symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
    keys = { "n", "gS" },
    category = "LSP",
  },
  {
    description = "LSP - Buffers Diagnostics",
    cmd = "<CMD>Telescope diagnostics no_unlisted=true<CR>",
    -- keys = {  },
    category = "LSP"
  },
  {
    description = "LSP - Hover",
    cmd = "<CMD>lua vim.lsp.buf.hover()<cr>",
    keys = { "n", "K" },
    category = "LSP",
  },
  {
    description = "LSP - Show Diagnostic",
    cmd = "<CMD>lua vim.diagnostic.open_float()<CR>",
    keys = { "n", "K" },
    category = "LSP",
  },
  {
    description = "LSP - Definitions",
    cmd = "<cmd>Trouble lsp_definitions<cr>",
    keys = { "n", "<leader>tf" },
    category = "LSP",
  },
  {
    description = "LSP Restart",
    cmd = "<cmd>LspRestart<cr>",
    category = "LSP",
  },
};
return commands;
