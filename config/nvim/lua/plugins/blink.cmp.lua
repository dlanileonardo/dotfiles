return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.appearance = opts.appearance or {}
    opts.appearance.kind_icons = vim.tbl_extend("keep", {
      Color = "██", -- Use block instead of icon for color items to make swatches more usable
    }, LazyVim.config.icons.kinds)
    opts.keymap = opts.keymap or {}
    opts.keymap = {
      preset = 'super-tab',
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<Enter>'] = { 'select_and_accept', 'fallback' },
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    }
    opts.completion = opts.completion or {}
    opts.completion.trigger = opts.completion.trigger or {}

    opts.completion.trigger.show_in_snippet = true
    opts.completion.ghost_text = {
      enabled = true,
    }
  end,
}