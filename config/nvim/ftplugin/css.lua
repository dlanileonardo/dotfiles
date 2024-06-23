-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local opts = {
--   capabilities = capabilities,
-- }

-- require("lspconfig").cssls.setup(opts)

-- require("lspconfig").emmet_ls.setup({
--   capabilities = capabilities,
--   filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })

vim.notify("css loaded")
