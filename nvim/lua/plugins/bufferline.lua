return {
	'akinsho/bufferline.nvim',
	version = 'v3.*',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function ()
		vim.opt.termguicolors = true
	end,
	config = true,
}
