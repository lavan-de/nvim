-- Set custom path for saving CopilotChat conversations
vim.g.copilot_chat_save_path = "~/Co-pilot/chat-log/"

-- Enable split to the right for vertical splits
vim.opt.splitright = true

-- Syntax and indentation settings
vim.cmd("syntax enable")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("syntax on")

vim.g.wiki_root = '~/wiki'


-- Enable hybrid line numbers (absolute when in insert mode, relative otherwise)
vim.opt.nu = true             -- Show absolute line number for the current line
vim.opt.relativenumber = true -- Show relative line numbers for other lines

-- Disable error bells
vim.opt.errorbells = false

-- Enable smart indenting
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

vim.opt.pumheight = 10 -- Limit the completion menu to 10 items

vim.wo.number = true
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.linebreak = true
vim.o.mouse = 'a'
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.swapfile = false -- creates a swapfile
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.o.undofile = true -- Save undo history
vim.o.hlsearch = false -- Set highlight on search

-- Scroll offset to keep cursor in the middle of the screen
vim.o.scrolloff = 10
