vim.opt.conceallevel = 1

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- Use latest release
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		override = {
			disable_frontmatter = true,
		},
		workspaces = {
			{
				name = "Codex",
				path = "/mnt/c/Users/lars4/Documents/GitHub/vault/Codex",
			},
		},

		templates = {
			subdir = "templates", -- Ensure it looks for templates in Codex/templates
			date_format = "%d-%m-%Y", -- Format for {date}
			time_format = "%H:%M", -- Format for {time}
			-- Setting this to false ensures templates are inserted directly
			substitute_templates = false,
		},

		-- Optional: If you want to auto-complete links
		completion = {
			nvim_cmp = true, -- If using nvim-cmp for completion
		},
	},
}
