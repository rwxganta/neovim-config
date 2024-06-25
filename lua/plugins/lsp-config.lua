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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim', 'require' },
                        }
                    }
                }
            }) -- END lua_ls

            lspconfig.tsserver.setup({
                capabilities = capabilities;
            })
            lspconfig.html.setup({
                capabilities = capabilities;
            })
            lspconfig.cssls.setup({
                capabilities = capabilities;
            })
        end -- END config
    }
}

