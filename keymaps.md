# Keybindings

## Leader Key
- **Leader Key**: `<Space>` is set as the leader key.

---

## Obsidian Keybindings (Normal Mode)
- `<Leader>oo`: Change directory to `/home/lavan-de/Documents/BrainVault`.
- `<Leader>os`: Open Telescope to search files in `/home/lavan-de/Documents/BrainVault`.
- `<Leader>oz`: Open Telescope to live grep in `/home/lavan-de/Documents/BrainVault`.

---

## Harpoon Keybindings (Normal Mode)
- `<Leader>ha`: Add the current file to Harpoon.
- `<Leader>hh`: Toggle Harpoon's quick menu.
- `<Leader>hn`: Navigate to the next file in Harpoon.
- `<Leader>hp`: Navigate to the previous file in Harpoon.

---

## Window Splits (Normal Mode)
- `<Leader>sv`: Create a vertical split.
- `<Leader>sh`: Create a horizontal split.
- `<Leader>se`: Equalize split sizes.
- `<Leader>sc`: Close the current split.
- `<C-h>`: Move focus to the left window.
- `<C-l>`: Move focus to the right window.
- `<C-k>`: Move focus to the window above.
- `<C-j>`: Move focus to the window below.

---

## Buffer Navigation (Normal Mode)
- `<Tab>`: Cycle to the next buffer.
- `<S-Tab>`: Cycle to the previous buffer.
- `<Leader>bd`: Delete the current buffer.
- `<Leader>tt`: Open a new tab.

---

## Neotree Navigation (Normal Mode)
- `<C-n>`: Toggle Neotree filesystem view on the left.

---

## Floaterm (Normal and Terminal Mode)
- `<C-g>`: Toggle Floaterm.

---

## CopilotChat Keybindings
- **Insert Mode**:
  - `<C-S-s>`: Submit input to CopilotChat.
- **Normal Mode**:
  - `<Leader>cc`: Toggle CopilotChat on the right side (resized to 25% of the screen).

---

## LSP Keybindings (Normal Mode)
- `gd`: Go to the definition of the symbol under the cursor.
- `gD`: Go to the declaration of the symbol under the cursor.
- `gi`: Go to the implementation of the symbol under the cursor.
- `gr`: Show references for the symbol under the cursor.
- `<Leader>ca`: Open code actions.
- `<Leader>rn`: Rename the symbol under the cursor.
- `K`: Show hover information for the symbol under the cursor.
- `<Leader>gf`: Format the current buffer using LSP.
- **Insert Mode**:
  - `<C-s>`: Show signature help.

---

## Diagnostic Keybindings (Normal Mode)
- `[d`: Go to the previous diagnostic.
- `]d`: Go to the next diagnostic.
- `<Leader>e`: Open diagnostics in a floating window.
- `<Leader>dl`: List diagnostics in the quickfix list.
- **Normal and Insert Mode**:
  - `<C-b>`: Toggle inlay hints.

---

## Debugging Keybindings (DAP) (Normal Mode)
- `<F5>`: Start or continue debugging.
- `<F1>`: Step into.
- `<F2>`: Step over.
- `<F3>`: Step out.
- `<Leader>b`: Toggle breakpoint.
- `<Leader>B`: Set a conditional breakpoint.
- `<F7>`: Toggle DAP UI to see the last session result.

---

## Telescope Keybindings (Normal Mode)
- `<C-p>`: Search files.
- `<Leader>?`: Find recently opened files.
- `<Leader><Leader>`: Find existing buffers.
- `<Leader>sb`: Search existing buffers.
- `<Leader>sm`: Search marks.
- `<Leader>sh`: Search help tags.
- `<Leader>sw`: Search for the word under the cursor.
- `<Leader>sg`: Live grep.
- `<Leader>sd`: Search diagnostics.
- `<Leader>s/`: Live grep in open files.
- `<Leader>/`: Fuzzy search in the current buffer.
- `<Leader>sds`: Search LSP document symbols (e.g., Class, Function, Method).

---

## Git-related Telescope Keybindings (Normal Mode)
- **Commented Out**:
  - `<Leader>gp`: Search Git files.
  - `<Leader>gc`: Search Git commits.
  - `<Leader>gcf`: Search Git commits for the current file.
  - `<Leader>gb`: Search Git branches.
  - `<Leader>gs`: Search Git status (diff view).

---

## Notes
- All keybindings are non-recursive (`noremap`) and silent (`silent`).
- Telescope extensions `fzf` and `ui-select` are enabled.
