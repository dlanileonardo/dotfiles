local capabilities = require("user.lsp.utils").capability()

capabilities.textDocument.documentHighlight = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").yamlls.setup({
  capabilities = capabilities,
})

vim.notify("yammls loaded")
