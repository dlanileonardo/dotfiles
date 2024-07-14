-- General Settings
vim.opt.shell = "/bin/sh"
vim.opt.relativenumber = true
vim.opt.sessionoptions:append "buffers"
vim.opt.sessionoptions:append "curdir"
vim.opt.sessionoptions:append "folds"
vim.opt.sessionoptions:append "tabpages"
vim.opt.sessionoptions:append "winsize"
vim.opt.sessionoptions:append "winpos"
vim.opt.sessionoptions:append "terminal"
vim.opt.sessionoptions:append "localoptions"

-- Format and lint on save
vim.g.format_on_save = true

-- Key Mappings
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>Telescope down<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>Telescope up<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<cmd>Telescope down<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>Telescope up<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Up>", "<Nop>", { noremap = true })

-- Enable terminal
vim.g.terminal = true

-- Set NvimTree view side to left
vim.g.nvim_tree_side = "left"

-- Configure Treesitter
vim.g.python3_host_prog = "python3"
vim.g.python_host_prog = "python"

-- LSP Server installation
vim.g.lsp_install_servers = {
  angularls = {},
  tailwindcss = {},
  rust_analyzer = {},
  bashls = {},
  cssls = {},
  emmet_ls = {},
  html = {},
  jsonls = {},
  lua_ls = {},
  pyright = {},
  solargraph = {},
  tsserver = {},
  vimls = {},
  yamlls = {},
}

-- Treesitter configuration
vim.g.treesitter_ignore_install = { "haskell", "dart" }
vim.g.treesitter_highlight_enabled = 1

-- Autocommands
vim.cmd "augroup custom_autocmds"
vim.cmd "autocmd!"
vim.cmd "autocmd BufWinEnter *.* setlocal foldmethod=indent"
vim.cmd "autocmd BufWinEnter *.* set foldexpr=nvim_treesitter#foldexpr()"
vim.cmd "augroup END"

-- Timeout length
vim.opt.timeoutlen = 500

-- Additional Settings
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.cmd "autocmd BufRead,BufNewFile *.* hi IndentBlanklineContextChar guifg=grey gui=nocombine"

vim.cmd "autocmd BufRead,BufNewFile Fastfile set filetype=ruby"
vim.opt.cmdheight = 1
vim.opt.rtp:append "/usr/local/opt/fzf"

vim.g.python_host_prog = vim.fn.systemlist("asdf which python")[1]
vim.g.python3_host_prog = vim.fn.systemlist("asdf which python3")[1]
vim.g.node_host_prog = vim.fn.systemlist("asdf which neovim-node-host")[1]
vim.g.ruby_host_prog = vim.fn.systemlist("asdf which neovim-ruby-host")[1]

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
