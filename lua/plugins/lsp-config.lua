return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						enabled = true,
						package_installed = "",
						package_pending = "",
						package_uninstalled = "",
					},
				},
			})
			mason_lspconfig.setup({
				ensure_installed = {
					"clangd",
					"lua_ls",
					"bashls",
					"marksman",
				},
				automatic_installation = true,
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"clang-format",
					"stylua",
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},

	{
		-- bridges the gap between mason and lspconfig
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "j-hui/fidget.nvim", tag = "legacy" },
		},
		config = function()
			local lsp_config = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd", -- C/C++ LSP
					"lua_ls", -- Lua LSP
					"bashls", -- Bash LSP
					"marksman", -- Markdown LSP
				},
			})
			-- Tooltip for the LSP in bottom right
			require("fidget").setup({})
			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.diagnostic.config({
				virtual_text = true,
				signs = false,
			})

			local sign = { Error = "", Warning = "", Hint = "", Information = "" }
			for type, icon in pairs(sign) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- C/C++ LSP
			lsp_config.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--suggest-missing-includes",
					"--completion-style=detailed",
				},
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = lsp_config.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
				settings = {
					clangd = {
						fallbackFlags = { "-std=c++23", "-std=c23" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			})

			-- Bash LSP
			lsp_config.bashls.setup({
				capabilities = capabilities,
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh" },
				root_dir = function(fname)
					return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
				end,
				settings = {
					bash = {
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			-- Lua LSP
			lsp_config.lua_ls.setup({
				capabilities = capabilities,
				filetypes = { "lua" },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- Markdown LSP
			lsp_config.marksman.setup({
				capabilities = capabilities,
				cmd = { "marksman", "server" },
				filetypes = { "markdown" },
				root_dir = lsp_config.util.root_pattern(".git", ".marksman.toml"),
			})
		end,
	},
}
