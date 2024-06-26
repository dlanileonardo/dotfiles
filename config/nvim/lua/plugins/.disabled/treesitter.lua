local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
  },
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = {
      "bicep",
      "devicetree",
      "gomod",
      "groovy",
      "kconfig",
      "luadoc",
      "luau",
      "nim",
      "odin",
      "perl",
      "slint",
      "v",
      "markdown_inline",
      "bash",
      "c",
      "comment",
      "css",
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
    }, -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<TAB>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
      },
    },
    -- context_commentstring = {
    --   enable = true,
    --   enable_autocmd = false,
    -- },
  }
end

return M
