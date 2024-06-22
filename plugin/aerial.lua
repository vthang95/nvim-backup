require('aerial').setup {
  open_automatic = true,
  layout = {
    resize_to_content = true
  },
  lsp = {
    diagnostics_trigger_update = true,
    update_when_errors = true
  },
  highlight_mode = "last",
  attach_mode = "global"
}


vim.api.nvim_set_hl(0, 'AerialGuide1', { ctermbg = 'red', bg = 'white', fg = 'pink' })
vim.api.nvim_set_hl(0, 'AerialLineNC', { ctermbg = 'red', bg = 'white', fg = 'pink' })
