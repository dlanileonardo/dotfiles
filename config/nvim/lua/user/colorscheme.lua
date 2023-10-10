local M = {
  enabled = true,
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "oxocarbon"
function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

-- vim.cmd "colorscheme oxocarbon"

return M
