return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Ensure it loads before other startup plugins.
	opts = {
		style = "storm", -- Options: "night", "storm", or "moon"
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
		on_highlights = function(hl)
			hl.NormalFloat = { bg = "NONE" }
			hl.LspHoverNormal = { bg = "NONE" }
			hl.LspHoverBorder = { bg = "NONE" }
			hl.RenderMarkdownCode = { bg = "NONE" }

			-- Custom overrides for Lazy and Mason backgrounds:
			hl.LazyNormal = { bg = "#1F1F1F" }
			hl.LazyButton = { bg = "#2A2A2A" }
			hl.MasonNormal = { bg = "#2A2A2A" }
			hl.MasonHeader = { bg = "#1F1F1F" }

			-- Full transparency for Bufferline
			hl.BufferLineFill = { bg = "NONE" }
			hl.BufferLineBackground = { bg = "NONE" }
			hl.BufferLineBufferVisible = { bg = "NONE" }
			hl.BufferLineBufferSelected = { bg = "NONE" }
			hl.BufferLineTabClose = { bg = "NONE" }
			hl.BufferLineIndicatorSelected = { bg = "NONE" }

			-- Full transparency for Lualine's middle part (StatusLine)
			hl.StatusLine = { bg = "NONE" }
			hl.StatusLineNC = { bg = "NONE" }

			-- Optional: Transparency for other UI components
			hl.TabLine = { bg = "NONE" }
			hl.TabLineFill = { bg = "NONE" }
			hl.TabLineSel = { bg = "NONE" }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
