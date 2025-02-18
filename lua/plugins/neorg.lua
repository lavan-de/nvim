return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function ()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.concealer"] = {}, -- Allows for use of icons
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            notes = "~/neorg/workspaces/notes",
                        }
                    }
                }
            }
        }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
}
