local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
}

function M.config()
  require("which-key").setup {}

  require("which-key").register({
    -- Use which-key to add extra bindings with the leader-key prefix
    -- ['l']['K'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" }
    -- ["e"] = { "<cmd>Telescope file_browser<CR>", "Telescope Explorer" }
    -- ["s"]["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
    -- ["s"]["E"] = { "<cmd>Telescope file_browser<CR>", "Telescope Explorer" }
    -- ["b"]["n"] = { "<cmd>bnext<cr>", "Next Buffer" }
    -- ["b"]["1"] = { "<cmd>bfirst<cr>", "First Buffer" }
    -- ["b"]["0"] = { "<cmd>blast<cr>", "Last Buffer" }
    -- ["b"]["b"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" }
    -- ["b"]["n"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" }

    -- ["L"]["h"] = { "<cmd>:CheckHealth<cr>", "Check Health" }

    t = {
      name = "Trouble",
      t = { "<cmd>TroubleToggle<cr>", "Toggle" },
      r = { "Trouble lsp_references<cr>", "References" },
      f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
      d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
      q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
      l = { "<cmd>Trouble loclist<cr>", "LocationList" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
      a = { "<cmd>TodoTrouble<cr>", "TODO" }
    },

    s = {
      p = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme with Preview" },
    },

    c = { "<cmd>Bdelete<cr>", "Close Buffer" }
  })
end

return M
