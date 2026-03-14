require("config.lazy")
require("config.lsp")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.opt.expandtab = true
vim.opt.tabstop=2
vim.opt.softtabstop=2 
vim.opt.shiftwidth=2

vim.keymap.set('n', '<C-B>', ':NvimTreeToggle<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-F>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-S>', function() builtin.live_grep() end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-D>', function() vim.lsp.buf.definition() end )

vim.keymap.set('n', '<C-T>', ':ToggleTerm direction=\'float\'<CR>', { noremap = true })
vim.keymap.set('n', '<C-L>', ':Trouble diagnostics toggle <CR>', { noremap = true })
vim.keymap.set('n', '<C-P>', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true })

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')

vim.lsp.buf.hoverOpts = true

vim.lsp.inlay_hint.enable()

vim.opt.swapfile = false
