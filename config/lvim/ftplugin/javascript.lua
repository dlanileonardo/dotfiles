vim.cmd("setlocal colorcolumn=120")

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities.textDocument.documentHighlight = true
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd("setlocal tabstop=4 shiftwidth=4")

local opts = {
  capabilities = capabilities,
}

require("lvim.lsp.manager").setup("tsserver", {
  capabilities = capabilities,
  init_options = {
    provideFormatter = true
  }
})

require("lvim.lsp.manager").setup("tailwindcss", {
  capabilities = capabilities,
})

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

-- vim.notify("tsserver loaded")
