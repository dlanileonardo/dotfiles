local M = {
  'cameron-wags/rainbow_csv.nvim',
  config = true,
  ft = {
    'csv',
    'tsv',
    'csv_semicolon',
    'csv_whitespace',
    'csv_pipe',
    'rfc_csv',
    'rfc_semicolon'
  },
  cmd = {
    'RainbowDelim',
    'RainbowDelimSimple',
    'RainbowDelimQuoted',
    'RainbowMultiDelim'
  },
}

vim.api.nvim_command("autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.dat   set filetype=csv_pipe")

return M
