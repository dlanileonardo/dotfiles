local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
}

require("lspconfig").erb_lint.setup(opts)
require("lspconfig").solargraph.setup(opts)
require("lspconfig").emmet_ls.setup(opts)


vim.notify("eruby loaded")
