-- :help option-list
-- :help option_name where,
-- vim.opt.option_name = value


local opt = vim.opt

opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = true
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false


vim.g.mapleader = ' '

vim.keymap.set({'', 'i'}, '<F12>', '<cmd>write<cr>', {desc = 'Save'})


require('plugins')
