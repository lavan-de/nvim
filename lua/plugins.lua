return {

    -- Which-key plugin setup
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
		end,
		opts = {},
	},

	-- Wiki.vim plugin setup
	{
		"lervag/wiki.vim",
		-- tag = "v0.10", -- uncomment to pin to a specific release
		init = function()
			-- wiki.vim configuration goes here, e.g.
			-- vim.g.vimtex_option_name = value  -- Example Vimscript config translated to Lua
		end,
	},

	-- Markdown plugin setup
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- Adjust based on your preference
		opts = {},
		ft = "markdown",
	},

	-- Vim Illuminate plugin setup
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate") -- Configure the illuminate plugin
		end,
	},

	-- Mini AI plugin setup
	{
		"echasnovski/mini.ai",
		version = "*", -- Use latest version from the main branch
		config = function()
			require("mini.ai").setup()
		end,
	},

	-- lua/plugins/rainbow-delimiters.lua
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			-- Configure the plugin using vim.g
			vim.g.rainbow_delimiters = {
				highlight = {
					enable = true,
					colors = {
						"#ff6347", -- Red for first level
						"#4682b4", -- Blue for second level
						"#32cd32", -- Green for third level
					},
				},
			}
		end,
	},

	-- nvim-autopairs plugin setup
	{
		"windwp/nvim-autopairs",
		config = function()
			-- Configuration for nvim-autopairs
			local npairs = require("nvim-autopairs")

			npairs.setup({
				check_ts = true, -- Enable tree-sitter integration (recommended)
				ts_config = {
					lua = { "string", "source" }, -- Adjust for specific languages
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- Disable in certain filetypes
				fast_wrap = {
					map = "<M-e>", -- Keymap for quick wrapping
					chars = { "{", "[", "(", '"', "'" }, -- Characters to wrap
					pattern = string.gsub([[ [%'%"%)%>%]%)%} ]], "%s+", ""),
					offset = 0, -- Offset from the cursor position
					end_key = "$", -- End key for wrapping
				},
			})
		end,
	},

	-- Lualine plugin setup
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "everforest",
					icons_enabled = true,
				},
			})
		end,
	},

	-- Comment plugin setup
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Floaterm plugin setup
	{
		"voldikss/vim-floaterm",
		config = function() end,
	},

	-- Unimpaired plugin setup
	{
		"tummetott/unimpaired.nvim",
		config = function()
			require("unimpaired").setup()
		end,
	},

	-- Neovim development
	{
		"folke/neodev.nvim",
	},

	-- Language support, mainly for indentation because it's more stable than treesitter in Dart
	-- "dart-lang/dart-vim-plugin",
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = false,
			})
		end,
	},

	-- Git
	{
		"tpope/vim-fugitive",
		config = function() end,
	},

	-- Gitlinker
	{
		"ruifm/gitlinker.nvim",
		config = function()
			-- default keybind is <leader>gy
			require("gitlinker").setup()
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
