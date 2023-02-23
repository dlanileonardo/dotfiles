local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd("setlocal tabstop=4 shiftwidth=4")

local opts = {
  capabilities = capabilities,
}

require("lvim.lsp.manager").setup("jsonls", opts)

vim.notify("json loaded")
