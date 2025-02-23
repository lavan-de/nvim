# https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
return {
    "mhartington/formatter.nvim",
    config = function()
        local settings = {
            lua = {
                require("formatter.filetypes.lua").stylua,
            },
            c = {
                require("formatter.filetypes.c").clangformat,
            },
            cpp = {
                require("formatter.filetypes.cpp").clangformat,
            },
            markdown = {
                require("formatter.filetypes.markdown").prettier,
            },
            sh = {
                require("formatter.filetypes.sh").shfmt,
            },
            ["*"] = {
                -- "formatter.filetypes.any" defines default configurations for any
                -- filetype
                require("formatter.filetypes.any").remove_trailing_whitespace,
            },
        }

        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = settings,
        })

        vim.keymap.set("n", "<leader>f", function()
            if settings[vim.bo.filetype] ~= nil then
                vim.cmd([[Format]])
            else
                vim.lsp.buf.format({
                    filter = function(client)
                        return true -- Simplified: Always allow formatting (no Dart checks)
                    end,
                })
            end
        end)
    end,
}
