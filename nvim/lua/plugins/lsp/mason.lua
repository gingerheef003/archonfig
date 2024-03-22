return {
	'williamboman/mason.nvim',
	opts = {
		PATH = "prepend",
		ui = {
			border = "double",
			icons = {
				package_installed = '✓',
				package_pending = '➜',
				package_uninstalled = '✗',
			}
		}

	}
}
