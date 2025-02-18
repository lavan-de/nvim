local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local builtin = require("telescope.builtin")
local dap = require 'dap'
local dapui = require 'dapui'

-- Enable Telescope extensions (fzf and ui-select)
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- Leader Key
vim.g.mapleader = " " -- Set space as leader key

-- Obsidian Keybindings
keymap("n", "<leader>oo", ":cd /home/lavan-de/Documents/BrainVault", opts)
keymap("n", "<leader>os", ":Telescope find_files search_dirs={'/home/lavan-de/Documents/BrainVault'}<CR>", opts)
keymap("n", "<leader>oz", ":Telescope live_grep search_dirs={'/home/lavan-de/Documents/BrainVault'}<CR>", opts)

-- Harpoon Keybindings
keymap("n", "<Leader>ha", harpoon_mark.add_file, opts)                -- Add current file to Harpoon
keymap("n", "<Leader>hh", harpoon_ui.toggle_quick_menu, opts)         -- Open Harpoon UI
keymap("n", "<Leader>hn", function() harpoon_ui.nav_next() end, opts) -- Go to next file
keymap("n", "<Leader>hp", function() harpoon_ui.nav_prev() end, opts) -- Go to previous file

-- Window Splits
keymap("n", "<Leader>sv", ":vsplit<CR>", opts) -- Vertical split
keymap("n", "<Leader>sh", ":split<CR>", opts)  -- Horizontal split
keymap("n", "<Leader>se", "<C-w>=", opts)      -- Equalize split sizes
keymap("n", "<Leader>sc", "<C-w>c", opts)      -- Close current split

keymap("n", "<C-h>", ":wincmd h<CR>", opts)    -- Move left
keymap("n", "<C-l>", ":wincmd l<CR>", opts)    -- Move right
keymap("n", "<C-k>", ":wincmd k<CR>", opts)    -- Move up
keymap("n", "<C-j>", ":wincmd j<CR>", opts)    -- Move down

-- Buffer Navigation
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<Leader>bd", ":bdelete<CR>", opts) -- Delete buffer
keymap("n", "<Leader>tt", ":tabnew<CR>", opts)  -- New tab

-- Neotree Navigation
keymap("n", "<C-n>", ":Neotree filesystem reveal left<CR>", opts)

-- Floaterm
keymap("n", "<C-g>", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
keymap("t", "<C-g>", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })

-- CopilotChat keymaps
keymap('i', '<C-S-s>', ":CopilotChatSubmit<CR>", opts)

-- Toggle CopilotChat on the right side with resized split (25% of screen)
keymap('n', '<Leader>cc', ':CopilotChatToggle<CR>', { desc = "Toggle CopilotChat on right" })

-- LSP Attach Autocmd (Buffer-local mappings)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local buf_opts = { buffer = ev.buf }

        -- Navigation
        keymap("n", "gd", vim.lsp.buf.definition, buf_opts)
        keymap("n", "gD", vim.lsp.buf.declaration, buf_opts)
        keymap("n", "gi", vim.lsp.buf.implementation, buf_opts)
        keymap("n", "gr", vim.lsp.buf.references, buf_opts)

        -- Actions
        keymap("n", "<Leader>ca", vim.lsp.buf.code_action, buf_opts)
        keymap("n", "<Leader>rn", vim.lsp.buf.rename, buf_opts)
        keymap("n", "K", vim.lsp.buf.hover, buf_opts)
        keymap("i", "<C-s>", vim.lsp.buf.signature_help, buf_opts) -- New: Signature help
        keymap("n", "<Leader>gf", function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf, desc = "Format using LSP" })
    end,
})

-- Diagnostic Keymaps (for errors, warnings, etc.)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)         -- Go to previous diagnostic
keymap("n", "]d", vim.diagnostic.goto_next, opts)         -- Go to next diagnostic
keymap("n", "<Leader>e", vim.diagnostic.open_float, opts) -- Open diagnostics
keymap("n", "<Leader>dl", vim.diagnostic.setqflist, opts) -- New: List diagnostics in quickfix
keymap({ "n", "i" }, "<C-b>", function()                  -- New: Toggle inlay hints
    vim.lsp.inlay_hint(0, nil)
end, opts)

-- Debugging Keymaps (DAP)
keymap('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
keymap('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
keymap('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
keymap('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
keymap('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
keymap('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

keymap('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

-- General Telescope Keymaps
keymap('n', '<C-p>', builtin.find_files, { desc = 'Search Files' }) -- Existing mapping

-- New Telescope Keymaps
keymap('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
keymap('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
keymap('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing [B]uffers' })
keymap('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
keymap('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
keymap('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
keymap('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap('n', '<leader>s/', function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end, { desc = '[S]earch [/] in Open Files' })
keymap('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Git-related Telescope Keymaps
-- keymap('n', '<leader>gp', builtin.git_files, { desc = 'Search [G]it [F]iles' })
-- keymap('n', '<leader>gc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
-- keymap('n', '<leader>gcf', builtin.git_bcommits, { desc = 'Search [G]it [C]ommits for current [F]ile' })
-- keymap('n', '<leader>gb', builtin.git_branches, { desc = 'Search [G]it [B]ranches' })
-- keymap('n', '<leader>gs', builtin.git_status, { desc = 'Search [G]it [S]tatus (diff view)' })

-- LSP-related Telescope Keymaps
keymap('n', '<leader>sds', function()
    builtin.lsp_document_symbols {
        symbols = { 'Class', 'Function', 'Method', 'Constructor', 'Interface', 'Module', 'Property' },
    }
end, { desc = '[S]earch LSP document [S]ymbols' })

return {}
