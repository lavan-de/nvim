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
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
				numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				buffer_close_icon = "✕",
				close_icon = "",
				path_components = 1, -- Show only the file name without the directory
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				tab_size = 21,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				separator_style = { "║", "║" }, -- | "thick" | "thin" | { 'any', 'any' },
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				show_tab_indicators = false,
				indicator = {
					icon = "", -- this should be omitted if indicator style is not 'icon'
					style = "underline", -- Options: 'icon', 'underline', 'none'
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
					fg = "#D9E0EE",
				},
				buffer_selected = {
					bold = true,
					italic = false,
					underline = true,
					undercurl = false,
					sp = "#D9E0EE",
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
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
			local catppuccin = require("lualine.themes.catppuccin")

			-- Function to safely copy colors if the field exists
			local function safe_copy(target, source, mode)
				if source[mode] and source[mode].a then
					target[mode] = target[mode] or {}
					target[mode].a = target[mode].a or {}
					target[mode].a.bg = source[mode].a.bg or target[mode].a.bg
					target[mode].a.fg = source[mode].a.fg or target[mode].a.fg
				end
			end

			-- Copy mode colors from Catppuccin theme (if they exist)
			local modes = { "normal", "insert", "visual", "replace", "command", "terminal", "inactive" }
			for _, mode in ipairs(modes) do
				safe_copy(catppuccin, catppuccin, mode)
			end

			-- Make the middle section transparent
			catppuccin.normal.c.bg = "NONE"

			require("lualine").setup({
				options = {
					theme = catppuccin, -- Uses Catppuccin theme with mode-based colors
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
	}
}
