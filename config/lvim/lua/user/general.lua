-- general
vim.opt.shell = "/bin/sh"
vim.opt.relativenumber = true

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "gruvbox-baby"
lvim.transparent_window = false

if lvim.colorscheme == "gruvbox-baby" then
  -- GRUVBO-BABY
  local config = require("gruvbox-baby.config")
  local colors = require("gruvbox-baby.colors")
  local c = colors.config(config)
  lvim.builtin.lualine.options.theme = "gruvbox"

  vim.g.gruvbox_baby_highlights = {
    -- Visual = { bg = c.medium_gray },
    -- IncSearch = { bg = colors.p.medium_red },
    Search = { fg = c.background, bg = c.soft_yellow },
    -- VisualNOS = { bg = c.medium_gray },
  }

  vim.g.gruvbox_baby_telescope_theme = 1
  -- vim.g.gruvbox_baby_transparent_mode = 1
  vim.g.gruvbox_baby_background_color = "medium"
elseif lvim.colorscheme == "tokyonight" then
  lvim.builtin.lualine.options.theme = "tokyonight"
  vim.g.tokyonight_style = "night"
elseif lvim.colorscheme == "nightfox" or lvim.colorscheme == "duskfox" then
  require('nightfox').setup({
    options = {
      compile_path = vim.fn.stdpath("cache") .. "/nightfox",
      compile_file_suffix = "_compiled",
      transparent = true,
      terminal_colors = true,
      dim_inactive = true,
      styles = {
        comments = "italic",
        conditionals = "NONE",
        constants = "NONE",
        functions = "bold",
        keywords = "italic",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
    },
  })
elseif lvim.colorscheme == "gruvbox-material" then
  -- GRUVBOX-MATERIAL
  vim.g.gruvbox_material_enable_italic = 1
  vim.g.gruvbox_material_foreground = 'original'
  vim.g.gruvbox_material_ui_contrast = 'high'
  vim.g.gruvbox_material_background = 'medium'
  vim.g.gruvbox_material_statusline_style = 'default'
  lvim.builtin.lualine.options.theme = "gruvbox-material"
elseif lvim.colorscheme == "sonokai" then
  -- SONOKAI
  vim.g.sonokai_material_enable_italic = 1
  vim.g.sonokai_style = 'andromeda'
elseif lvim.colorscheme == "catppuccin" then
  vim.g.catppuccin_flavour = "mocha"
  lvim.builtin.lualine.options.theme = "catppuccin"
end

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

-- TODO: User Config for predefined plug sins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "dart",
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
vim.opt.list = true

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

lvim.builtin.alpha.dashboard.section.header.val = {
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

-- lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "startify"
-- lvim.builtin.alpha.startify.section.header.opts = {
--   position = "center",
--   h1 = "Label",
-- }
