local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
}

require("lvim.lsp.manager").setup("solargraph", opts)

require("lvim.lsp.manager").setup("emmet_ls", opts)


vim.notify("eruby loaded")
