return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash",
		},
		{
			"S",
			function()
				require("flash").treesitter()
			end,
			mode = { "n", "o", "x" },
			desc = "Flash Treesitter",
		},
		{
			"r",
			function()
				require("flash").remote()
			end,
			mode = "o",
			desc = "Remote Flash",
		},
		{
			"R",
			function()
				require("flash").treesitter_search()
			end,
			mode = { "n", "o", "x" },
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			function()
				require("flash").toggle()
			end,
			mode = { "c" },
			desc = "Toggle Flash Search",
		},
	},
	config = function()
		require("flash").setup({
			-- labels = "abcdefghijklmnopqrstuvwxyz",
			labels = "asdfghjklqwertyuiopzxcvbnm",
			search = {
				multi_window = true,
				forward = true,
				wrap = true,
				mode = "exact",
				incremental = false,
				exclude = {
					"notify",
					"cmp_menu",
					"noice",
					"flash_prompt",
					function(win)
						return not vim.api.nvim_win_get_config(win).focusable
					end,
				},
			},
		})
	end,
}

