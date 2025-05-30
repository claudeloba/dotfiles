return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", desc = "Telescope: Find files" },
			{ "<leader>fg", desc = "Telescope: Live grep" },
			{ "<leader>fb", desc = "Telescope: Buffers" },
			{ "<leader>fh", desc = "Telescope: Help tags" },
		},
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { width = 0.9 },
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
