-- Borrow those settings from LazyVim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set


-- Save file
-- keymap("n", "<C-s>", "<cmd> w <CR>", opts)
-- Quit file
-- keymap("n", "<C-q>", "<cmd> q <CR>", opts)

-- Vertical scroll and center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bx", ":Bdelete!<CR>", opts)
keymap("n", "<leader>bn", "<cmd> enew <CR>", opts)

-- Window management
keymap("n", "<leader>v", "<C-w>v", opts)      -- split window vertically
keymap("n", "<leader>h", "<C-w>s", opts)      -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts)     -- make split windows equal width & height
keymap("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
keymap("n", "<C-k>", ":wincmd k<CR>", opts)
keymap("n", "<C-j>", ":wincmd j<CR>", opts)
keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", opts)   -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts)     --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts)     --  go to previous tab

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep last yanked when pasting
keymap("v", "p", '"_dP', opts)

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

