local M = {
  "akinsho/bufferline.nvim",
  -- commit = "c7492a76ce8218e3335f027af44930576b561013",
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons'
    },
    {
      "famiu/bufdelete.nvim",
      -- commit = "8933abc09df6c381d47dc271b1ee5d266541448e",
    },
  },
}

function M.config()
  local g_ok, bufferline_groups = pcall(require, "bufferline.groups")

  require("bufferline").setup {
    options = {
      separator_style = "slope",
      show_close_icon = false,
      always_show_bufferline = true,
      close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      -- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    },
    -- highlights = {
    --   fill = {
    --     fg = { attribute = "fg", highlight = "#ff0000" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   background = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   buffer_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   close_button = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   close_button_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   tab_selected = {
    --     fg = { attribute = "fg", highlight = "Normal" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --   tab = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   tab_close = {
    --     -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
    --     fg = { attribute = "fg", highlight = "TabLineSel" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --   duplicate_selected = {
    --     fg = { attribute = "fg", highlight = "TabLineSel" },
    --     bg = { attribute = "bg", highlight = "TabLineSel" },
    --     italic = true,
    --   },
    --   duplicate_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --     italic = true,
    --   },
    --   duplicate = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --     italic = true,
    --   },
    --   modified = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   modified_selected = {
    --     fg = { attribute = "fg", highlight = "Normal" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --   modified_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   separator = {
    --     fg = { attribute = "bg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   separator_selected = {
    --     fg = { attribute = "bg", highlight = "Normal" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --   indicator_selected = {
    --     fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    -- },
  }
end

-- Common kill function for bdelete and bwipeout
-- credits: based on bbye and nvim-bufdel
---@param kill_command? string defaults to "bd"
---@param bufnr? number defaults to the current buffer
---@param force? boolean defaults to false
function M.buf_kill(kill_command, bufnr, force)
  kill_command = kill_command or "bd"

  local bo = vim.bo
  local api = vim.api
  local fmt = string.format
  local fn = vim.fn

  if bufnr == 0 or bufnr == nil then
    bufnr = api.nvim_get_current_buf()
  end

  local bufname = api.nvim_buf_get_name(bufnr)

  if not force then
    local choice
    if bo[bufnr].modified then
      choice = fn.confirm(fmt([[Save changes to "%s"?]], bufname), "&Yes\n&No\n&Cancel")
      if choice == 1 then
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd("w")
        end)
      elseif choice == 2 then
        force = true
      else return
      end
    elseif api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
      choice = fn.confirm(fmt([[Close "%s"?]], bufname), "&Yes\n&No\n&Cancel")
      if choice == 1 then
        force = true
      else
        return
      end
    end
  end

  -- Get list of windows IDs with the buffer to close
  local windows = vim.tbl_filter(function(win)
    return api.nvim_win_get_buf(win) == bufnr
  end, api.nvim_list_wins())

  if force then
    kill_command = kill_command .. "!"
  end

  -- Get list of active buffers
  local buffers = vim.tbl_filter(function(buf)
    return api.nvim_buf_is_valid(buf) and bo[buf].buflisted
  end, api.nvim_list_bufs())

  -- If there is only one buffer (which has to be the current one), vim will
  -- create a new buffer on :bd.
  -- For more than one buffer, pick the previous buffer (wrapping around if necessary)
  if #buffers > 1 and #windows > 0 then
    for i, v in ipairs(buffers) do
      if v == bufnr then
        local prev_buf_idx = i == 1 and #buffers or (i - 1)
        local prev_buffer = buffers[prev_buf_idx]
        for _, win in ipairs(windows) do
          api.nvim_win_set_buf(win, prev_buffer)
        end
      end
    end
  end

  -- Check if buffer still exists, to ensure the target buffer wasn't killed
  -- due to options like bufhidden=wipe.
  if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
    vim.cmd(string.format("%s %d", kill_command, bufnr))
  end
end

return M
