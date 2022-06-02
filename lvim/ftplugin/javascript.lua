local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.documentHighlight = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd("setlocal tabstop=4 shiftwidth=4")

require 'lspconfig'.tsserver.setup {
  capabilities = capabilities
}
vim.notify("tsserver loaded")
