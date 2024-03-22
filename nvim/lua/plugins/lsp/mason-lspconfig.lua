return {
	'williamboman/mason-lspconfig.nvim',
	opts = {
		ensure_installed = { 'lua_ls', 'clangd', 'rust_analyzer', 'pyright', 'tsserver' },
	}
}
