-- vim.cmd("setlocal colorcolumn=120")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = {'vim'} }
    }
  },
}

require("lspconfig").lua_ls.setup(opts)

-- vim.notify("lua loaded")
