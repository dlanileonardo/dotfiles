local M = {
  "nvim-lualine/lualine.nvim",
  -- commit = "0050b308552e45f7128f399886c86afefc3eb988",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  local git_blame = require('gitblame')

  if not status_ok then
    return
  end

  local components = require('user.lualine.components')

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    always_visible = true,
  }

  local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
  }

  local filetype = {
    "filetype",
    icons_enabled = true,
  }

  local location = {
    "location",
    padding = 0,
  }

  local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end
  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = '\\', right = '/' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { "alpha", "NvimTree", "Outline", "flutterToolsOutline" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { components.mode },
      lualine_b = { components.branch },
      -- lualine_c = { components.diff },
      lualine_c = { components.diff, { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }, },
      lualine_x = { components.diagnostics, components.lsp, components.spaces, components.filetype },
      -- lualine_c = { "filename", diagnostics, { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
      -- lualine_x = { diff, components.lsp, spaces, "encoding", filetype },
      lualine_y = { components.location },
      lualine_z = { components.progress },
    },
  }
end

return M
