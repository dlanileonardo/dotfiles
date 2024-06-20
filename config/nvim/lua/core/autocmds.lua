local M = {}

local get_format_on_save_opts = function()
  local defaults = require("config.defaults").format_on_save
  -- accept a basic boolean `vim.g.format_on_save=true`
  if type(vim.g.format_on_save) ~= "table" then
    return defaults
  end

  return {
    pattern = vim.g.format_on_save.pattern or defaults.pattern,
    timeout = vim.g.format_on_save.timeout or defaults.timeout,
  }
end

function M.enable_format_on_save()
  local opts = get_format_on_save_opts()
  vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      require("plugins.lsp.utils").format { timeout_ms = opts.timeout, filter = opts.filter }
    end,
  })
  -- Log:debug "enabled format-on-save"
end

function M.disable_format_on_save()
  M.clear_augroup "lsp_format_on_save"
  -- Log:debug "disabled format-on-save"
end

function M.configure_format_on_save()
  if type(vim.g.format_on_save) == "table" and vim.g.format_on_save.enabled then
    M.enable_format_on_save()
  elseif vim.g.format_on_save == true then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.toggle_format_on_save()
  local exists, autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = "lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmds == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

--- Clean autocommand in a group if it exists
--- This is safer than trying to delete the augroup itself
---@param name string the augroup name
function M.clear_augroup(name)
  -- defer the function in case the autocommand is still in-use
  -- Log:debug("request to clear autocmds  " .. name)
  vim.schedule(function()
    pcall(function()
      vim.api.nvim_clear_autocmds { group = name }
    end)
  end)
end

return M
