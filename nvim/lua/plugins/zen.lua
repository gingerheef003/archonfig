return 	{
	'folke/zen-mode.nvim',
	init = function ()
		vim.keymap.set('n', '<leader>zz', '<cmd>ZenMode<cr>', {desc = 'Zen Mode'})
	end,
	config = true,
}
