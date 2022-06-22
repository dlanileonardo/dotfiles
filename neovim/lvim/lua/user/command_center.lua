local command_center = require("command_center")
-- local noremap = { noremap = true }
-- local silent_noremap = { noremap = true, silent = true }

-- edit a default keymapping
-- lvim.builtin.which_key.on_config_done = function()
command_center.add({
  {
    description = "Save File",
    cmd = "<CMD>w <CR>",
    keybindings = { "n", "<C-s>" },
  },
  {
    description = "Buffer Next",
    cmd = "<CMD>bn<CR>",
    keybindings = { "n", "<C-l>" },
  },
  {
    description = "Buffer Previous",
    cmd = "<CMD>bp<CR>",
    keybindings = { "n", "<C-h>" },
  },
  {
    description = "Tab Close",
    cmd = "<CMD>tabclose<CR>",
    keybindings = { "n", "<M-w>" },
  },
  {
    description = "Exit Vim",
    cmd = "<CMD>qa<CR>",
    keybindings = { "n", "<C-q>" },
  },
  {
    description = "Find files",
    cmd = "<CMD>Telescope find_files<CR>",
  },
  {
    description = "Search inside current buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
  },
  {
    description = "Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
  },
  {
    description = "Show document symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
  },
  {
    description = "LSP - Code Actions",
    cmd = "<CMD>lua vim.lsp.buf.code_action()<CR>",
    -- keybindings = { "n", "ca" }
  },
  {
    description = "LSP - Range Code Action",
    cmd = "<CMD>lua vim.lsp.buf.range_code_action()<CR>",
    -- keybindings = { "x", "ca" }
  },
  {
    description = "LSP - Go to Definition",
    cmd = "<CMD>lua vim.lsp.buf.definition()<CR>",
    keybindings = { "n", "gd" }
  },
  {
    description = "LSP Hover",
    cmd = "<CMD>lua vim.lsp.buf.hover()<cr>",
    keybindings = { "n", "K" }
  },
  {
    description = "Telescope File Explorer",
    cmd = "<CMD>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
  },
  {
    description = "Telescope File Browser",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
  },
  {
    description = "Telescope Search Word",
    cmd = "<CMD>lua require('telescope.builtin').live_grep()<CR>",
  },
  {
    description = "Telescope git Files",
    cmd = "<CMD>lua require('telescope.builtin').git_files()<CR>",
    keybindings = { "n", "<C-p>" },
  },
  {
    description = "Telescope Files",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
  },
  {
    description = "Telescope Buffers",
    cmd = "<CMD>lua require('telescope.builtin').buffers()<CR>",
  },
  {
    description = "Telescope Keymaps",
    cmd = "<CMD>lua require('telescope.builtin').keymaps()<CR>"
  },
  {
    description = "Telescope Current Buffer",
    cmd = "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    keybindings = { "n", "<M-p>" },
  },
  {
    description = "Update LunarVim",
    cmd = "<CMD>LvimUpdate<CR>",
  },
  {
    description = "Toggle Auto Format",
    cmd = "<CMD>LvimToggleFormatOnSave<CR>",
  },
  {
    description = "View Notification",
    cmd = "<CMD>Telescope notify<cr>",
  },
  {
    description = "Reload LunarVim's configuration",
    cmd = "<cmd>LvimReload<cr>",
  },
  {
    description = "Open Config File",
    cmd = "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>"
  },
  {
    description = "Git - History",
    cmd = "<CMD>DiffviewFileHistory<CR>",
  },
  {
    description = "Git - Diff",
    cmd = "<CMD>DiffviewOpen<CR>",
  },
  -- {
  --   description = "Surround with \"",
  --   cmd = "ciw\"\"<Esc>P",
  --   keybindings = { "n", "cs\"" },
  -- },
  -- {
  --   description = "Surround with \'",
  --   cmd = "ciw''<Esc>P",
  --   keybindings = { "n", "cs'" },
  -- },
  -- {
  --   description = "Unsurround",
  --   cmd = "mpeld bhd `ph",
  --   keybindings = { "n", "csd" }
  -- },
  {
    description = "Outline",
    cmd = "<CMD>SymbolsOutline<CR>",
  },
  {
    description = "NvimTree - Toggle",
    cmd = "<CMD>NvimTreeToggle<CR>",
    keybindings = { "n", "<M-b>" }
  },
  {
    description = "NvimTree - Find File",
    cmd = "<CMD>NvimTreeFindFile<CR>",
  },
  {
    description = "Split in Horizontal",
    cmd = "<CMD>sp<CR>",
  },
  {
    description = "Split in Vertical",
    cmd = "<CMD>vsp<CR>"
  },
  {
    description = "Cheat Sheet",
    cmd = "<CMD>CheatSH<CR>",
    keybindings = { "n", "<M-c>" }
  },
  {
    description = "Next",
    cmd = "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "m" },
  },
  {
    description = "Previous",
    cmd = "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "N" },
  },
  {
    description = "*",
    cmd = "*<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "*" },
  },
  {
    description = "#",
    cmd = "#<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "#" },
  },
  {
    description = "g*",
    cmd = "g*<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "g*" },
  },
  {
    description = "g#",
    cmd = "g#<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "g#" },
  },
  {
    description = "Update Core Packages",
    cmd = "<CMD>LvimSyncCorePlugins<CR>",
  },
  {
    description = "Update Plugins",
    cmd = "<CMD>PackerSync<CR>"
  },
  {
    description = "Hover",
    cmd = "<cmd>lua vim.lsp.buf.hover()<cr>",
    keybindings = { "n", "<Leader>lK" }
  },
  {
    description = "Telescope Explorer",
    cmd = "<cmd>Telescope file_browser<CR>",
    keybindings = { "n", "e" }
  },
  {
    description = "Teleescope Projects",
    cmd = "<cmd>Telescope projects<CR>",
    keybindings = { "n", "<Leader>sP" }
  },
  {
    description = "Teleescope Explorer",
    cmd = "<cmd>Telescope file_browser<CR>",
    keybindings = { "n", "<Leader>sE" }
  },
  {
    description = "Next Buffer",
    cmd = "<cmd>:bnext<cr>",
    keybindings = { "n", "<leader>bn" }
  },
  {
    description = "First Buffer",
    cmd = "<cmd>:bfirst<cr>",
    keybindings = { "n", "<leader>b1" }
  },
  {
    description = "Last Buffer",
    cmd = "<cmd>:blast<cr>",
    keybindings = { "n", "<leader>b0" }
  },
  {
    description = "Check Health",
    cmd = "<cmd>:CheckHealth<cr>",
    keybindings = { "n", "<leader>Lh" }
  },
  {
    description = "Toggle",
    cmd = "<cmd>TroubleToggle<cr>",
    keybindings = { "n", "<leader>tt" }
  },
  {
    description = "References",
    cmd = "<cmd>Trouble lsp_references<cr>",
    keybindings = { "n", "<leader>tr" }
  },
  {
    description = "Definitions",
    cmd = "<cmd>Trouble lsp_definitions<cr>",
    keybindings = { "n", "<leader>tf" }
  },
  {
    description = "Diagnostics",
    cmd = "<cmd>Trouble document_diagnostics<cr>",
    keybindings = { "n", "<leader>td" }
  },
  {
    description = "QuickFix",
    cmd = "<cmd>Trouble quickfix<cr>",
    keybindings = { "n", "<leader>tq" }
  },
  {
    description = "LocationList",
    cmd = "<cmd>Trouble loclist<cr>",
    keybindings = { "n", "<leader>tl" }
  },
  {
    description = "Wordspace Diagnostics",
    cmd = "<cmd>Trouble workspace_diagnostics<cr>",
    keybindings = { "n", "<leader>tw" }
  },
  {
    description = "Retab to Space",
    cmd = "<CMD>set expandtab<CR><CMD>retab<CR>",
    keybindings = { "n", "key" }
  },
  {
    description = "Hop Word",
    cmd = "<CMD>HopWord<CR>",
    keybindings = { "n", "ff" }
  },
  {
    description = "Hop Line",
    cmd = "<CMD>HopLine<CR>",
    keybindings = { "n", "fl" }
  },
  {
    description = "Hop Line Start",
    cmd = "<CMD>HopLineStart<CR>",
    keybindings = { "n", "fs" },
  },
  {
    description = "Hop in Current Line",
    cmd = "<CMD>lua require'hop'.hint_words({ current_line_only = true })<CR>",
    keybindings = { "n", "fd" }
  },
  {
    description = "Hop Char1",
    cmd = "<cmd>HopChar1<CR>",
    keybindings = { "n", "fc" }
  },
  {
    description = "Hop Pattern",
    cmd = "<CMD>HopPattern<CR>",
    keybindings = { "n", "fp" }
  },
})