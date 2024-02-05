local M = {
  enabled = true,
  "ghillb/cybu.nvim",
  branch = "main", -- timely updates
  -- branch = "v1.x", -- won't receive breaking changes
  -- dependencies = { "kyazdani42/nvim-web-devicons" }, -- optional
  keys = {
    { "<S-tab>", "<plug>(CybuLastusedPrev)", desc = "Last Previous Buffer", mode = { "n", "v" } },
    { "<M-tab>", "<plug>(CybuLastusedNext)", desc = "Last Next Buffer",     mode = { "n", "v" } },
    -- { "<S-l>",     "<CMD>CybuNext<CR>",        desc = "Next Buffer" },
    -- { "<S-h>",     "<CMD>CybuPrev<CR>",        desc = "Previous Buffer" },
  },
  cmd = { "CybuPrev", "CybuNext", "CybuLastusedPrev", "CybuLastusedNext" },
  event = "BufRead",
  lazy = true,
  config = function()
    local ok, cybu = pcall(require, "cybu")
    if not ok then
      return
    end

    require("cybu").setup({
      position = {
        relative_to = "editor",
        anchor = "topcenter",
        vertical_offset = 5,
      },
      style = {
        border = "rounded",
        padding = 7,
        hide_buffer_id = true,
        highlights = {
          current_buffer = "BufferLineModifiedSelected",
          adjacent_buffers = "CybuAdjacent",
          background = "CybuBackground",
          border = "CybuBorder",
        },
      },
      behavior = {
        mode = {
          default = {
            switch = "immediate",
            view = "paging"
          },
          last_used = {
            switch = "immediate", -- immediate, on_close
            view = "paging",      -- paging, rolling
          },
          auto = {
            view = "paging", -- paging, rolling
          },
        },
        show_on_autocmd = "BufWinEnter",
      }
    })
  end,
}
return M
