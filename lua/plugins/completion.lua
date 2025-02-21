return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Autocompletion sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",

        -- Snippets engine
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets", -- Snippet collection
            },
        },

        {
            "zbirenbaum/copilot-cmp",
            after = { "github/copilot.vim" },
            config = function()
                require("copilot_cmp").setup()
            end,
        },
    },

    config = function()
        -- COMPLETION
        local cmp = require("cmp")
        local cmp_mappings = cmp.mapping.preset.insert({
            ["<C-y>"] = cmp.mapping.complete(),                 -- Open completion menu
            ["<C-e>"] = cmp.mapping.abort(),                    -- Close completion menu
            ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection without auto-selecting

            -- Select the [n]ext item
            ["<C-n>"] = cmp.mapping.select_next_item(),
            -- Select the [p]revious item
            ["<C-p>"] = cmp.mapping.select_prev_item(),

            -- Scroll the documentation window [b]ack / [f]orward
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),

        })

        -- Disable completion with Tab (helps with Copilot setup)
        cmp_mappings["<Tab>"] = vim.NIL
        cmp_mappings["<S-Tab>"] = vim.NIL

        -- @diagnostic disable-next-line: missing-fields
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- Expand snippets
                end,
            },
            sources = cmp.config.sources({
                { name = "copilot" }, -- Copilot completions
                { name = "nvim_lsp"},
                { name = "buffer" },   -- Buffer completions
                { name = "nvim_lua" }, -- Neovim Lua completions
                { name = "path" },     -- File path completions
                { name = "luasnip" },  -- Snippet completions
            }),
            mapping = cmp_mappings,
            formatting = {
                format = function(entry, vim_item)
                    -- Add icons or labels to completion items
                    vim_item.menu = ({
                        buffer = "[Buffer]",
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
                            Function = 2,
                            Snippet = 3,
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
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order
                },
            },
            completion = {
                completeopt = "menu,menuone,noinsert,noselect", -- Don't auto-insert the first item
                keyword_length = 3,                             -- Start showing completions after typing 2 characters
                max_items = 15,                                 -- Show a maximum of 10 items in the completion menu
            },
        })

        -- Load snippets from plugins (e.g., friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
