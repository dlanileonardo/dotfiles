local M = {
  enabled = true,
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  ft = { 'dart' },
  event = "BufRead pubspec.yaml"
}

function M.config()
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
      enabled = false,
      run_via_dap = true,
    },
    lsp = {
      -- on_attach = require("lspconfig").on_attach,
      -- capabilities = require("lspconfig").capabilities,
      color = {
        enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false, -- highlight the background
        background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
        foreground = false, -- highlight the foreground
        virtual_text = true, -- show the highlight using virtual text
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
end

return M
