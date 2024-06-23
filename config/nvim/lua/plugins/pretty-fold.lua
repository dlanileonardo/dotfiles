local M =  {
  enabled = false,
  'anuvyklack/pretty-fold.nvim',
  opts = {
    -- keep_indentation = true,
    fill_char = '-',
    sections = {
      left = {
        'content', ' |-'
      },
      right = {
        '-| ', 'number_of_folded_lines', ': ', 'percentage', ' |-',
      },
    },
  },
}
return M
