require("nvim-autopairs").setup();
require("nvim-ts-autotag").setup();

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "heex", "eex", "typescript", "tsx", "go", "gomod", "lua", "vim"},
  highlight = {
    enable = true
  },
  autopairs = {
    enable = true
  },
  -- Need to run: TSInstall tsx, html
  autotag = {
    enable = true,
    filetypes = { 'html', 'xml', 'tsx', 'jsx', 'typescriptreact', 'ex', 'exs' }
  },
  indent = {
    enable = true,
  },
}
