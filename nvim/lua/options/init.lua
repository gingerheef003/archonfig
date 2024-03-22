-- local variables
local opt = vim.opt


-- basic options
opt.number = true
opt.relativenumber = true
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
vim.keymap.set({'', 'i'}, '<F3>', '<cmd>NvimTreeFocus<cr>', {desc = 'Explorer'})
vim.keymap.set({'', 'i'}, '<F4>', '<cmd>q<cr>', {desc = 'Quit'})


-- travel through buffer
vim.keymap.set({''}, '<leader>b', '<cmd>ls<cr>', {desc = 'Next Buffer'})
vim.keymap.set({''}, '<leader>n', '<cmd>bn<cr>', {desc = 'Next Buffer'})
vim.keymap.set({''}, '<leader>N', '<cmd>bp<cr>', {desc = 'Previous Buffer'})
vim.keymap.set({''}, '<leader>d', '<cmd>bd<cr>', {desc = 'Delete Buffer'})

-- sudo edit enable
vim.keymap.set('c','W',"<esc>:lua require'utils'.sudo_write()<CR>", { silent = true })
