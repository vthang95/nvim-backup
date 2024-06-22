-- lua/mappings.lua

-- Vim can detect the type of file that is edited
-- Vim's functionality can be extended by adding plugins
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

keymap.set('', '<leader>ok', ':noh<CR>')

keymap.set('', '<leader>q', ':q<CR>')

-- Jump to the first non-black character of the line
keymap.set('', '<', '^')

-- Jump to the end of the line
keymap.set('', '>', '$')

-- Handle Tab
keymap.set('v', '<Tab>', '>gv')
keymap.set('v', '<S-Tab>', '<gv')
keymap.set('i', '<S-Tab>', '<C-d>')
keymap.set('n', '<S-Tab>', '<<')
keymap.set('n', '<Tab>', '>>')

-- Tabpane shortcuts
-- New Tab
keymap.set('', '<leader>tn', ':tabnew<CR>')

-- Quick navigate to specific tab
keymap.set('n', '<leader>1', '1gt')
keymap.set('n', '<leader>2', '2gt')
keymap.set('n', '<leader>3', '3gt')
keymap.set('n', '<leader>4', '4gt')
keymap.set('n', '<leader>5', '5gt')
keymap.set('n', '<leader>6', '6gt')
keymap.set('n', '<leader>7', '7gt')
keymap.set('n', '<leader>8', '8gt')
keymap.set('n', '<leader>9', '9gt')
keymap.set('n', '<leader>0', ':tablast<CR>')

-- Jump between panes
keymap.set('', '<leader><up>', '<C-w><up>')
keymap.set('', '<leader><down>', '<C-w><down>')
keymap.set('', '<leader><left>', '<C-w><left>')
keymap.set('', '<leader><right>', '<C-w><right>')

-- Split view
keymap.set('', '<leader>hs', ':split<CR>')
keymap.set('', '<leader>vs', ':vsplit<CR>')

-- Shrink view
keymap.set('', '+', ':vertical resize +5<CR>')
keymap.set('', '_', ':vertical resize -5<CR>')
keymap.set('', '}', ':horizontal resize +5<CR>')
keymap.set('', '{', ':horizontal resize -5<CR>')

-- Quick moves
keymap.set('', '<S-j>', '5j')
keymap.set('', '<S-k>', '5k')
keymap.set('', '<S-h>', 'b')
keymap.set('', '<S-l>', 'w')

-- Disable copy when delete
-- By default in viusual mode. 'x' and 'd' boths will remove and copy the content
-- We change a little bit: 'd' for delete only and 'x' for cut
keymap.set('v', 'd', '"_d')
keymap.set('n', 'xx', 'dd')
keymap.set('n', 'dd', '"_dd')
keymap.set('n', 'fw', 'dw')
keymap.set('n', 'dw', '"_dw')

-- Move blocks of code
keymap.set('v', '<leader>k', ":move-2<CR>gv=gv", { silent = true })
keymap.set('v', '<leader>j', ":move'>+<CR>gv=gv", { silent = true })
keymap.set('n', '<leader>k', ":<C-u>move-2<CR>==", { silent = true })
keymap.set('n', '<leader>j', ":<C-u>move+<CR>==", { silent = true })

-- File explorer shortcuts
-- Toogle with space + \
keymap.set('', '<leader>\\', ':NvimTreeToggle<CR>')

-- Telescope
local builtin = require('telescope.builtin')

keymap.set('', '<leader>lf', '<cmd>AerialToggle!<CR>', {})
keymap.set('', '<leader>ff', builtin.find_files, {})
keymap.set('', '<leader>gf', builtin.git_files, {})
keymap.set('', '<leader>rg', ':Telescope grep_string search="" only_sort_text=true<CR>', {})
keymap.set('', '<leader>hh', ':Telescope oldfiles<CR>', {})
-- Show all diagnostics on current line in floating window
keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', opts)
keymap.set('n', '<leader>r', ':lua vim.lsp.buf.code_action()<CR>', opts)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
keymap.set('n', '<leader>n', ':lua vim.diagnostic.goto_next()<CR>', opts)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
keymap.set('n', '<leader>p', ':lua vim.diagnostic.goto_prev()<CR>', opts)
-- Hover
keymap.set('', '<leader>/', vim.lsp.buf.hover, {})
keymap.set('', '<leader>.', ":lua require('goto-preview').goto_preview_definition()<CR>", {})
