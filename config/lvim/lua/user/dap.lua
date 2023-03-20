lvim.builtin.dap.active = true

-- local dap = require('dap')

-- -- dap.adapters.chrome = {
-- --   type = "executable",
-- --   command = "node",
-- --   args = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js" }
-- -- }

-- -- dap.configurations.javascript = { -- change this to javascript if needed
-- --   {
-- --     type = "chrome",
-- --     request = "attach",
-- --     program = "${file}",
-- --     cwd = vim.fn.getcwd(),
-- --     sourceMaps = true,
-- --     protocol = "inspector",
-- --     port = 9222,
-- --     webRoot = "${workspaceFolder}"
-- --   }
-- -- }

-- local api = vim.api
-- local keymap_restore = {}
-- dap.listeners.after['event_initialized']['me'] = function()
--   for _, buf in pairs(api.nvim_list_bufs()) do
--     local keymaps = api.nvim_buf_get_keymap(buf, 'n')
--     for _, keymap in pairs(keymaps) do
--       if keymap.lhs == "K" then
--         table.insert(keymap_restore, keymap)
--         api.nvim_buf_del_keymap(buf, 'n', 'K')
--       end
--     end
--   end
--   api.nvim_set_keymap(
--     'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
-- end

-- dap.listeners.after['event_terminated']['me'] = function()
--   for _, keymap in pairs(keymap_restore) do
--     api.nvim_buf_set_keymap(
--       keymap.buffer,
--       keymap.mode,
--       keymap.lhs,
--       keymap.rhs,
--       { silent = keymap.silent == 1 }
--     )
--   end
--   keymap_restore = {}
-- end

-- require('dap-vscode-js').setup({
--   debugger_path = os.getenv("HOME") .. "/.local./share/nvim/mason/packages/js-debug-adapter",
--   debugger_cmd = { 'js-debug-adapter' },
--   adapters = {
--     'pwa-node',
--     'pwa-chrome',
--     'pwa-msedge',
--     'node-terminal',
--     'pwa-extensionHost',
--   },
-- })

-- for _, language in ipairs({ 'typescript', 'javascript' }) do
--   require('dap').configurations[language] = {
--     {
--       name = 'Attach to Node Functions - from init.lua',
--       type = 'pwa-chrome',
--       request = 'launch',
--       port = 9222,
--       url = "http://localhost:4200",
--       preLaunchTask = 'npm: start',
--     }
--   }
-- end

require("dapui").setup {}
