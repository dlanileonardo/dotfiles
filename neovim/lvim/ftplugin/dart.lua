local dap = require('dap')
local lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities.textDocument.documentHighlight = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.dartls.setup {
  capabilities = capabilities
}

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/dart/Dart-Code/out/dist/debug.js" },
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
          runInTerminal = true,
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
