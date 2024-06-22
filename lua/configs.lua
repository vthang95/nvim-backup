-- vim.g.colors_name = 'tender'
-- vim.g.ayucolor = 'dark'
-- vim.cmd.colorscheme 'melange'

require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = false,
        italic = false,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})

vim.cmd("colorscheme rose-pine-dawn")

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
          Conditional = { fg = colors.palette.white, bold = false },
          Identifier = { fg = colors.palette.white },
          Function = { fg = colors.palette.white, bold = false },
          Type = { fg = colors.palette.white, bold = false },
          Keyword = { fg = colors.palette.white, bold = false },
          Repeat = { fg = colors.palette.white, bold = false },
          Label = { fg = colors.palette.white, bold = false },
          HlIgnore = { fg = colors.palette.white },
          Comment = { fg = colors.palette.roninYellow, bold = true },
          Variable = { fg = colors.palette.white },
          Constant = { fg = colors.palette.white },
          Number = { fg = colors.palette.white }
        }
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "lotus",           -- try "dragon" !
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
  listchars = { tab = '▹ ',trail = '·' },
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  colorcolumn = '120',
  --[[ viewoptions = 'folds,cursor',
  sessionoptions = 'folds', ]]
}

for i, v in pairs(config) do
  vim.opt[i] = v
end

vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'red', bg = 'red', fg = 'white' })
vim.api.nvim_set_hl(0, 'SpecialKey', { ctermbg = 'red', bg = '#ff0000' })
vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { fg = 'Orange' })
vim.api.nvim_set_hl(0, 'AerialGuide2', { fg = 'Red' })

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
vim.api.nvim_set_option("clipboard","unnamedplus")
vim.opt.clipboard:append('unnamedplus')

vim.o.updatetime = 50

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = "✗ ", Warn = " ", Hint = "➜ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal shiftwidth=4 tabstop=4"
})
