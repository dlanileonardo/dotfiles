-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities.textDocument.documentHighlight = true
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require 'lspconfig'.dartls.setup {
--   capabilities = capabilities,
--   -- cmd = {},
--   init_options = {
--     closingLabels = true,
--     flutterOutline = true,
--     onlyAnalyzeProjectsWithOpenFiles = false,
--     outline = true,
--     suggestFromUnimportedLibraries = true
--   },
--   settings = {
--     dart = {
--       completeFunctionCalls = true,
--       showTodos = true
--     }
--   }
-- }

require("flutter-tools").setup {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  outline = {
    open_cmd = "70vnew",
    auto_open = true
  },
  widget_guides = {
    enabled = false,
  },
  dev_log = {
    enabled = true,
    open_cmd = "15new",
  },
  -- lsp = {
  --   on_attach = require("lvim.lsp").common_on_attach,
  -- },
  flutter_lookup_cmd = "asdf where flutter",
}
require("telescope").load_extension("flutter")

local command_center = require("command_center")
command_center.add({
  {
    description = "Flutter - Outline Toggle",
    cmd = "<CMD>:FlutterOutlineToggle<CR>",
  },
  {
    description = "Flutter - Outline Open",
    cmd = "<CMD>:FlutterOutlineOpen<CR>",
  },
  {
    description = "Flutter Run",
    cmd = "<CMD>:FlutterRun<CR>",
  },
  {
    description = "Flutter Reload",
    cmd = "<CMD>:FlutterReload<CR>",
  },
  {
    description = "Flutter Restart",
    cmd = "<CMD>:FlutterRestart<CR>",
  },
  {
    description = "Flutter Quit",
    cmd = "<CMD>:FlutterQuit<CR>",
  },
  {
    description = "Flutter Devices",
    cmd = "<CMD>:FlutterDevices<CR>",
  },
  {
    description = "Flutter Clear Log",
    cmd = "<CMD>:FlutterLogClear<CR>"
  },
  {
    description = "Flutter Emulators",
    cmd = "<CMD>:FlutterEmulators<CR>",
  },
  {
    description = "Flutter Lsp Restart",
    cmd = "<CMD>:FlutterLspRestart<CR>",
  },
  {
    description = "Telescope Flutter",
    cmd = ":lua require('telescope').extensions.flutter.commands()<CR>",
    keybindings = { "n", "<leader>lo" }
  }
})

vim.notify("dartls loaded")
