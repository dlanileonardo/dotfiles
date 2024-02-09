local capabilities = require("user.lsp.utils").capability()

capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd("setlocal tabstop=4 shiftwidth=4")

local opts = {
  capabilities = capabilities,
}

require("lspconfig").jsonls.setup(opts)

vim.notify("json loaded")
