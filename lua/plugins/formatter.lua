-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
return {
	"mhartington/formatter.nvim",
	config = function()
		local settings = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			cpp = {
				require("formatter.filetypes.cpp").clangformat,
			},
			markdown = {
				require("formatter.filetypes.markdown").prettier,
			},
			sh = {
				require("formatter.filetypes.sh").shfmt,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		}

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = settings,
		})

		vim.keymap.set("n", "<leader>f", function()
			if settings[vim.bo.filetype] ~= nil then
				vim.cmd([[Format]])
			else
				-- Simplified LSP formatting without Dart checks
				vim.lsp.buf.format()
			end
		end)
	end,
}
