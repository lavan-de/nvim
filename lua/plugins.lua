return {
	-- Which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			defaults = {},
			-- @type false | "classic" | "modern" | "helix"
			preset = vim.g.which_key_preset or "helix", -- default is "classic"
			-- Custom helix layout
			win = vim.g.which_key_window or {
				width = { min = 30, max = 60 },
				height = { min = 4, max = 0.85 },
			},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>oi1", group = "Codex" },
					{ "<leader>ot", group = "Templates" },
					{ "<leader>a", group = "AI" },
					{ "<leader>b", group = "Buffers" },
					{ "<leader>c", group = "Code" },
					{ "<leader>g", group = "Git" },
					{ "<leader>gh", group = "Hunks" },
					{ "<leader>n", group = "Navigate"},
					{ "<leader>o", group = "Obsidian"},
					{ "<leader>oi", group = 'vaults'},
					{ "<leader>s", group = "Telescope" },
					{ "<leader>t", group = "Tabs" },
					{ "<leader>e", group = "File Tree", icon = { icon = "󰙵 ", color = "cyan" } },
					{ "<leader>w", group = "Wiki" },
					{ "<leader>d", group = "Debugger", icon = { icon = "󱖫 ", color = "green" } },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "GoTo" },
					{ "gs", group = "Surround" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps (which-key)",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			if not vim.tbl_isempty(opts.defaults) then
				wk.register(opts.defaults)
			end
		end,
	},
	-- lualine plugin setup
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
	-- rainbow-delimiters.lua
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
	-- Use gs for surround as `s` is used by flash
	{
		"echasnovski/mini.surround",
		vscode = true,
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
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

	-- Unimpaired plugin setup
	{
		"tummetott/unimpaired.nvim",
		config = function()
			require("unimpaired").setup()
		end,
	},
}
