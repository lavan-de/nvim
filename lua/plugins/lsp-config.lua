return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        -- bridges the gap between mason and lspconfig
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lsp_config = require("lspconfig")
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd", -- C/C++ LSP
                    "lua_ls", -- Lua LSP
                },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.diagnostic.config({
                virtual_text = true,
                signs = false,
            })

            -- C/C++ LSP
            lsp_config.clangd.setup({
                capabilities = capabilities,
            })

            -- Lua LSP
            lsp_config.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Tooltip for the LSP in bottom right
            require("fidget").setup({})

        end,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "j-hui/fidget.nvim", tag = "legacy" },
        },
    },
}
