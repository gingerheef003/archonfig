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

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	{
		'akinsho/bufferline.nvim',
		version = 'v3.*',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
	  "utilyre/barbecue.nvim",
	  name = "barbecue",
	  version = "*",
	  dependencies = {
	    "SmiteshP/nvim-navic",
	    "nvim-tree/nvim-web-devicons",
	  },
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = true,
	},

	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },

	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },

	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'L3MON4D3/LuaSnip' },

})
