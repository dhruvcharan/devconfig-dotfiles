return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"ahmedkhalf/project.nvim",
		"folke/trouble.nvim", -- For integrating with Trouble
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("projects")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fC", "<cmd>Telescope colorscheme<cr>", { desc = "Find colorscheme" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })
		keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "Find changed git files" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Find diagnostics" })
		keymap.set("n", "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in current buffer" })
		keymap.set("n", "<leader>f?", "<cmd>Telescope commands<cr>", { desc = "Find commands" })
		keymap.set("n", "<leader>f*", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
		keymap.set("n", "<leader>f:", "<cmd>Telescope commands<cr>", { desc = "Find commands" })
		keymap.set("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Find symbols in workspace" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs in project" })
		keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })

		-- Search in nvim config files
		local nvim_config_dir = "~/.config/nvim"
		keymap.set("n", "<leader>fn", function()
			require("telescope.builtin").find_files({
				prompt_title = "Neovim Config",
				cwd = nvim_config_dir,
				hidden = true,
			})
		end, { desc = "Find in Neovim config" })

		-- Search for text in nvim config files
		keymap.set("n", "<leader>fN", function()
			require("telescope.builtin").live_grep({
				prompt_title = "Search in Neovim Config",
				cwd = nvim_config_dir,
			})
		end, { desc = "Search in Neovim config" })
	end,
}
