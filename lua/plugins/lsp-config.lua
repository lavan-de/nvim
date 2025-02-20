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
                    "bashls", -- Bash LSP
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
                cmd = { "clangd", "--background-index" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lsp_config.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
                settings = {
                    clangd = {
                        fallbackFlags = { "-std=c++17" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                        checkThirdParty = false,
                    },
                },
            })

            -- Bash LSP
            lsp_config.bashls.setup({
                capabilities = capabilities,
                cmd = { "bash-language-server", "start" },
                filetypes = { "sh" },
                root_dir = lsp_config.util.find_git_ancestor,
                settings = {
                    bash = {
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                            checkThirdParty = false,
                        },
                    },
                },
            })

            -- Lua LSP
            lsp_config.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
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
            "RobertBrunhage/dart-tools.nvim", -- Dart hot reload support
        },
    },
}
