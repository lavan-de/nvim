return {
    {
        "neanias/everforest-nvim",
        lazy = false,
        priority = 1000, -- Load before all other plugins
        config = function()
            local everforest = require("everforest")

            everforest.setup({
                background = "medium",            -- Options: 'hard', 'medium', 'soft'
                transparent_background_level = 2, -- 0 = disabled, 1 = semi-transparent, 2 = fully transparent
                italics = true,
                disable_italic_comments = false,

                -- Corrected colours_override usage
                colours_override = function(palette)
                    palette.red    = "#FF7575"
                    palette.green  = "#C8F902"
                    palette.blue   = "#5DB8FC"
                    palette.yellow = "#F2BA02"
                    palette.orange = "#FFD700"
                    palette.purple = "#0EE3B1"
                    palette.cyan   = "#68F3EC"
                    palette.fg     = "#E6E2DC"
                end,
            })

            -- Load Everforest colorscheme
            vim.cmd("colorscheme everforest")

            -- Ensure transparency is applied properly
            vim.cmd [[
                hi Normal guibg=NONE ctermbg=NONE
                hi StatusLine guibg=NONE ctermbg=NONE
                hi TabLine guibg=NONE ctermbg=NONE
                hi Pmenu guibg=NONE ctermbg=NONE
                hi VertSplit guibg=NONE ctermbg=NONE
                hi LineNr guibg=NONE ctermbg=NONE
                hi CursorLineNR guibg=NONE guifg=NONE ctermbg=NONE ctermfg=220
                hi SignColumn guibg=NONE
                hi Number guibg=NONE ctermbg=NONE
                hi EndOfBuffer guibg=NONE ctermbg=NONE
            ]]
        end,
    }
}
