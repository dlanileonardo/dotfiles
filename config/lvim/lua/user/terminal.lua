local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  env = { DISABLE_GREETING = true, }
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new({
  cmd = "node",
  hidden = true,
  env = { DISABLE_GREETING = true, }
})

function _NODE_TOGGLE()
  node:toggle()
end

local ctop = Terminal:new({
  cmd = "ctop",
  hidden = true,
  env = { DISABLE_GREETING = true, }
})

function _CTOP_TOGGLE()
  ctop:toggle()
end

local htop = Terminal:new({
  cmd = "htop",
  hidden = true,
  env = { DISABLE_GREETING = true, }
})

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({
  cmd = "python",
  hidden = true,
  env = { DISABLE_GREETING = true, }
})

function _PYTHON_TOGGLE()
  python:toggle()
end

-- local term = Terminal:new({
--   env = { DISABLE_GREETING = true, }
-- })

-- function _TERM_TOGGLE()
--   term:toggle()
-- end

lvim.builtin.which_key.mappings["a"] = {
  name = "Terminal",
  n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
  u = { "<cmd>lua _CTOP_TOGGLE()<cr>", "CTOP" },
  t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
  p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
  f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
  v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  -- z = { "<cmd>lua _TERM_TOGGLE() size=80 direction=vertical<cr>", "Terminal" }
}
