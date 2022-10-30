local lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local configs = require 'lspconfig/configs'

capabilities.textDocument.documentHighlight = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
})

-- require 'lspconfig'.html.setup {
--   capabilities = capabilities,
-- }

require 'lspconfig'.tailwindcss.setup {
  capabilities = capabilities
}

-- vim.notify("html loaded")
