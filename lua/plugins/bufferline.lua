return {
	-- Tabline
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			"moll/vim-bbye",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
		},
		opts = {
			options = {
				mode = "buffers",
				themable = true,
				numbers = "none",
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				buffer_close_icon = "✕",
				close_icon = "",
				path_components = 1,
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30,
				tab_size = 21,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				persist_buffer_sort = true,
				separator_style = { "║", "║" },
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				show_tab_indicators = false,
				indicator = {
					icon = "",
					style = "underline",
				},
				icon_pinned = "󰐃",
				minimum_padding = 1,
				maximum_padding = 5,
				maximum_length = 15,
				sort_by = "insert_at_end",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
			highlights = {
				separator = {
					fg = "#7AA2F7", -- Set to none for transparency
				},
				buffer_selected = {
					bold = true,
					italic = false,
					underline = true,
					undercurl = false,
					fg = "#7AA2F7", -- Adjust selected buffer color if needed
					bg = "NONE", -- Make selected buffer background transparent
				},
				fill = {
					bg = "NONE", -- Make the fill background transparent
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Import Tokyonight colors
			local tokyonight_colors = require("tokyonight.colors").setup()

			-- Use the horizon theme from lualine
			local horizon_theme = require("lualine.themes.horizon")

			-- Customize the Normal mode to match the Tokyonight normal mode color
			horizon_theme.normal.a = {
				bg = tokyonight_colors.blue,
				fg = tokyonight_colors.bg,
				gui = "bold",
			}

			horizon_theme.normal.b = {
				bg = tokyonight_colors.bg,
				fg = tokyonight_colors.fg,
			}

			horizon_theme.normal.c = {
				bg = "NONE", -- Transparent middle section
				fg = tokyonight_colors.fg,
			}

			-- Set up the lualine with the modified horizon theme
			require("lualine").setup({
				options = {
					theme = horizon_theme, -- Use modified horizon theme
					icons_enabled = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "NvimTree", "neo-tree" },
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				extensions = { "quickfix", "toggleterm", "nvim-tree" },
			})
		end,
	},
}
