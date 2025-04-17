return {
    "akinsho/toggleterm.nvim",
    version = "*",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<leader>tt]],
            direction = "float",
            float_opts = {
                border = "curved",
            },
            close_on_exit = true,
        })

        -- Terminal mappings
        function _G.set_terminal_keymaps()
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0 })
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { buffer = 0 })
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { buffer = 0 })
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { buffer = 0 })
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { buffer = 0 })
            vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:ToggleTerm<CR>]], { buffer = 0, desc = "Close terminal" })
        end

        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            float_opts = {
                border = "curved",
            },
            on_open = function(term)
                vim.cmd("startinsert!")
            end,
        })

        function _G.lazygit_toggle()
            lazygit:toggle()
        end

        -- Simplified terminal command runner
        function _G.run_terminal_command()
            local Input = require("nui.input")
            local input = Input({
                position = "50%",
                size = {
                    width = 40,
                },
                border = {
                    style = "rounded",
                    text = {
                        top = " Terminal Command ",
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                },
            }, {
                prompt = "> ",
                default_value = "",
                on_submit = function(value)
                    if value and value ~= "" then
                        local term = Terminal:new({
                            cmd = value,
                            hidden = false,
                            direction = "float",
                            float_opts = {
                                border = "curved",
                            },
                        })
                        term:toggle()
                    end
                end,
            })

            input:mount()
        end

        -- Keymaps
        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
        vim.keymap.set("n", "<leader>tg", function() _G.lazygit_toggle() end, { desc = "Toggle lazygit" })
        vim.keymap.set("n", "<leader>tc", function() _G.run_terminal_command() end, { desc = "Run terminal command" })
        vim.keymap.set("n", "<leader>tq", "<cmd>ToggleTermToggleAll<cr>", { desc = "Close all terminals" })
    end,
}
