local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
    { "williamboman/mason.nvim",
      opts = {
        ensure_installed =  require("plugins.utils.servers").servers
      }
    },
    { import = "lazyvim.plugins.extras.lsp.none-ls" },
    { import = "lazyvim.plugins.extras.coding.yanky" },
    -- { import = "lazyvim.plugins.extras.coding.tabnine" },
    { import = "lazyvim.plugins.extras.coding.codeium" },
  },
  defaults = {
    lazy = false,
    version = false,
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  debug = false,
  ui = { wrap = "true" },
  -- install = { colorscheme = { "oxocarbon", "horizon", "cyberdream", "gruvbox-baby", "nord", "tokyonight" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- load lazy
-- require("lazy").setup("plugins", {
--   install = { colorscheme = { "tokyonight", "habamax" } },
--   defaults = { lazy = true },
--   ui = { wrap = "true" },
--   change_detection = { enabled = true },
--   debug = false,
--   performance = {
--     rtp = {
--       disabled_plugins = {
--         -- "gzip", -- Plugin for editing compressed files.
--         -- "matchit", -- What is it?
--         --  "matchparen", -- Plugin for showing matching parens
--         --  "netrwPlugin", -- Handles file transfers and remote directory listing across a network
--         --  "tarPlugin", -- Plugin for browsing tar files
--         --  "tohtml", -- Converting a syntax highlighted file to HTML
--         --  "tutor", -- Teaching?
--         --  "zipPlugin", -- Handles browsing zipfiles
--       },
--     },
--   },
-- })
