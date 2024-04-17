require('telescope').setup({
  layout_config = {
    vertical = {
      prompt_position = "top",
      mirror = true,
    },
  },
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      mirror = true,
      preview_cutoff = 1
    },
    file_ignore_patterns = {
      "yarn.lock",
      "node_modules"
    },
    live_grep_args = {
      file_ignore_patterns = { "yarn.lock", "node%_modules/.*" }
    }
  },
  extentions = {
    fzf = {
      case_mode = 'smart_case',
      fuzzy = true,
    }
  }
})

-- Support fuzzy search
-- require('telescope').load_extension('fzf')
