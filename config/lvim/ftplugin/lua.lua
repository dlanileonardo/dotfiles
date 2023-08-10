vim.cmd("setlocal colorcolumn=120")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
}

require("lvim.lsp.manager").setup("lua_ls", opts)

-- vim.notify("lua loaded")
