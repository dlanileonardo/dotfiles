local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "eruby", "erb" },
})

require 'lspconfig'.eruby.setup {
  capabilities = capabilities,
}

vim.notify("eruby loaded")
