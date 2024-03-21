require('mason').setup({
	PATH = "prepend",
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
	ensure_installed = { 'lua_ls', 'clangd', 'rust_analyzer', 'pyright', 'tsserver' },
})
