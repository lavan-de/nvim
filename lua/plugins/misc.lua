-- Standalone plugins with less than 10 lines of config go here
return {
	-- Tmux & split window navigation
	{
		"christoomey/vim-tmux-navigator",
	},
	-- Detect tabstop and shiftwidth automatically
	{
		"tpope/vim-sleuth",
	},
	-- Hints keybinds
	{
		"folke/which-key.nvim",
	},
	-- Neovim development
	{
		"folke/neodev.nvim",
	},
	-- Autoclose parentheses, brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	-- High-performance color highlighter
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
