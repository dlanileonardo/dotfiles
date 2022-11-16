local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities.textDocument.documentHighlight = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.emmet_ls.setup({
  -- on_attach = on_attach,
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
})


local capabilities = vim.lsp.protocol.make_client_capabilities()

-- require 'lspconfig'.tailwindcss.setup {
--   capabilities = capabilities
-- }

vim.notify("html loaded")
