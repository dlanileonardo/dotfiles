local capabilities = require("user.lsp.utils").capability()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
}

require("lspconfig").graphql.setup(opts)
