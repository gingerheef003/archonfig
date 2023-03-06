require('mason').setup({
	ui = {
		border = "double",
		icons = {
			package_installed = '✓',
			package_pending = '➜',
			package_uninstalled = '✗',
		}
	}
})

require('mason-lspconfig').setup({
	ensure_installed = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' },
})
