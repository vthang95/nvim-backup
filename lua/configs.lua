-- vim.g.colors_name = 'tender'
-- vim.g.ayucolor = 'dark'
vim.cmd.colorscheme 'melange'
--[[ require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = {},
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {
          white = '#ffffff'
        },
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {
          -- h group-name for keywords
          Conditional = { fg = colors.palette.waveRed, bold = false },
          Function = { fg = colors.palette.roninYellow, bold = false },
          Type = { fg = colors.palette.lightBlue, bold = false },
          Keyword = { fg = colors.palette.waveRed, bold = false },
          Repeat = { fg = colors.palette.waveRed, bold = false },
          Label = { fg = colors.palette.waveRed, bold = false },
          HlIgnore = { fg = colors.palette.white },
        }
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
vim.cmd.colorscheme 'kanagawa' ]]

local config = {
  encoding = 'utf-8',
  autoread = true,
  autoindent = true,
  foldmethod = 'indent',
  updatetime = 100,
  foldlevelstart = 99,
  hlsearch = true,
  background = 'dark',
  colorcolumn = '100',
  termguicolors = true,
  list = true,
  number = true,
  listchars = { tab = '▸ ',trail = '·' },
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  colorcolumn = '90'
}

for i, v in pairs(config) do
  vim.opt[i] = v
end

vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'red', bg = 'red', fg = 'white' })
vim.api.nvim_set_hl(0, 'SpecialKey', { ctermbg = 'red', bg = '#ff0000' })

-- Highlight trailing whitespace
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*' },
  command = [[match ExtraWhitespace /\s\+$/]]
})

vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.format()]])
--[[
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.ts*' },
  command = vim.cmd.colorscheme('gruvbox')
}) ]]

-- Global clipboard
vim.opt.clipboard = 'unnamedplus'

vim.o.updatetime = 50

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal shiftwidth=4 tabstop=4"
})
