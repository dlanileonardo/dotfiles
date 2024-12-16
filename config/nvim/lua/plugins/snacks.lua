M = {
  "folke/snacks.nvim",
  enabled = true,
  opts = function()
    --- Add the startup section
    ---@return snacks.dashboard.Section?
    function Snacks.dashboard.sections.workspace(opts)
      local workspaces = require "workspaces"
      local items = workspaces.get()
      local ret = {} ---@type snacks.dashboard.Section

      return function()
        opts = opts or {}
        local workspaces = require "workspaces"
        local items = workspaces.get()

        vim.notify(vim.inspect(workspaces.name()))

        local limit = opts.limit or 7
        local ret = {} ---@type snacks.dashboard.Section

        for _, item in ipairs(items) do
          ret[#ret + 1] = {
            align = "left",
            desc = item.name,
            indent = 3,
            action = function()
              workspaces.open(item.name)
              Snacks.dashboard.open()
              vim.notify("Workspace: " .. item.name)
            end,
            autokey = true,
          }
          if #ret >= limit then
            break
          end
        end
        return ret
      end
    end

    -- vim.notify(vim.inspect(Snacks.dashboard.sections))
    return {
      dashboard = {
        preset = {
          header = [[
      ▄
      ▄▄▄▄▄
      ▄▄▄▄▄▄▄▄▄
      ▗  ▄▄▄▄▄▄▄▄▄  ▖
      ▄▄▄   ▄▄▄▄▄   ▄▄▄
      ▄▄▄▄▄▄▄   ▄   ▄▄▄▄▄▄▄
      ▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄
      ▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄
      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
      
      C Y B E R D Y N E
      SYSTEMS
       ]],
              -- stylua: ignore
              ---@type snacks.dashboard.Item[]
              keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
              },
        },

        sections = {
          { section = "header" },
          function()
            return {
              file = vim.fn.getcwd(),
              icon = "󰉓 ",
              padding = 1,
            }
          end,
          { section = "keys", gap = 1, padding = 1 },
          {
            title = "Workspaces",
            icon = "󰉓 ",
            section = "workspace",
            align = "left",
            enabled = true,
            padding = 1,
            limit = 10,
          },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                title = "Notifications",
                cmd = "gh notify -s -a -n5",
                icon = " ",
                height = 5,
                enabled = true,
              },
              {
                title = "Open Issues",
                cmd = "gh issue list -L 3",
                icon = " ",
                height = 7,
              },
              {
                icon = " ",
                title = "Open PRs",
                cmd = "gh pr list -L 3",
                height = 7,
              },
              {
                icon = " ",
                title = "Git Status",
                cmd = "hub --no-pager diff --stat -B -M -C",
                height = 10,
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                pane = 2,
                section = "terminal",
                enabled = in_git,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
              }, cmd)
            end, cmds)
          end,
          { section = "startup" },
        },
      },
    }
  end,
}

return M
