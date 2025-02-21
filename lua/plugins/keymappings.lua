local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local dap = require("dap")
local dapui = require("dapui")

-- Enable Telescope extensions (fzf and ui-select)
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

vim.g.mapleader = " " -- Set space as leader key

-- Window Splits
keymap("n", "<Leader>rv", ":vsplit<CR>", opts) -- Vertical split
keymap("n", "<Leader>rh", ":split<CR>", opts)  -- Horizontal split
keymap("n", "<Leader>re", "<C-w>=", opts)      -- Equalize split sizes
keymap("n", "<Leader>rc", "<C-w>c", opts)      -- Close current split

keymap("n", "<C-h>", ":wincmd h<CR>", opts)    -- Move left
keymap("n", "<C-l>", ":wincmd l<CR>", opts)    -- Move right
keymap("n", "<C-k>", ":wincmd k<CR>", opts)    -- Move up
keymap("n", "<C-j>", ":wincmd j<CR>", opts)    -- Move down

-- Buffer Navigation
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<Leader>bd", ":bdelete<CR>", opts) -- Delete buffer
keymap("n", "<Leader>bn", ":tabnew<CR>", opts)  -- New tab

-- Neotree Navigation
keymap("n", "<C-n>", ":Neotree filesystem reveal left<CR>", opts)

-- Set <C-y> to accept copilot suggestion
keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
-- Set <C-i> to accept line
keymap("i", "<C-i>", "<Plug>(copilot-accept-line)", opts)
-- Set <C-j> to next suggestion, <C-k> to previous suggestion
keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)
-- Set <C-d> to dismiss suggestion
keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)

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
        keymap("n", "<Leader>cr", vim.lsp.buf.rename, buf_opts)
        keymap("n", "<leader>ck", vim.lsp.buf.hover, buf_opts)
        keymap("i", "<C-s>", vim.lsp.buf.signature_help, buf_opts) -- New: Signature help
        keymap("n", "<Leader>cf", function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf, desc = "Format using LSP" })
    end,
})

-- Diagnostic Keymaps (for errors, warnings, etc.)
keymap("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
end, opts) -- Go to previous diagnostic
keymap("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
end, opts)                                                -- Go to next diagnostic

keymap("n", "<Leader>xe", vim.diagnostic.open_float, opts) -- Open diagnostics
keymap("n", "<Leader>xl", vim.diagnostic.setqflist, opts) -- New: List diagnostics in quickfix
keymap({ "n", "i" }, "<C-x>", function()                  -- New: Toggle inlay hints
    vim.lsp.inlay_hint(0, nil)
end, opts)

-- Debugging Keymaps (DAP)
keymap("n", "<leader>d1", dap.continue, { desc = "Debug: Start/Continue" })
keymap("n", "<leader>d2", dap.step_into, { desc = "Debug: Step Into" })
keymap("n", "<leader>d3", dap.step_over, { desc = "Debug: Step Over" })
keymap("n", "<leader>d4", dap.step_out, { desc = "Debug: Step Out" })
keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
keymap("n", "<leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Breakpoint" })

keymap("n", "<leader>d5", dapui.toggle, { desc = "Debug: See last session result." })

-- General Telescope Keymaps
keymap("n", "<leader>sf", builtin.find_files, { desc = "Search Files" }) -- Existing mapping

keymap("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
keymap("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
keymap("n", "<leader>sb", builtin.buffers, { desc = "[S]earch existing [B]uffers" })
keymap("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
keymap("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
-- LSP-related Telescope Keymaps
keymap("n", "<leader>xs", function()
    builtin.lsp_document_symbols({
        symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Property" },
    })
end, { desc = "[S]earch LSP document [S]ymbols" })
keymap("n", "<leader>s/", function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, { desc = "[S]earch [/] in Open Files" })
keymap("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- Git-related Telescope Keymaps
keymap("n", "<leader>gp", builtin.git_files, { desc = "Search [G]it [F]iles" })
keymap("n", "<leader>gc", builtin.git_commits, { desc = "Search [G]it [C]ommits" })
keymap("n", "<leader>gcf", builtin.git_bcommits, { desc = "Search [G]it [C]ommits for current [F]ile" })
keymap("n", "<leader>gb", builtin.git_branches, { desc = "Search [G]it [B]ranches" })
keymap("n", "<leader>gs", builtin.git_status, { desc = "Search [G]it [S]tatus (diff view)" })

return {}

