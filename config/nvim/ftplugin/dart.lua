local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local opts = {
  capabilities = capabilities,
}

-- require("lspconfig").dartls.setup(opts)
require("telescope").load_extension("flutter")

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


vim.notify("dart loaded")
