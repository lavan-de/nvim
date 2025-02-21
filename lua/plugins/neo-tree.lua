return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Setup Neo-tree with custom file types and icons
        require("neo-tree").setup({
            -- Define which sources to use (filesystem, git, buffers, etc.)
            sources = {
                "filesystem", -- This is the filesystem navigation source
                "git_status", -- This is for Git status (if needed)
            },

            -- Filesystem setup
            filesystem = {
                filtered_items = {
                    visible = true, -- Show hidden files
                    hide_dotfiles = false, -- Don't hide dotfiles
                    hide_gitignored = true, -- Hide git-ignored files
                },
                follow_current_file = {
                    enabled = true,    -- Automatically focus on the current file
                },
                group_empty_dirs = true, -- Group empty directories together
                hijack_netrw = true,   -- Hijack netrw's default file explorer
                use_libuv_file_watcher = true, -- Use a more efficient file watcher
            },

            -- Icon configuration (works with nvim-web-devicons)
            default_component_configs = {
                icon = {
                    folder_empty = "", -- Icon for empty folders
                    folder_closed = "", -- Icon for closed folders
                    folder_open = "", -- Icon for open folders
                    default = "", -- Default icon for unknown files
                    highlight = "NeoTreeFileIcon", -- Highlight for icons
                },
                name = {
                    highlight = "NeoTreeFileName", -- Highlight for file names
                },
            },

            -- Optional: Setup filetype overrides for known types like C, C++, Lua, Dart, and Markdown
            filetype = {
                ["c"] = "cpp",     -- Treat C files as C++
                ["cpp"] = "cpp",   -- C++ files
                ["lua"] = "lua",   -- Lua files
                ["dart"] = "dart", -- Dart files
                ["markdown"] = "markdown", -- Markdown files
            },

            -- Additional UI configuration
            window = {
                width = 30,            -- Adjust the width of the Neo-tree window
                mapping = {
                    ["<C-w>"] = "close_node", -- Close the current node with Ctrl+w
                    ["<C-e>"] = "expand_node", -- Expand the current node with Ctrl+e
                    ["<C-h>"] = "toggle_hidden", -- Toggle hidden files with Ctrl+h
                },
            },

            -- Enable file type icons (ensure nvim-web-devicons is installed)
            enable_git_status = true,
            enable_diagnostics = true, -- Enable diagnostics for supported file types
        })
    end,
}
