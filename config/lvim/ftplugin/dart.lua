local dap = require('dap')
local capabilities = vim.lsp.protocol.make_client_capabilities()

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
    enabled = true,
  },
  dev_log = {
    enabled = true,
    open_cmd = "15new",
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
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
  lsp = {
    on_attach = require("lvim.lsp").common_on_attach,
    color = {
      enabled = true,         -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false,     -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false,     -- highlight the foreground
      virtual_text = true,    -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    settings = {
      dart = {
        lineLength = 120,
      },
      showTodos = true,
      completeFunctionCalls = true,
      -- analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    },
  },
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
