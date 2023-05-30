-- general
vim.opt.shell = "/bin/sh"
vim.opt.relativenumber = true
vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.transparent_window = false
lvim.colorscheme = "nord"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")

lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    -- ["<C-n>"] = actions.cycle_history_next,
    -- ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- unmap a default keymapping
lvim.keys.normal_mode["<C-Up>"] = false

-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.active = false
-- lvim.builtin.project.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "comment",
  "css",
  "dart",
  "dockerfile",
  "fish",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "go",
  "graphql",
  "html",
  "java",
  "javascript",
  "json",
  "kotlin",
  "lua",
  "make",
  "markdown",
  "php",
  "python",
  "regex",
  "ruby",
  "rust",
  "scss",
  "sql",
  "swift",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
--   pattern = { "*" },
--   command = ":normal zz",
-- })

local aucmd_dict = {
  BufWinEnter = {
    {
      pattern = { "*.*" },
      command = "setlocal foldmethod=indent"
    },
    {
      pattern = { "*.*" },
      command = "set foldexpr=nvim_treesitter#foldexpr()"
    },
  }
}

for event, opt_tbls in pairs(aucmd_dict) do
  for _, opt_tbl in pairs(opt_tbls) do
    vim.api.nvim_create_autocmd(event, opt_tbl)
  end
end

vim.opt.timeoutlen = 500
vim.opt.list = false

vim.cmd([[
  set nofoldenable
  set foldlevel=99
]])

vim.cmd([[
  set tabstop     =2
  set softtabstop =2
  set shiftwidth  =2
  set expandtab
  set smarttab
]])

vim.cmd([[
  au BufRead,BufNewFile *.* hi IndentBlanklineContextChar guifg=grey gui=nocombine
]])

vim.cmd([[
  au BufRead,BufNewFile Fastfile set filetype=ruby
  set cmdheight=1
  set rtp+=/usr/local/opt/fzf
  let g:node_host_prog = systemlist("asdf which neovim-node-host")[0]
  let g:ruby_host_prog = systemlist("asdf which neovim-ruby-host")[0]
  let g:loaded_perl_provider = 0
]])

lvim.builtin.alpha.startify.section.header.val = {
  "                                      ",
  "                  ▄                   ",
  "                ▄▄▄▄▄                 ",
  "              ▄▄▄▄▄▄▄▄▄               ",
  "           ▗  ▄▄▄▄▄▄▄▄▄  ▖            ",
  "          ▄▄▄   ▄▄▄▄▄   ▄▄▄           ",
  "        ▄▄▄▄▄▄▄   ▄   ▄▄▄▄▄▄▄         ",
  "      ▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄       ",
  "    ▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄     ",
  "  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ",
  "                                      ",
  "           C Y B E R D Y N E          ",
  "               SYSTEMS                ",
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"

-- lvim.builtin.alpha.startify.section.header.opts = {
--   position = "center",
--   h1 = "Label",
-- }
