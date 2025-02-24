return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			-- Ensure opts.routes is a table
			opts.routes = opts.routes or {}

			-- Ensure opts.presets is a table
			opts.presets = opts.presets or {}

			-- Add your additional presets
			opts.presets.bottom_search = true            -- use a classic bottom cmdline for search
			opts.presets.command_palette = true          -- position the cmdline and popupmenu together
			opts.presets.long_message_to_split = true    -- long messages will be sent to a split
			opts.presets.inc_rename = false              -- enables an input dialog for inc-rename.nvim
			opts.presets.lsp_doc_border = false          -- add a border to hover docs and signature help

			-- Now you can safely access and modify opts.presets
			opts.presets.lsp_doc_border = true  -- Or any other settings you want to modify here

			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},
}
