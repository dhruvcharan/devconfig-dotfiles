return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<leader>tt]],
			direction = "float",
			float_opts = {
				border = "curved",
			},
		})

		-- Terminal mappings
		function _G.set_terminal_keymaps()
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0 })
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { buffer = 0 })
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { buffer = 0 })
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { buffer = 0 })
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { buffer = 0 })
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
