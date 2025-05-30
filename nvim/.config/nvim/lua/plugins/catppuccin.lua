return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				treesitter = true,
				telescope = true,
				native_lsp = { enabled = true },
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				which_key = true,
				indent_blankline = { enabled = true },
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
