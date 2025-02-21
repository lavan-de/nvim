Window Splits

    <Leader>rv: Vertical split
    <Leader>rh: Horizontal split
    <Leader>re: Equalize split sizes
    <Leader>rc: Close current split
    <C-h>: Move left
    <C-l>: Move right
    <C-k>: Move up
    <C-j>: Move down

Buffer Navigation

    <Tab>: Next buffer
    <S-Tab>: Previous buffer
    <Leader>bd: Delete buffer
    <Leader>bn: New tab

Neotree Navigation

    <C-n>: Open Neotree filesystem

Copilot Keybindings

    <C-y>: Accept Copilot suggestion
    <C-i>: Accept line
    <C-j>: Next suggestion
    <C-k>: Previous suggestion
    <C-d>: Dismiss suggestion

Completion Menu Keybindings

    <C-y>: Open completion menu
    <C-e>: Close completion menu
    <CR>: Confirm selection

Scrolling Documentation

    <C-b>: Scroll documentation back
    <C-f>: Scroll documentation forward

Copilot Chat Keybindings

    <leader>ae: Explain code
    <leader>at: Generate tests
    <leader>ar: Review code
    <leader>aR: Refactor code
    <leader>an: Better naming
    <leader>av: Open in vertical split (visual mode)
    <leader>ax: Inline chat (visual mode)
    <leader>ai: Ask input (custom prompt)
    <leader>aq: Quick chat (prompt for buffer chat)
    <leader>am: Generate commit message
    <leader>ad: Debug info
    <leader>af: Fix diagnostic
    <leader>al: Clear buffer and history
    <leader>av: Toggle Copilot Chat Vsplit
    <leader>a?: Select models
    <leader>aa: Select agents

GitSigns Keybindings

    ]h: Next hunk
    [h: Previous hunk
    ]H: Last hunk
    [H: First hunk
    <leader>ghs: Stage hunk
    <leader>ghr: Reset hunk
    <leader>ghS: Stage buffer
    <leader>ghu: Undo stage hunk
    <leader>ghR: Reset buffer
    <leader>ghp: Preview hunk inline
    <leader>ghb: Blame line (full)
    <leader>ghB: Blame buffer
    <leader>ghd: Diff this
    <leader>ghD: Diff this (~)
    ih: Select hunk (operator & visual mode)
    <leader>tb: Toggle current line blame

Trouble Keybindings

    <leader>xx: Toggle diagnostics
    <leader>xX: Toggle buffer diagnostics
    <leader>cs: Toggle symbols
    <leader>xL: Toggle location list
    <leader>xQ: Toggle quickfix list

Terminal Keybindings

    <C-_>: Toggle terminal
    <leader>ft: Find & toggle terminal
    <leader><C-_>: Send current line to terminal
    <leader><C-_> (Visual mode): Send visual selection to terminal

Miscellaneous Navigation

    [: Previous item
    ]: Next item
    g: Go to
    gs: Surround actions
    z: Fold actions

Buffer Management Keybindings (BufferLine)

    <leader>bp: Toggle pin
    <leader>bP: Delete non-pinned buffers
    <leader>bo: Delete other buffers
    <leader>br: Delete buffers to the right
    <leader>bl: Delete buffers to the left
    <S-h> / [b: Previous buffer
    <S-l> / ]b: Next buffer
    [B: Move buffer to the previous position
    ]B: Move buffer to the next position

LSP Attach Autocmd (Buffer-local mappings)

    gd: Go to definition
    gD: Go to declaration
    gi: Go to implementation
    gr: Go to references
    <Leader>ca: Code action
    <Leader>crn: Rename
    <leader>ck: Hover
    <C-s>: Signature help
    <Leader>cf: Format using LSP

Diagnostic Keymaps

    [d: Previous diagnostic
    ]d: Next diagnostic
    <Leader>xe: Open diagnostics
    <Leader>xl: List diagnostics in quickfix

Debugging Keymaps (DAP)

    <leader>ds: Start/continue debugging
    <leader>di: Step into
    <leader>do: Step over
    <leader>du: Step out
    <leader>db: Toggle breakpoint
    <leader>B: Set breakpoint (with condition)
    <leader><leader>d: Toggle DAP UI

General Telescope Keymaps

    <leader>sf: Search files
    <leader>?: Find recently opened files
    <leader><leader>: Find existing buffers
    <leader>sb: Search existing buffers
    <leader>sm: Search marks
    <leader>sh: Search help
    <leader>sw: Search current word
    <leader>sg: Search by grep
    <leader>sd: Search diagnostics

LSP-related Telescope Keymaps

    <leader>sds: Search LSP document symbols
    <leader>s/: Live grep in open files
    <leader>/: Fuzzily search in current buffer

Git-related Telescope Keymaps

    <leader>gp: Search Git files
    <leader>gc: Search Git commits
    <leader>gcf: Search Git commits for current file
    <leader>gb: Search Git branches
    <leader>gs: Search Git status (diff view)
