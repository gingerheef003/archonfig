return 	{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{ "RRethy/nvim-treesitter-endwise" },
		{ 'nvim-treesitter/nvim-treesitter-refactor' },
		{ "mrjones2014/nvim-ts-rainbow" },
		{ "windwp/nvim-ts-autotag" },

	},
	config = function ()
		require('nvim-treesitter.configs').setup({


			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>sa",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},

			indent = {
				enable = true,
			},

			autotag = {
				enable = true,
			},

			endwise = {
				enable = true,
			},

			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},

		})
	end
}
