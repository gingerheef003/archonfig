local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'Shatur/neovim-ayu',

	{ 'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},

	{ "windwp/nvim-ts-autotag" },

	{ "RRethy/nvim-treesitter-endwise" },
	
	{ "mrjones2014/nvim-ts-rainbow" },

	{ "lukas-reineke/indent-blankline.nvim" },

})
