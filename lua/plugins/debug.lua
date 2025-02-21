return {
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'julianolf/nvim-dap-lldb',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_setup = true,
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                'codelldb',  -- Add this for C/C++
                'dart-debug', -- Use the official Dart debug adapter
                'bash-debug-adapter', -- Add this for Bash
            },
        }

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            -- Feel free to remove or use ones that you like more! :)
            -- Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end

        -- Install language-specific configurations
        dap.adapters.lldb = {
            type = 'executable',
            command = 'lldb-vscode', -- adjust as needed
            name = 'lldb'
        }
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        dap.adapters.sh = {
            type = 'executable',
            command = 'bash-debug-adapter',
            args = {}
        }
        dap.configurations.sh = {
            {
                type = 'sh',
                request = 'launch',
                name = 'Launch Bash Script',
                program = function()
                    return vim.fn.input('Path to Bash script: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
            },
        }
    end,
}
