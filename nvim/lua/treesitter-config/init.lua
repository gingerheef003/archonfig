require('nvim-treesitter.configs').setup({
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
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
	}
})
