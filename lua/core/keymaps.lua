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

-- Navigation, general paths
keymap("n", "<leader>nic", ":cd ~/codam<cr>", { desc = "Codam" })
---
---
---
---

-- Obsidian ---
-- 1.
-- navigate to vault
keymap("n", "<leader>oia", ":cd /mnt/c/Users/lars4/Documents/GitHub/vaults<cr>", { desc = "Navigate to vaults" })
keymap(
	"n",
	"<leader>oib",
	":e /mnt/c/Users/lars4/Documents/GitHub/vaults/index-vaults.md<CR>",
	{ desc = "vaults Index" }
)
keymap(
	"n",
	"<leader>oi1a",
	":vsplit /mnt/c/Users/lars4/Documents/GitHub/vaults/Codex/index-codex.md<CR>",
	{ desc = "Codex Index :vsplit" }
)
keymap(
	"n",
	"<leader>oi1b",
	":e /mnt/c/Users/lars4/Documents/GitHub/vaults/Codex/index-codex.md<CR>",
	{ desc = "Codex Index" }
)

-- convert note to template and remove leading white space
keymap(
	"n",
	"<leader>ot1",
	":ObsidianTemplate t_note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
	{ desc = "T: Note" }
)
keymap(
	"n",
	"<leader>ot2",
	":ObsidianTemplate t_index<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
	{ desc = "T: Index" }
)
keymap(
	"n",
	"<leader>ot3",
	":ObsidianTemplate t_daily<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
	{ desc = "T: Daily" }
)

-- Telescope open note, vertical split
keymap(
	"n",
	"<leader>oF",
	":vsplit | Telescope find_files search_dirs={'/mnt/c/Users/lars4/Documents/GitHub/vaults'}<CR>",
	{ desc = "Find Files in Vault (Vertical Split)" }
)
keymap(
	"n",
	"<leader>oG",
	":vsplit | Telescope live_grep search_dirs={'/mnt/c/Users/lars4/Documents/GitHub/vaults'}<CR>",
	{ desc = "Grep in Vault Notes (Vertical Split)" }
)

-- 2.
-- Obsidian search open note
keymap("n", "<leader>of", ":ObsidianQuickSwitch<CR>", { desc = "Quick Switch (Find Notes)" })
keymap("n", "<leader>og", ":ObsidianSearch<CR>", { desc = "Search Notes (Live Grep)" })

-- List tags
keymap("n", "<leader>oT", ":ObsidianTags<CR>", { desc = "List All Tags" })
-- Toggle checkboxes (task completion)
keymap("n", "<leader>o<leader>", ":ObsidianToggleCheckbox<CR>", { desc = "Toggle Checkbox" })
-- Insert a Table of Contents
keymap("n", "<leader>oC", ":ObsidianTOC<CR>", { desc = "Insert Table of Contents" })
-- Extract selected text into a new note
keymap("v", "<leader>oe", ":ObsidianExtractNote<CR>", { desc = "Extract Selection into New Note" })
-- Rename the current note
keymap("n", "<leader>oR", ":ObsidianRename<CR>", { desc = "Rename Current Note" })
-- Follow link under cursor (default opens in same window)
keymap("n", "<leader>ok", ":ObsidianFollowLink<CR>", { desc = "Follow Link Under Cursor" })
-- Follow link under cursor in vertical split
keymap("n", "<leader>ov", ":ObsidianFollowLink vsplit<CR>", { desc = "Follow Link (Vertical Split)" })
-- Follow link under cursor in horizontal split
keymap("n", "<leader>oh", ":ObsidianFollowLink hsplit<CR>", { desc = "Follow Link (Horizontal Split)" })
-- Open backlinks for the current note
keymap("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Show Backlinks" })
-- Open linked notes inside current note
keymap("n", "<leader>ol", ":ObsidianLinks<CR>", { desc = "List Linked Notes" })
-- Create a new note (prompts for title)
keymap("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Create a new note" })
-- Create a new daily note
keymap("n", "<leader>od", ":ObsidianToday<CR>", { desc = "Create/Open Today's Note" })
-- Open Yesterday’s note
keymap("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Open Yesterday's Note" })
-- Open Tomorrow’s note
keymap("n", "<leader>ot", ":ObsidianTomorrow<CR>", { desc = "Open Tomorrow's Note" })
-- Toggle checkbox
keymap("n", "<leader>o<leader>", ":ObsidianToggleCheckbox<cr>", { desc = "Toggle checkbox" })
-- Switch between Obsidian Workspaces
keymap("n", "<leader>ow", ":ObsidianWorkspace<CR>", { desc = "Switch Workspace" })
-- Open a list of all daily notes
keymap("n", "<leader>oD", ":ObsidianDailies<CR>", { desc = "List Daily Notes" })
-- Paste an image from clipboard into the note
keymap("n", "<leader>op", ":ObsidianPasteImg<CR>", { desc = "Paste Image from Clipboard" })

-- Vertical scroll and center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

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
