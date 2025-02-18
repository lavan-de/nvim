-- Treesitter does quite a bit, read up on it!
return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "cpp",
                "dart",
                "lua",
                "markdown",
                "markdown_inline",
                "javascript",
                "typescript",
                "json",
                "html",
                "css",
                "yaml",
                "bash",
                "python",
            },
            auto_install = true,
            highlight = {
                enable = true, -- false will disable the whole extension
            },
            indent = {
                enable = true,
                -- I have a couple of open issues for it though:
                -- https://github.com/nvim-treesitter/nvim-treesitter/issues?q=RobertBrunhage+is%3Aopen
                -- https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
                -- disable = { "dart" },
            },
        })
    end,
}
