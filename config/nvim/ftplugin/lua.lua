-- vim.cmd("setlocal colorcolumn=120")

local capabilities = require("user.lsp.utils").capability()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  },
}

require("lspconfig").lua_ls.setup(opts)

-- vim.notify("lua loaded")
