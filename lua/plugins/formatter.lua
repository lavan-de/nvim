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
                        local clients = vim.lsp.get_aclients()
                        local formattingDartWithDcmls = false

                        -- Check if dcmls is attached
                        for _, c in ipairs(clients) do
                            if c.name == "dcmls" then
                                formattingDartWithDcmls = true
                                break -- No need to continue checking clients if dcmls is found
                            end
                        end

                        -- Return false for dart if dcmls is attached
                        if formattingDartWithDcmls and client.name == "dartls" then
                            return false
                        end

                        return true
                    end,
                })
            end
        end)
    end,
}
