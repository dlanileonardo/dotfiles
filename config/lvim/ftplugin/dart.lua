local dap = require('dap')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
  init_options = {
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true
  },
  settings = {
    dart = {
      lineLength = 120,
    }
  }
}

require("flutter-tools").setup {
  capabilities = capabilities,
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
  debugger = {
    enabled = true,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
    register_configurations = function(paths)
      dap.configurations.dart = {
        {
          name = "Flutter launch Debug",
          type = "dart",
          request = "launch",
          program = "lib/main.dart",
          flutterMode = "debug",
          runInTerminal = false,
          args = { "-d", "macos" },
        },
        {
          name = "Flutter Run all Tests",
          type = "dart",
          request = "launch",
          program = "./test/",
          runInTerminal = true,
        },
        {
          name = "Flutter: Attach to Device",
          type = "dart",
          request = "attach",
          runInTerminal = true,
        },
        {
          name = "Flutter: Launch Profile",
          type = "dart",
          request = "launch",
          program = "lib/main.dart",
          flutterMode = "profile",
          runInTerminal = true,
        },
      }
      -- require("dap.ext.vscode").load_launchjs()
    end,
  },
  -- lsp = {
  -- on_attach = require("lvim.lsp").common_on_attach,
  -- },
  flutter_lookup_cmd = "asdf where flutter",
}
require("telescope").load_extension("flutter")
require("lvim.lsp.manager").setup("dartls", opts)

local command_center = require("command_center")
local category = "LSP - Flutter"

command_center.add({
  {
    description = "Flutter - Outline Toggle",
    cmd = "<CMD>FlutterOutlineToggle<CR>",
    category = category,
  },
  {
    description = "Flutter - Outline Open",
    cmd = "<CMD>FlutterOutlineOpen<CR>",
    category = category,
  },
  {
    description = "Flutter Run",
    cmd = "<CMD>FlutterRun<CR>",
    category = category,
  },
  {
    description = "Flutter Reload",
    cmd = "<CMD>FlutterReload<CR>",
    category = category,
  },
  {
    description = "Flutter Restart",
    cmd = "<CMD>FlutterRestart<CR>",
    category = category,
  },
  {
    description = "Flutter Quit",
    cmd = "<CMD>FlutterQuit<CR>",
    category = category,
  },
  {
    description = "Flutter Devices",
    cmd = "<CMD>FlutterDevices<CR>",
    category = category,
  },
  {
    description = "Flutter Clear Log",
    cmd = "<CMD>FlutterLogClear<CR>",
    category = category,
  },
  {
    description = "Flutter Emulators",
    cmd = "<CMD>FlutterEmulators<CR>",
    category = category,
  },
  {
    description = "Flutter Lsp Restart",
    cmd = "<CMD>FlutterLspRestart<CR>",
    category = category,
  },
  {
    description = "Telescope Flutter",
    cmd = ":lua require('telescope').extensions.flutter.commands()<CR>",
    category = category,
  }
})

vim.notify("dartls loaded")
