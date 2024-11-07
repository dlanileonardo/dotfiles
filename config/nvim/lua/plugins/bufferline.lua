local M = {
  enabled = true,
  "akinsho/bufferline.nvim",
  commit = "99337f63f0a3c3ab9519f3d1da7618ca4f91cffe",
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  local g_ok, bufferline_groups = pcall(require, "bufferline.groups")

  require("bufferline").setup {
    options = {
      separator_style = "slope",
      show_close_icon = false,
      show_buffer_close_icons = false,
      always_show_bufferline = true,
      close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      -- name_formatter = function(buf) -- buf contains:
      --   -- name                | str        | the basename of the active file
      --   -- path                | str        | the full path of the active file
      --   -- bufnr (buffer only) | int        | the number of the active buffer
      --   -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
      --   -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
      --   return buf.path
      -- end,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match "error" and " " or " "
        return " " .. icon .. count
      end,
      groups = {
        options = {
          toggle_hidden_on_enter = true,
        },
        items = {
          bufferline_groups.builtin.pinned:with { icon = "" },
          bufferline_groups.builtin.ungrouped,
          {
            name = "ctrl",
            -- priority = 2,
            icon = "",
            matcher = function(buf)
              local path = buf.path
              return path:match "controller[s]?/" or buf.name:match "[cC]ontroller"
            end,
            separator = { -- Optional
              style = require("bufferline.groups").separator.tab,
            },
          },
          {
            name = "viws",
            -- priority = 3,
            icon = "󰡃",
            matcher = function(buf)
              local name = buf.path
              return name:match "view[s]?/"
            end,
            separator = { -- Optional
              style = require("bufferline.groups").separator.tab,
            },
          },
          {
            name = "mdls",
            -- priority = 4,
            icon = "󰛡",
            matcher = function(buf)
              local name = buf.path
              return name:match "model[s]?/"
            end,
            separator = { -- Optional
              style = require("bufferline.groups").separator.tab,
            },
          },
          {
            name = "lib",
            -- priority = 5,
            icon = "",
            matcher = function(buf) -- Mandatory
              local name = vim.api.nvim_buf_get_name(buf.id)
              return name:match "lib[s]?/"
            end,
            separator = { -- Optional
              style = require("bufferline.groups").separator.tab,
            },
          },
          {
            name = "test",
            -- priority = 4,
            icon = "",
            matcher = function(buf)
              return buf.path:match "spec[s]?/"
                or buf.name:match "_spec"
                or buf.path:match "test[s]?/"
                or buf.name:match "_test"
                or buf.path:match "_spec.rb"
            end,
            separator = { -- Optional
              style = require("bufferline.groups").separator.tab,
            },
          },
          {
            name = "doc",
            -- priority = 6,
            icon = "󰈙",
            matcher = function(buf)
              local name = vim.api.nvim_buf_get_name(buf.id)
              return name:match "%.md" or name:match "%.txt"
            end,
            separator = { -- Optional
              style = require("bufferline.groups").separator.tab,
            },
          },
        },
      },
    },
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
          vim.cmd "w"
        end)
      elseif choice == 2 then
        force = true
      else
        return
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
