vim.cmd("setlocal colorcolumn=120")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local opts = {}

require("lvim.lsp.manager").setup("rust_analyzer", opts)
