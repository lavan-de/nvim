
(directory ~/wiki, is needed for the keybindings to work)


<leader>a	AI	AI-related actions (e.g., Copilot, Codeium)
<leader>b	Buffer	Buffer management (e.g., closing, switching, pinning)
<leader>c	Code	Code-related actions (e.g., LSP, refactoring, formatting)
<leader>d   Debug   Debugging (e.g., DAP, breakpoints)
<leader>f	File / Find	File navigation and searching (e.g., Telescope, file tree)
<leader>g	Git	Git commands (e.g., Gitsigns, Fugitive)
<leader>h	Harpoon	Harpoon-related keymaps
<leader>m	Markdown / Notes	Markdown preview, note-taking (e.g., Glow, Obsidian)
<leader>q	Quit / Session	Quitting, saving, session management
<leader>r   Window Window management (e.g., splits, resizing, closing)
<leader>s	Search	Searching within files (e.g., Grep, Telescope)
<leader>t	Toggle	UI and tool toggles (e.g., Trouble, Terminal, Blame)
<leader>u	UI	UI customization, layout adjustments
<leader>w	Wiki-Notes    Wiki-related actions (e.g., navigation, linking, exporting)
<leader>x	Diagnostics	Error and quickfix handling (e.g., Trouble)
[ and ]	Navigation	Previous/Next actions (e.g., buffer cycling, hunks, errors)
g	Goto	Go to definitions, implementations, references
z	Folds	Folding-related keymaps
---

# NOTEBOOK (wiki)

 MODE  LHS                 RHS ~
---
  `n`     <leader>ww          |<plug>(wiki-index)|                 [GLOBAL]
  `n`     <leader>w<leader>w  |<plug>(wiki-journal)|               [GLOBAL]
  `n`     <leader>wn          |<plug>(wiki-open)|                  [GLOBAL]
  `n`     <leader>wx          |<plug>(wiki-reload)|                [GLOBAL]
  `n`     <leader>wgb         |<plug>(wiki-graph-find-backlinks)|
  `n`     <leader>wgr         |<plug>(wiki-graph-related)|
  `n`     <leader>wgc         |<plug>(wiki-graph-check-links)|
  `n`     <leader>wgC         |<plug>(wiki-graph-check-links-g)|
  `n`     <leader>wgO         |<plug>(wiki-graph-check-orphans)|
  `n`     <leader>wgi         |<plug>(wiki-graph-in)|
  `n`     <leader>wgo         |<plug>(wiki-graph-out)|
  `n`     <leader>wf          |<plug>(wiki-link-transform)|
  `n`     <leader>wd          |<plug>(wiki-page-delete)|
  `n`     <leader>wr          |<plug>(wiki-page-rename)|
  `n`     <leader>wt          |<plug>(wiki-toc-generate)|
  `n`     <leader>wT          |<plug>(wiki-toc-generate-local)|
  `n`     <leader>wp          |<plug>(wiki-export)|
  `x`     <leader>wp          |<plug>(wiki-export)|
  `n`     <leader>wll         |<plug>(wiki-link-show)|
  `n`     <leader>wlh         |<plug>(wiki-link-extract-header)|
  `x`     <leader>wlh         |<plug>(wiki-link-extract-header)|
  `n`     <leader>wli         |<plug>(wiki-link-incoming-toggle)|
  `n`     <leader>wlI         |<plug>(wiki-link-incoming-hover)|
  `n`     <leader>wsl         |<plug>(wiki-tag-list)|
  `n`     <leader>wsr         |<plug>(wiki-tag-reload)|
  `n`     <leader>wsn         |<plug>(wiki-tag-rename)|
  `n`     <leader>wss         |<plug>(wiki-tag-search)|
  `nx`    <leader>wa          |<plug>(wiki-link-add)|
  `i`     <c-q>               |<plug>(wiki-link-add)|
  `n`     <leader>wlr         |<plug>(wiki-link-remove)|
  `n`     <tab>               |<plug>(wiki-link-next)|
  `n`     <s-tab>             |<plug>(wiki-link-prev)|
  `n`     <cr>                |<plug>(wiki-link-follow)|
  `n`     <c-w><cr>           |<plug>(wiki-link-follow-split)|
  `n`     <c-w><tab>          |<plug>(wiki-link-follow-vsplit)|
  `n`     <c-w>u              |<plug>(wiki-link-follow-tab)|
  `n`     <bs>                |<plug>(wiki-link-return)|
  `n`     gl                  |<plug>(wiki-link-transform-operator)|
  `x`     <cr>                |<plug>(wiki-link-transform-visual)|
  `ox`    au                  |<plug>(wiki-au)|
  `ox`    iu                  |<plug>(wiki-iu)|
  `ox`    at                  |<plug>(wiki-at)|
  `ox`    it                  |<plug>(wiki-it)|
  `n`     <c-p>               |<plug>(wiki-journal-prev)|          [JOURNAL]
  `n`     <c-n>               |<plug>(wiki-journal-next)|          [JOURNAL]
  `n`     <leader><c-n>       |<plug>(wiki-journal-copy-tonext)|   [JOURNAL]
  `n`     <leader>wu          |<plug>(wiki-journal-toweek)|        [JOURNAL]
  `n`     <leader>wm          |<plug>(wiki-journal-tomonth)|       [JOURNAL]

---

# Keybindings

## Leader Key

- **Leader Key**: `<Space>` is set as the leader key.

---
---
## Buffer Navigation (Normal Mode)

- `<Tab>`: Cycle to the next buffer.
- `<S-Tab>`: Cycle to the previous buffer.
- `<Leader>bd`: Delete the current buffer.
- `<Leader>tt`: Open a new tab.

---

## Comment Keybindings (Normal and Visual Mode)

- `gcc`: Toggle comment for the current line.
- `gc`: Toggle comment for the current selection.

---

## Formatting Keybindings (Normal Mode)

- `<Leader>f`: Format the current buffer.
- `<leader>gf`: Format the current buffer using LSP.

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

## Mini.ai Keybindings (Text Objects)

### Main Textobject Prefixes

- `a`: Select **around** the text object (including surrounding characters).
- `i`: Select **inside** the text object (excluding surrounding characters).

### Text Object Keybindings (Visual Mode)

- `` `vib` ``: Highlight text inside brackets `[(])`.
- `` `viB` ``: Highlight text inside curly brackets `{}`.
---
- `` `vil` ``: Highlight text inside the last selected text object.
- `` `vin` ``: Highlight text inside the next text object.
- `` `vip` ``: Highlight text inside the current paragraph.
- `` `vis` ``: Highlight text inside the current sentence.
- `` `vit` ``: Highlight text inside the current tag block.
- `` `viw` ``: Highlight text inside the current word.
- `` `viW` ``: Highlight text inside the current WORD.
- `` `vi\"` ``: Highlight text inside double quotes `" "`.
- `` `vi'` ``: Highlight text inside single quotes `' '`.
- `` `vi(` ``: Highlight text inside parentheses `[(])`.
- `` `vi)` ``: Highlight text inside parentheses `[(])`.
- `` `vi>` ``: Highlight text inside angle brackets `<>`.
- `` `vi[` ``: Highlight text inside square brackets `[]`.
- `` `vi]` ``: Highlight text inside square brackets `[]`.
- `` `vi\` ``: Highlight text inside escaped string `\ string`.
- `` `vi{` ``: Highlight text inside curly braces `{}`.
- `` `vi}` ``: Highlight text inside double curly braces `{{}}`.

## Around Text Object Keybindings (Visual Mode)

- `` `vab` ``: Highlight around `[(])` block.
- `` `vaB` ``: Highlight around `{}` block.
---
- `` `val` ``: Highlight around the last selected text object.
- `` `van` ``: Highlight around the next text object.
- `` `vap` ``: Highlight around the current paragraph.
- `` `vas` ``: Highlight around the current sentence.
- `` `vat` ``: Highlight around the current tag block.
- `` `vaw` ``: Highlight around the current word (including whitespace).
- `` `vaW` ``: Highlight around the current WORD (including whitespace).
- `` `va%` ``: Highlight around a `MatchitVisualTextObject`.
- `` `va\"` ``: Highlight around double quotes `" "`.
- `` `va'` ``: Highlight around single quotes `' '`.
- `` `va(` ``: Highlight around parentheses `[(])`.
- `` `va)` ``: Highlight around parentheses `[(])`.
- `` `va<` ``: Highlight around angle brackets `<>`.
- `` `va>` ``: Highlight around angle brackets `<>`.
- `` `va[` ``: Highlight around square brackets `[]`.
- `` `va]` ``: Highlight around square brackets `[]`.
- `` `va\` ``: Highlight around escaped string `\ string`.
- `` `va{` ``: Highlight around curly braces `{}`.
- `` `va}` ``: Highlight around double curly braces `{{}}`.

### Built-in Text Objects

- **Pairs**: `(`, `)`, `{`, `}`, `[`, `]`, `<`, `>`, `'`, `"`, `` ` ``, `t` (XML/HTML tags).
- **Words**: `w` (word), `W` (WORD).
- **Sentences**: `s`.
- **Paragraphs**: `p`.
- **Quotes**: `'`, `"`, `` ` ``.
- **Arguments**: `a` (for function arguments).
- **Function Calls**: `f`.
- **XML/HTML Tags**: `t`.

---

## LSP Keybindings (Normal Mode)

- `gd`: Go to the definition of the symbol under the cursor.
- `gD`: Go to the declaration of the symbol under the cursor.
- `gi`: Go to the implementation of the symbol under the cursor.
- `gr`: Show references for the symbol under the cursor.
- `<Leader>ca`: Open code actions.
- `<Leader>rn`: Rename the symbol under the cursor.
- `K`: Show hover information for the symbol under the cursor.
- **Insert Mode**:
  - `<C-s>`: Show signature help.

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

## Git-related Telescope Keybindings (Normal Mode)

- `<Leader>gp`: Search Git files.
- `<Leader>gc`: Search Git commits.
- `<Leader>gcf`: Search Git commits for the current file.
- `<Leader>gb`: Search Git branches.
- `<Leader>gs`: Search Git status (diff view).

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

## Obsidian Keybindings (Normal Mode)

- `<Leader>oo`: Change directory to `/home/lavan-de/Documents/BrainVault`.
- `<Leader>os`: Open Telescope to search files in `/home/lavan-de/Documents/BrainVault`.
- `<Leader>oz`: Open Telescope to live grep in `/home/lavan-de/Documents/BrainVault`.
- `<Leader>og`: Open Telescope to search for tags in `/home/lavan-de/Documents/BrainVault`.
- `gf`: Open the file under the cursor in a new buffer.
- `<leader>ch`: Toggle checkbox.

---

## Notes

- All keybindings are non-recursive (`noremap`) and silent (`silent`).
- Telescope extensions `fzf` and `ui-select` are enabled.
