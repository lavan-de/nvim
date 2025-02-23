return {
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			spec = {
				{ "<leader>d", group = "Debugger", mode = { "n" } },
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"julianolf/nvim-dap-lldb",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local mason_registry = require("mason-registry")

			require("dapui").setup()
			require("dap-go").setup()
			require("mason-nvim-dap").setup({
				automatic_setup = true,
				automatic_installation = true,
				handlers = {},
			})

			-- Debugging Keymaps (DAP)
			vim.keymap.set("n", "<leader>d1", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<leader>d2", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<leader>d3", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>d4", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>d5", dapui.toggle, { desc = "Debug: Toggle UI" })

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
			vim.keymap.set("n", "<leader>dl", function()
				print(vim.inspect(dap.list_breakpoints()))
			end, { desc = "Debug: List Breakpoints" })

			vim.g.dap_keymaps_set = true

			-- Automatically open/close dap-ui
			dap.listeners.before.attach["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.launch["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Setup codelldb for C, C++, Rust
			local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
			local codelldb_path = codelldb_root .. "adapter/codelldb"
			local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				host = "127.0.0.1",
				executable = {
					command = codelldb_path,
					args = { "--liblldb", liblldb_path, "--port", "${port}" },
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch C/C++",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
	
			-- Bash setup
			dap.adapters.sh = {
				type = "executable",
				command = "bash-debug-adapter",
				args = {},
			}
			dap.configurations.sh = {
				{
					type = "sh",
					request = "launch",
					name = "Launch Bash Script",
					program = function()
						return vim.fn.input("Path to Bash script: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},
}
