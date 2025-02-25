- return
-- {
--     {
--         "neanias/everforest-nvim",
--         lazy = false,
--         priority = 1000, -- Load before all other plugins
--         config = function()
--             local everforest = require("everforest")
--
--             everforest.setup({
--                 background = "medium",            -- Options: 'hard', 'medium', 'soft'
--                 transparent_background_level = 2, -- 0 = disabled, 1 = semi-transparent, 2 = fully transparent
--                 italics = true,
--                 disable_italic_comments = false,
--
--                 -- Corrected colours_override usage
--                 colours_override = function(palette)
--                     palette.red    = "#FF7575"
--                     palette.green  = "#C8F902"
--                     palette.blue   = "#75A1FF"
--                     palette.yellow = "#FFD700"
--                     palette.orange = "#FF9B5E"
--                     palette.purple = "#0EE3B1"
--                     palette.cyan   = "#1FAFFF"
--                     palette.fg     = "#ffffff"
--                 end,
--             })
--
--             -- Load Everforest colorscheme
--             vim.cmd("colorscheme everforest")
--
--             -- Ensure transparency is applied properly
--             vim.cmd [[
--                 hi Normal guibg=NONE ctermbg=NONE
--                 hi StatusLine guibg=NONE ctermbg=NONE
--                 hi TabLine guibg=NONE ctermbg=NONE
--                 hi Pmenu guibg=NONE ctermbg=NONE
--                 hi VertSplit guibg=NONE ctermbg=NONE
--                 hi LineNr guibg=NONE ctermbg=NONE
--                 hi CursorLineNR guibg=NONE guifg=NONE ctermbg=NONE ctermfg=220
--                 hi SignColumn guibg=NONE
--                 hi Number guibg=NONE ctermbg=NONE
--                 hi EndOfBuffer guibg=NONE ctermbg=NONE
--                 ]]
--         end,
--     },
--
--     {
--         'shaunsingh/nord.nvim',
--         lazy = false,
--         priority = 1000,
--         config = function()
--             vim.g.nord_contrast = true
--             vim.g.nord_borders = false
--             vim.g.nord_disable_background = true
--             vim.g.nord_italic = false
--             vim.g.nord_uniform_diff_background = true
--             vim.g.nord_bold = false
--
--             -- Load the colorscheme
--             require('nord').set()
--         end
--     },
--
--     {
--         "Mofiqul/vscode.nvim",
--         lazy = false, -- Load the colorscheme immediately
--         priority = 1000, -- Ensure it loads before other plugins
--         config = function()
--             -- Set the VSCode colorscheme
--             vim.g.vscode_style = "dark" -- You can set this to 'light' or 'dark' based on preference
--
--             -- Apply the colorscheme
--             vim.cmd("colorscheme vscode")
--
--             -- Customize Mason UI elements
--             vim.cmd("highlight MasonNormal guibg=#1E2326") -- Set the Mason window background color
--             vim.cmd("highlight MasonBorder guibg=#1E2326") -- Set the border background color
--             vim.cmd("highlight MasonStatusLine guibg=#1E2326") -- Set status line background in Mason
--             vim.cmd("highlight MasonSelected guibg=#2E3539") -- Set the background for selected items
--             vim.cmd("highlight MasonItem guifg=#D0D0D0") -- Set the text color for items in Mason
--             vim.cmd("highlight MasonItemSelected guifg=#F0F0F0") -- Set the text color for selected items
--             vim.cmd("highlight MasonPrompt guifg=#D0D0D0") -- Set the prompt text color in Mason
--
--             -- Customize Lazy UI elements
--             vim.cmd("highlight LazyNormal guibg=#1E2326") -- Set the Lazy window background color
--             vim.cmd("highlight LazyBorder guibg=#1E2326") -- Set the border background color
--             vim.cmd("highlight LazyStatusLine guibg=#1E2326") -- Set status line background in Lazy
--             vim.cmd("highlight LazySelected guibg=#2E3539") -- Set the background for selected items in Lazy
--             vim.cmd("highlight LazyItem guifg=#D0D0D0") -- Set the text color for items in Lazy
--             vim.cmd("highlight LazyItemSelected guifg=#F0F0F0") -- Set the text color for selected items
--             vim.cmd("highlight LazyPrompt guifg=#D0D0D0") -- Set the prompt text color in Lazy
--
--             -- Override background to make it transparent
--             vim.cmd([[
--                 hi Normal guibg=NONE ctermbg=NONE
--                 hi StatusLine guibg=NONE ctermbg=NONE
--                 hi TabLine guibg=NONE ctermbg=NONE
--                 hi Pmenu guibg=NONE ctermbg=NONE
--                 hi VertSplit guibg=NONE ctermbg=NONE
--                 hi LineNr guibg=NONE ctermbg=NONE
--                 hi CursorLineNR guibg=NONE guifg=NONE ctermbg=NONE ctermfg=220
--                 hi SignColumn guibg=NONE
--                 hi Number guibg=NONE ctermbg=NONE
--             ]])
--         end,
--     }
{
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Make sure to load this before all the other start plugins.

	dependencies = {
		{
			"cormacrelf/dark-notify",
			init = function()
				require("dark_notify").run()
				vim.api.nvim_create_autocmd("OptionSet", {
					pattern = "background",
					callback = function()
						vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
					end,
				})
			end,
		},
	},

	init = function()
		vim.cmd.colorscheme("catppuccin")
		-- Override transparency for Lazy and Mason (adjust if necessary)
		vim.api.nvim_set_hl(0, "LazyNormal", { bg = "#1F1F1F" }) -- Customize Lazy background color
		vim.api.nvim_set_hl(0, "LazyButton", { bg = "#2A2A2A" }) -- Customize Lazy button color
		vim.api.nvim_set_hl(0, "MasonNormal", { bg = "#2A2A2A" }) -- Customize Mason background color
		vim.api.nvim_set_hl(0, "MasonHeader", { bg = "#1F1F1F" }) -- Customize Mason header color
	end,

	---@class CatppuccinOptions
	opts = function()
		vim.g.catppuccin_debug = true
		-- TODO: generate dynamics colors
		return {
			flavour = "mocha",
			transparent_background = true,
			-- TODO: add sesh custom color scheme overrides 👀
			-- color_overrides = { all = theme_colors },
			custom_highlights = function(colors)
				return {
					CurSearch = { bg = colors.yellow },
					GitSignsChange = { fg = colors.blue },
					CoverageCovered = { fg = colors.green },
					CoverageUncovered = { fg = colors.red },
					NormalFloat = { bg = "NONE" },
					LspHoverNormal = { bg = "NONE" },
					LspHoverBorder = { bg = "NONE" },
					RenderMarkdownCode = { bg = "NONE" },
				}
			end,
			integrations = {
				avante = {
					enabled = true,
					windows_sidebar_header_rounded = true,
				},
				cmp = true,
				copilot_vim = true,
				fidget = true,
				gitsigns = true,
				lsp_trouble = true,
				mason = true,
				neotest = true,
				noice = true,
				notify = true,
				octo = true,
				telescope = true,
				treesitter = true,
				treesitter_context = false,
				snacks = true,
				illuminate = true,
				which_key = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
			},
		}
	end,
}

return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Ensure it loads before other startup plugins.
	opts = {
		style = "night", -- Options: "night", "storm", or "moon"
		transparent = true, -- Enable transparent background
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "transparent",
			floats = "transparent",
		},
		sidebars = { "qf", "help" },
		day_brightness = 0.3,
		-- Customize highlights similar to your Catppuccin config.
		on_highlights = function(hl, c)
			hl.CurSearch = { bg = c.yellow }
			hl.GitSignsChange = { fg = c.blue }
			hl.CoverageCovered = { fg = c.green }
			hl.CoverageUncovered = { fg = c.red }
			hl.NormalFloat = { bg = "NONE" }
			hl.LspHoverNormal = { bg = "NONE" }
			hl.LspHoverBorder = { bg = "NONE" }
			hl.RenderMarkdownCode = { bg = "NONE" }
			-- Custom overrides for Lazy and Mason backgrounds:
			hl.LazyNormal = { bg = "#1F1F1F" }
			hl.LazyButton = { bg = "#2A2A2A" }
			hl.MasonNormal = { bg = "#2A2A2A" }
			hl.MasonHeader = { bg = "#1F1F1F" }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}

return {
	"loctvl842/monokai-pro.nvim",
	priority = 1000, -- Ensure it loads before other startup plugins.
	config = function()
		require("monokai-pro").setup({
			transparent_background = true, -- Enables full transparency
			terminal_colors = true, -- Applies transparency to terminal colors
			filter = "classic", -- Change this filter to your preferred style
		})
		vim.cmd("colorscheme monokai-pro")

		-- Apply full transparency to Neo-tree, Bufferline, and other UI components
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "LazyNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "MasonNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "MasonHeader", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", fg = "NONE" })

		-- Neo-tree transparency
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "NONE" })

		-- Bufferline transparency
		vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "BufferLineTabClose", { bg = "NONE" })

		-- StatusLine and TabLine transparency
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })

		-- Popup menus (Pmenu) and split borders
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })

		-- Line numbers and sign column
		vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "Number", { bg = "NONE" })
	end,
}

-- Setup Nord colorscheme with transparency and bufferline integration
return {
	"shaunsingh/nord.nvim",
	priority = 1000, -- Ensure it loads before other startup plugins
	config = function()
		-- Enable Nord theme and set transparency options
		vim.g.nord_contrast = true -- Enable contrast for sidebars and popups
		vim.g.nord_borders = false -- Disable borders between split windows
		vim.g.nord_disable_background = true -- Disable the background setting to use terminal background
		vim.g.nord_cursorline_transparent = true -- Make the cursorline transparent
		vim.g.nord_enable_sidebar_background = false -- Disable sidebar background to match transparency
		vim.g.nord_italic = true -- Enable italics
		vim.g.nord_uniform_diff_background = true -- Use colorful backgrounds in diff mode
		vim.g.nord_bold = false -- Disable bold text

		-- Load the Nord theme
		require("nord").set()

		-- Bufferline Setup with transparency
		local highlights = require("nord").bufferline.highlights({
			italic = true,
			bold = true,
			fill = "#181c24", -- Set a transparent background color for the bufferline
		})

		require("bufferline").setup({
			options = {
				separator_style = "thin", -- Choose separator style
			},
			highlights = highlights, -- Apply the Nord highlights for bufferline
		})

		-- Markdown File Highlight Configuration
		require("headlines").setup({
			markdown = {
				headline_highlights = {
					"Headline1",
					"Headline2",
					"Headline3",
					"Headline4",
					"Headline5",
					"Headline6",
				},
				codeblock_highlight = "CodeBlock",
				dash_highlight = "Dash",
				quote_highlight = "Quote",
			},
		})

		-- Set transparent background for floating windows (e.g., Telescope, NvimTree)
		vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi FloatBorder guibg=NONE ctermbg=NONE
      hi Pmenu guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi StatusLine guibg=NONE ctermbg=NONE
      hi TabLine guibg=NONE ctermbg=NONE
      hi StatusLineNC guibg=NONE ctermbg=NONE
      hi TabLineFill guibg=NONE ctermbg=NONE
    ]])
	end,
}
