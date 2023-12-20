return {
	{
		"williamboman/mason.nvim",

		config = function()
			require('mason').setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",

		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'html', 'cssls', 'cssmodules_ls', 'tsserver' }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { 'vim', 'require' },
						}
					}
				}
			}) -- END lua_ls

			lspconfig.tsserver.setup({})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
		end -- END CONFIG
	}
}
