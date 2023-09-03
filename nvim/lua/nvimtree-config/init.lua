vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup()

require('nvim-tree').setup({
	renderer = {
		group_empty = true,
		highlight_git = true,
	},
	filters = {
		dotfiles = true,
	},
})
