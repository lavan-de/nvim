---@diagnostic disable: undefined-global
return {
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			spec = {
				{ "g", group = "GoTo", mode = { "n" } },
				{ "<leader>c", group = "Code", mode = { "n" } },
			},
		},
	},
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

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("gz", require("telescope.builtin").lsp_type_definitions, "[G]oto Type")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("<leader>ss", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>sz",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>cn", vim.lsp.buf.rename, "[C]ode [R]ename")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", "n")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", "x")
					map("<leader>ck", vim.lsp.buf.hover, "[C]ode [K]ind")
					map("<Leader>cf", function()
						vim.lsp.buf.format({ async = true })
					end, "[C]ode [F]ormat")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method("textDocument/documentHighlight") then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client.supports_method("textDocument/inlayHint") then
						map("<leader>si", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})


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
