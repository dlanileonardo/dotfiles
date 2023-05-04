local commands = {
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
  {
    description = "Check Health",
    cmd = "<cmd>:CheckHealth<cr>",
    keybindings = { "n", "<leader>Lh" },
    category = "LunarVim",
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
    description = "Toggle NvimTree",
    cmd = "<CMD>NvimTreeToggle<CR>",
    -- keybindings = { "n", "<M-b>" },
    category = "LunarVim",
  },
  {
    description = "NvimTree - Find File",
    cmd = "<CMD>NvimTreeFindFile<CR>",
    category = "LunarVim",
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
};
return commands;
