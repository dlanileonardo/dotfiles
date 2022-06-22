local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.documentHighlight = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.ruby.setup {
  capabilities = capabilities
}
vim.notify("ruby loaded")
