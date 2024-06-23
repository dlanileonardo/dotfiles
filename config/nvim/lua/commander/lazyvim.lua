return {
  {
    keys = { "n", "<leader>uf" },
    desc = "Toggle Auto Format (Global)",
    cmd = function()
      LazyVim.format.toggle()
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>uF" },
    desc = "Toggle Auto Format (Buffer)",
    cmd = function()
      LazyVim.format.toggle(true)
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>us" },
    desc = "Toggle Spelling",
    cmd = function()
      LazyVim.toggle "spell"
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>uw" },
    desc = "Toggle Word Wrap",
    cmd = function()
      LazyVim.toggle "wrap"
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>uL" },
    desc = "Toggle Relative Line Numbers",
    cmd = function()
      LazyVim.toggle "relativenumber"
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>ul" },
    desc = "Toggle Line Numbers",
    cmd = function()
      LazyVim.toggle.number()
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>ud" },
    desc = "Toggle Diagnostics",
    cmd = function()
      LazyVim.toggle.diagnostics()
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>uc" },
    desc = "Toggle Conceal",
    cmd = function()
      LazyVim.toggle("conceallevel", false, { 0, conceallevel })
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>uh" },
    desc = "Toggle Inlay Hints",
    cmd = function()
      LazyVim.toggle.inlay_hints()
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>uT" },
    desc = "Toggle Treesitter Highlight",
    cmd = function()
      if vim.b.ts_highlight then
        vim.treesitter.stop()
      else
        vim.treesitter.start()
      end
    end,
    cat = "LazyVim",
  },
  {
    keys = { "n", "<leader>ub" },
    desc = "Toggle Background",
    cmd = function()
      LazyVim.toggle("background", false, { "light", "dark" })
    end,
    cat = "LazyVim",
  },
}
