return {
    "hrsh7th/nvim-cmp",
    config = function()
        -- COMPLETION
        local cmp = require("cmp")
        local cmp_mappings = cmp.mapping.preset.insert({
            ["<C-y>"] = cmp.mapping.complete(),                 -- Open completion menu
            ["<C-e>"] = cmp.mapping.abort(),                    -- Close completion menu
            ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection without auto-selecting
        })

        -- Disable completion with Tab (helps with Copilot setup)
        cmp_mappings["<Tab>"] = vim.NIL
        cmp_mappings["<S-Tab>"] = vim.NIL

        ---@diagnostic disable-next-line: missing-fields
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- Expand snippets
                end,
            },
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                    -- Filter LSP completions to only include keywords, functions, and constants
                    entry_filter = function(entry, ctx)
                        local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
                        -- Allow only these kinds
                        local allowed_kinds = {
                            Keyword = true,
                            Function = true,
                            Constant = true,
                        }
                        return allowed_kinds[kind]
                    end,
                },
                { name = "path" },    -- File path completions
                { name = "luasnip" }, -- Snippet completions
                { name = "copilot" }, -- Copilot completions
            }),
            mapping = cmp_mappings,
            formatting = {
                format = function(entry, vim_item)
                    -- Add icons or labels to completion items
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        path = "[Path]",
                        copilot = "[Copilot]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sorting = {
                comparators = {

                    -- Custom comparator to prioritize Keywords > Functions > Snippets > Constants
                    function(entry1, entry2)
                        local kind_priority = {
                            Keyword = 1,
                            Snippet = 2,
                            Function = 3,
                            Constant = 4,
                        }

                        local kind1 = require("cmp.types").lsp.CompletionItemKind[entry1:get_kind()]
                        local kind2 = require("cmp.types").lsp.CompletionItemKind[entry2:get_kind()]

                        -- Get priority for each kind (default to a high number if kind is not in the list)
                        local priority1 = kind_priority[kind1] or 99
                        local priority2 = kind_priority[kind2] or 99

                        -- Lower priority number means higher priority
                        if priority1 ~= priority2 then
                            return priority1 < priority2
                        end

                        -- If priorities are equal, fall back to default comparators
                        return nil
                    end,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                },
            },
            completion = {
                completeopt = "menu,menuone,noinsert,noselect", -- Don't auto-insert the first item
                keyword_length = 2,                             -- Start showing completions after typing 2 characters
                max_items = 10,                                 -- Show a maximum of 10 items in the completion menu
            },
        })

        -- Load snippets from plugins (e.g., friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
    dependencies = {
        -- Autocompletion sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",

        -- Snippets engine
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets", -- Snippet collection
            },
        },

        -- GitHub Copilot integration
        {
            "zbirenbaum/copilot.lua",
            event = "InsertEnter",
            config = function()
                require("copilot").setup({
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                })
            end,
        },
        {
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua" },
            config = function()
                require("copilot_cmp").setup()
            end,
        },
    },
}
