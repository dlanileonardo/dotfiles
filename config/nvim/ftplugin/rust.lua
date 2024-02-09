-- vim.cmd("setlocal colorcolumn=120")

local capabilities = require("user.lsp.utils").capability()

local opts = {}

require("lspconfig").rust_analyzer.setup(opts)
