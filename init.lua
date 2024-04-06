vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.bufhidden = 'hide'
vim.opt.autoindent = true
vim.opt.scrolloff = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors= true
vim.opt.hlsearch = false
vim.opt.mouse = ''

vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = true
vim.g.loaded_python3_provider = true

vim.cmd("colorscheme louis01010100")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')
vim.keymap.set('', '<Up>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('', '<Down>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('', '<Left>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('', '<Right>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('', '<C-a>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('', '<C-x>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('n', '*', ':set hlsearch!<CR>*N', {noremap = true, silent = true})
