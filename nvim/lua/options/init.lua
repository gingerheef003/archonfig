-- local variables
local opt = vim.opt


-- basic options
opt.number = true
opt.mouse = 'a'
opt.cursorline = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.wrap = true
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false

opt.scrolloff = 5
opt.showmode = false
opt.whichwrap = 'b,s,<,>,[,],h,l'
opt.fileencoding = 'utf-8'
opt.splitbelow = true
opt.splitright = true
opt.showtabline = 2

vim.g.mapleader = ' '


-- functions
vim.keymap.set({'', 'i'}, '<F2>', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set({'', 'i'}, '<F4>', '<cmd>q<cr>', {desc = 'Quit'})


-- travel through buffer
vim.keymap.set({''}, '<leader>b', '<cmd>ls<cr>', {desc = 'Next Buffer'})
vim.keymap.set({''}, '<leader>n', '<cmd>bn<cr>', {desc = 'Next Buffer'})
vim.keymap.set({''}, '<leader>N', '<cmd>bp<cr>', {desc = 'Previous Buffer'})
