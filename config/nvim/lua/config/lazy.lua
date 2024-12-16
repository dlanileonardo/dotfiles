local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup {
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins", version = "13" },
    { import = "plugins" },
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = require("plugins.utils.servers").servers,
      },
    },
    -- { import = "lazyvim.plugins.extras.lsp.none-ls" },
    -- { import = "lazyvim.plugins.extras.coding.yanky" },
    { import = "lazyvim.plugins.extras.ai.codeium" },
    -- { import = "lazyvim.plugins.extras.ui.alpha" },
    -- { import = "lazyvim.plugins.extras.coding.tabnine" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  debug = false,
  -- ui = { wrap = "true" },
  -- install = { colorscheme = { "oxocarbon", "horizon", "cyberdream", "gruvbox-baby", "nord", "tokyonight" } },
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
}

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
