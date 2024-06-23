local capabilities = vim.lsp.protocol.make_client_capabilities()

-- -- capabilities.textDocument.documentHighlight = true
-- -- capabilities.textDocument.completion.completionItem.snippetSupport = true


-- local opts = {
--   capabilities = capabilities,
-- }

-- require("lspconfig").tsserver.setup({
--   capabilities = capabilities,
--   init_options = {
--     provideFormatter = true
--   }
-- })

-- require("lspconfig").tailwindcss.setup({
--   capabilities = capabilities,
-- })

-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/chrome/vscode-js-debug/out/src/vsDebugserver.js" },
-- }

-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js" },
-- }

-- dap.configurations.javascript = {
--   {
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     -- sourceMaps = true,
--     -- protocol = "inspector",
--     -- port = 9222,
--     webRoot = "${workspaceFolder}"
--   },
--   {
--     name = "Launch Chrome",
--     request = "launch",
--     type = "chrome",
--     url = "https://angular.achievemore.dev.io",
--     webRoot = "${workspaceFolder}"
--   },
-- }

vim.cmd("setlocal colorcolumn=120")
vim.cmd("setlocal tabstop=4 shiftwidth=4")

vim.notify("javascript loaded")

