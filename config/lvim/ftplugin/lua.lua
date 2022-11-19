local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
}

require("lvim.lsp.manager").setup("sumneko_lua", opts)

vim.notify("lua loaded")
