local capabilities = require("user.lsp.utils").capability()

capabilities.textDocument.documentHighlight = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
}

require("lspconfig").emmet_ls.setup(opts)

require("lspconfig").tailwindcss.setup({
  capabilities = capabilities,
})

vim.notify("html loaded")
