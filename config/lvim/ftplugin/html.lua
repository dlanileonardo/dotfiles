local capabilities = vim.lsp.protocol.make_client_capabilities()

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

require("lvim.lsp.manager").setup("emmet_ls", opts)

require("lvim.lsp.manager").setup("tailwindcss", {
  capabilities = capabilities,
})

vim.notify("html loaded")
