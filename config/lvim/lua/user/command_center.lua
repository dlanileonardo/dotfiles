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
    category = "File",
  },
  {
    description = "Buffer Next",
    cmd = "<CMD>CybuNext<CR>",
    keybindings = { "n", "<C-l>" },
    category = "File",
  },
  {
    description = "Buffer Previous",
    cmd = "<CMD>CybuPrev<CR>",
    keybindings = { "n", "<C-h>" },
    category = "Buffer",
  },
  {
    description = "Buffer Delete",
    cmd = "<CMD>bdelete<CR>",
    keybindings = { "n", "<C-M-w>" },
    category = "Buffer",
  },
  {
    description = "Tab Close",
    cmd = "<CMD>tabclose<CR>",
    keybindings = { "n", "<M-q>" },
    category = "Window",
  },
  {
    description = "Window Close",
    cmd = "<CMD>close<CR>",
    keybindings = { "n", "<C-q>" },
    category = "Window",
  },
  {
    description = "Exit Vim",
    cmd = "<CMD>qa<CR>",
    keybindings = { "n", "<C-M-q>" },
    category = "NeoVim",
  },
  {
    description = "Find files",
    cmd = "<CMD>Telescope find_files<CR>",
    category = "Telescope",
  },
  {
    description = "Search inside current buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
    category = "Telescope",
  },
  {
    description = "Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
    category = "Telescope",
  },
  {
    description = "LSP - Show document symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
    category = "Telescope",
  },
  {
    description = "LSP - Code Actions",
    cmd = "<CMD>lua vim.lsp.buf.code_action()<CR>",
    -- keybindings = { "n", "ca" }
    category = "LSP",
  },
  {
    description = "LSP - Range Code Action",
    cmd = "<CMD>lua vim.lsp.buf.range_code_action()<CR>",
    -- keybindings = { "x", "ca" }
    category = "LSP",
  },
  {
    description = "LSP - Go to Definition",
    cmd = "<CMD>lua vim.lsp.buf.definition()<CR>",
    keybindings = { "n", "gd" },
    category = "LSP",
  },
  {
    description = "LSP - Hover",
    cmd = "<CMD>lua vim.lsp.buf.hover()<cr>",
    keybindings = { "n", "K" },
    category = "LSP",
  },
  {
    description = "LSP - Show Diagnostic",
    cmd = "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
    keybindings = { "n", "K" },
    category = "LSP",
  },
  {
    description = "LSP - References",
    cmd = "<cmd>Trouble lsp_references<cr>",
    keybindings = { "n", "<leader>tr" },
    category = "LSP",
  },
  {
    description = "LSP - Definitions",
    cmd = "<cmd>Trouble lsp_definitions<cr>",
    keybindings = { "n", "<leader>tf" },
    category = "LSP",
  },
  {
    description = "Telescope File Explorer",
    cmd = "<CMD>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope File Browser",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Search Word",
    cmd = "<CMD>lua require('telescope.builtin').live_grep()<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Search Word Args",
    cmd = "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    keybindings = { "n", "<M-o>" },
    category = "Telescope",
  },
  {
    description = "Telescope git Files",
    cmd = "<CMD>lua require('telescope.builtin').git_files()<CR>",
    keybindings = { "n", "<C-S-p>" },
    category = "Telescope",
  },
  {
    description = "Telescope Files",
    cmd = "<CMD>lua require('telescope.builtin').find_files()<CR>",
    keybindings = { "n", "<C-p>" },
    category = "Telescope",
  },
  {
    description = "Telescope Buffers",
    cmd = "<CMD>lua require('telescope.builtin').buffers()<CR>",
    keybindings = { "n", "<M-i>" },
    category = "Telescope",
  },
  {
    description = "Telescope Keymaps",
    cmd = "<CMD>lua require('telescope.builtin').keymaps()<CR>",
    category = "Telescope",
  },
  {
    description = "Telescope Current Buffer",
    cmd = "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    keybindings = { "n", "<M-p>" },
    category = "Telescope",
  },
  {
    description = "Telescope Modified Files",
    cmd = "<CMD>lua require('telescope.builtin').git_status()<CR>",
    category = "Telescope",
  },
  {
    description = "Teleescope Projects",
    cmd = "<cmd>Telescope projects<CR>",
    keybindings = { "n", "<Leader>sP" },
    category = "Telescope",
  },
  {
    description = "Teleescope Explorer",
    cmd = "<cmd>Telescope file_browser<CR>",
    keybindings = { "n", "<M-e>" },
    category = "Telescope",
  },
  {
    description = "Update LunarVim",
    cmd = "<CMD>LvimUpdate<CR>",
    category = "LunarVim",
  },
  {
    description = "Toggle Auto Format",
    cmd = "<CMD>LvimToggleFormatOnSave<CR>",
    category = "LunarVim",
  },
  {
    description = "View Notification",
    cmd = "<CMD>Telescope notify<cr>",
    category = "Telescope",
  },
  {
    description = "Reload LunarVim's configuration",
    cmd = "<cmd>LvimReload<cr>",
    category = "LunarVim",
  },
  {
    description = "Open Config File",
    cmd = "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
    category = "LunarVim",
  },
  {
    description = "Git - History",
    cmd = "<CMD>DiffviewFileHistory<CR>",
    category = "git",
  },
  {
    description = "Git - Diff",
    cmd = "<CMD>DiffviewOpen<CR>",
    category = "git",
  },
  -- {
  --   description = "Git - Blame Toggle",
  --   cmd = "<CMD>GitBlameToggle<CR>",
  --   category = "git",
  -- },
  {
    description = "Outline Toggle",
    cmd = "<CMD>SymbolsOutline<CR>",
    category = "LSP",
  },
  {
    description = "NvimTree - Toggle",
    cmd = "<CMD>NvimTreeToggle<CR>",
    keybindings = { "n", "<M-b>" },
    category = "LunarVim",
  },
  {
    description = "NvimTree - Find File",
    cmd = "<CMD>NvimTreeFindFile<CR>",
    category = "LunarVim",
  },
  {
    description = "Split in Horizontal",
    cmd = "<CMD>sp<CR>",
    category = "Window",
  },
  {
    description = "Split in Vertical",
    cmd = "<CMD>vsp<CR>",
    category = "Window",
  },
  {
    description = "Cheat Sheet",
    cmd = "<CMD>CheatSH<CR>",
    keybindings = { "n", "<M-c>" },
    category = "LunarVim",
  },
  {
    description = "Next",
    cmd = "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "n" },
    category = "hlslens",
  },
  {
    description = "Previous",
    cmd = "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "N" },
    category = "hlslens",
  },
  {
    description = "*",
    cmd = "*<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "*" },
    category = "hlslens",
  },
  {
    description = "#",
    cmd = "#<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "#" },
    category = "hlslens",
  },
  {
    description = "g*",
    cmd = "g*<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "g*" },
    category = "hlslens",
  },
  {
    description = "g#",
    cmd = "g#<Cmd>lua require('hlslens').start()<CR>",
    keybindings = { "n", "g#" },
    category = "hlslens",
  },
  {
    description = "Update Core Packages",
    cmd = "<CMD>LvimSyncCorePlugins<CR>",
    category = "LunarVim",
  },
  {
    description = "Update Plugins",
    cmd = "<cmd>lua require(\"lazy\").update()<cr>",
    category = "LunarVim",
  },
  {
    description = "Sync Plugins",
    cmd = "<cmd>lua require(\"lazy\").sync()<cr>",
    category = "LunarVim",
  },
  {
    description = "Next Buffer",
    cmd = "<cmd>:bnext<cr>",
    keybindings = { "n", "<leader>bn" },
    category = "Buffer",
  },
  {
    description = "First Buffer",
    cmd = "<cmd>:bfirst<cr>",
    keybindings = { "n", "<leader>b1" },
    category = "Buffer",
  },
  {
    description = "Last Buffer",
    cmd = "<cmd>:blast<cr>",
    keybindings = { "n", "<leader>b0" },
    category = "Buffer",
  },
  {
    description = "Check Health",
    cmd = "<cmd>:CheckHealth<cr>",
    keybindings = { "n", "<leader>Lh" },
    category = "LunarVim",
  },
  {
    description = "Toggle",
    cmd = "<cmd>TroubleToggle<cr>",
    keybindings = { "n", "<leader>tt" },
    category = "Trouble",
  },
  {
    description = "Diagnostics",
    cmd = "<cmd>Trouble document_diagnostics<cr>",
    keybindings = { "n", "<leader>td" },
    category = "Trouble",
  },
  {
    description = "QuickFix",
    cmd = "<cmd>Trouble quickfix<cr>",
    keybindings = { "n", "<leader>tq" },
    category = "Trouble",
  },
  {
    description = "LocationList",
    cmd = "<cmd>Trouble loclist<cr>",
    keybindings = { "n", "<leader>tl" },
    category = "Trouble",
  },
  {
    description = "Wordspace Diagnostics",
    cmd = "<cmd>Trouble workspace_diagnostics<cr>",
    keybindings = { "n", "<leader>tw" },
    category = "Trouble",
  },
  {
    description = "Retab to Space",
    cmd = "<CMD>set expandtab<CR><CMD>retab<CR>",
    category = "LunarVim",
  },
  {
    description = "TestFile",
    cmd = "<CMD>TestFile<CR>",
    keybindings = { "n", "<leader>yf" },
    category = "Tests",
  },
  {
    description = "TestSuite",
    cmd = "<CMD>TestSuite<CR>",
    keybindings = { "n", "<leader>ys" },
    category = "Tests",
  },
  {
    description = "TestNearest",
    cmd = "<CMD>TestNearest<CR>",
    keybindings = { "n", "<leader>yn" },
    category = "Tests",
  },
  {
    description = "Hop Word",
    cmd = "<CMD>HopWord<CR>",
    keybindings = { "n", "ff" },
    category = "Hop",
  },
  {
    description = "Hop Line",
    cmd = "<CMD>HopLine<CR>",
    keybindings = { "n", "fl" },
    category = "Hop",
  },
  {
    description = "Hop Line Start",
    cmd = "<CMD>HopLineStart<CR>",
    keybindings = { "n", "fs" },
    category = "Hop",
  },
  {
    description = "Hop in Current Line",
    cmd = "<CMD>lua require'hop'.hint_words({ current_line_only = true })<CR>",
    keybindings = { "n", "fd" },
    category = "Hop",
  },
  {
    description = "Hop Char1",
    cmd = "<cmd>HopChar1<CR>",
    keybindings = { "n", "fc" },
    category = "Hop",
  },
  {
    description = "Hop Pattern",
    cmd = "<CMD>HopPattern<CR>",
    keybindings = { "n", "fp" },
    category = "Hop",
  },
  {
    description = "Trouble TODO",
    cmd = "<CMD>TodoTrouble<CR>",
    keybindings = { "n", "<Leader>a" },
    category = "Trouble",
  },
  {
    description = "Buffer Toggle Pin",
    cmd = "<CMD>BufferLineTogglePin<CR>",
    keybindings = { "n", "<Leader>bt" },
    category = "Buffer",
  },
  {
    description = "Task Overseer Toggle",
    cmd = "<CMD>OverseerToggle<CR>",
    keybindings = { "n", "<Leader>ot" },
    category = "Task",
  },
  {
    description = "Task Overseer Run",
    cmd = "<CMD>OverseerRun<CR>",
    keybindings = { "n", "<Leader>or" },
    category = "Task",
  },
  {
    description = "Task Overseer Tasks Action",
    cmd = "<CMD>OverseerTaskAction<CR>",
    keybindings = { "n", "<Leader>oa" },
    category = "Task",
  },
  {
    description = "Structural Search and Replace",
    cmd = "<CMD>lua require(\"ssr\").open()<CR>",
    keybindings = {
      { "n", "<M-f>" },
      { "x", "<M-f>" },
    },
    category = "LunarVim",
  },
  {
    description = "Move to down",
    cmd = "<CMD>m .+1<CR>==",
    keybindings = { "n", "<C-j>" },
    category = "LunarVim",
  },
  {
    description = "Move to down",
    cmd = "<CMD>m .-2<CR>==",
    keybindings = { "n", "<C-k>" },
    category = "LunarVim",
  },
  -- {
  --   description = "Pomodoro Start",
  --   cmd = "<CMD>PomodoroStart<CR>"
  -- },
  -- {
  --   description = "Pomodor Status",
  --   cmd = "<CMD>PomodoroStatus<CR>"
  -- }
})


lvim.builtin.telescope.extensions.command_center = {
  components = {
    command_center.component.CATEGORY,
    command_center.component.DESCRIPTION,
    command_center.component.COMMAND,
    command_center.component.KEYBINDINGS,
  },
  sort_by = {
    command_center.component.CATEGORY,
    command_center.component.DESCRIPTION,
    command_center.component.COMMAND,
    command_center.component.KEYBINDINGS,
  },
  separator = " ",
  auto_replace_desc_with_cmd = true,
  prompt_title = "Command Center",
}
