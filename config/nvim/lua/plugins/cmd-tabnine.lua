local M = {
  enabled = false,
  "tzachar/cmp-tabnine",
  opts = {
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
    ignored_file_types = {
      html = true,
    },
    show_prediction_strength = false,
  },
}
return M
