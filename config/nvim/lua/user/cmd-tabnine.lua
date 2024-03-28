local M = {
  enabled = true,
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",
  config = function()
    local tabnine = require "cmp_tabnine.config"
    tabnine:setup {
      max_lines = 1000,
      max_num_results = 20,
      sort = true,
      run_on_every_keystroke = true,
      snippet_placeholder = "..",
      ignored_file_types = {
        html = true,
      },
      show_prediction_strength = false,
    }
  end,
}
return M
