local commands = {
  {
    desc = "Toggle Outline",
    cmd = "<leader>lo",
    cat = "LSP",
  },
  {
    desc = "LSP - Show document symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
    cat = "LSP",
  },
  {
    desc = "LSP - Code Actions",
    cmd = "<CMD>lua vim.lsp.buf.code_action()<CR>",
    -- keys = { "n", "ca" }
    cat = "LSP",
  },
  {
    desc = "LSP - Range Code Action",
    cmd = "<CMD>lua vim.lsp.buf.range_code_action()<CR>",
    -- keys = { "x", "ca" }
    cat = "LSP",
  },
  {
    desc = "LSP - Definition",
    cmd = "<CMD>Telescope lsp_definitions<CR>",
    keys = { "n", "gd" },
    cat = "LSP",
  },
  {
    desc = "LSP - References",
    cmd = "<cmd>Telescope lsp_references show_line=false<CR>",
    keys = { "n", "gr" },
    cat = "LSP",
  },
  {
    desc = "LSP - Implementations",
    cmd = "<cmd>Telescope lsp_implementations<CR>",
    keys = { "n", "gI" },
    cat = "LSP",
  },
  {
    desc = "LSP - Type Definitions",
    cmd = "<cmd>Telescope lsp_type_definitions<CR>",
    keys = { "n", "gt" },
    cat = "LSP",
  },
  {
    desc = "LSP - Workspace Symbols",
    cmd = "<cmd>Telescope lsp_workspace_symbols<cr>",
    keys = {
      { "n", "gW" },
      -- { "n", "<C-i>" },
    },
    cat = "LSP",
  },
  {
    desc = "LSP - Document Symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
    keys = {
      { "n", "gS" },
      -- { "n", "<C-o>" },
    },
    cat = "LSP",
  },
  {
    desc = "LSP - Buffers Diagnostics",
    cmd = "<CMD>Telescope diagnostics no_unlisted=true<CR>",
    keys = { "n", "gK" },
    cat = "LSP",
  },
  {
    desc = "LSP - Hover",
    cmd = "<CMD>lua vim.lsp.buf.hover()<cr>",
    keys = { "n", "K" },
    cat = "LSP",
  },
  {
    desc = "LSP - Show Diagnostic",
    cmd = "<CMD>lua vim.diagnostic.open_float()<CR>",
    keys = { "n", "gk" },
    cat = "LSP",
  },
  {
    desc = "LSP - Definitions",
    cmd = "<cmd>Trouble lsp_definitions<cr>",
    keys = { "n", "<leader>tf" },
    cat = "LSP",
  },
  {
    desc = "LSP Restart",
    cmd = "<cmd>LspRestart<cr>",
    cat = "LSP",
  },
}
return commands
