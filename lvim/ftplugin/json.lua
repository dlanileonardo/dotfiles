local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  -- cmd = { "/Users/dlani/.asdf/shims/vscode-json-languageserver", "--stdio" }
}
