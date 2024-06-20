local M = {
  enabled = true,
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local alpha = require "alpha"
  local dashboard = require "alpha.themes.startify"
  dashboard.section.header.val = {
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
  -- dashboard.section.buttons.val = {
  --   dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  --   dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  --   dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  --   dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  --   dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  --   dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  --   dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  -- }
  -- local function footer()
  --   return "chrisatmachine.com"
  -- end

  -- dashboard.section.footer.val = footer()

  -- dashboard.section.footer.opts.hl = "Type"
  -- dashboard.section.header.opts.hl = "Include"
  -- dashboard.section.buttons.opts.hl = "Keyword"

  -- dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "BDeletePost*",
  group = alpha_on_empty,
  callback = function(event)
    local fallback_name = vim.api.nvim_buf_get_name(event.buf)
    local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
    local fallback_on_empty = fallback_name == "" and fallback_ft == ""

    if fallback_on_empty then
      -- require("neo-tree").close_all()
      vim.cmd "Alpha"
      vim.cmd(event.buf .. "bwipeout")
    end
  end,
})

return M
