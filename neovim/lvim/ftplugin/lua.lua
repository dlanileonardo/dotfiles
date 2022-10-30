local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities
}

-- vim.notify("Lua loaded")
