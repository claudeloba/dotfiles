return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local custom_mocha = {
			normal = {
				a = { fg = "#1e1e2e", bg = "#cba6f7", gui = "bold" },
				b = { fg = "#cdd6f4", bg = "#313244" },
				c = { fg = "#cdd6f4", bg = "#1e1e2e" },
			},
			insert = {
				a = { fg = "#1e1e2e", bg = "#a6e3a1", gui = "bold" },
				b = { fg = "#cdd6f4", bg = "#313244" },
				c = { fg = "#cdd6f4", bg = "#1e1e2e" },
			},
			visual = {
				a = { fg = "#1e1e2e", bg = "#89b4fa", gui = "bold" },
				b = { fg = "#cdd6f4", bg = "#313244" },
				c = { fg = "#cdd6f4", bg = "#1e1e2e" },
			},
			replace = {
				a = { fg = "#1e1e2e", bg = "#f38ba8", gui = "bold" },
				b = { fg = "#cdd6f4", bg = "#313244" },
				c = { fg = "#cdd6f4", bg = "#1e1e2e" },
			},
			command = {
				a = { fg = "#1e1e2e", bg = "#fab387", gui = "bold" },
				b = { fg = "#cdd6f4", bg = "#313244" },
				c = { fg = "#cdd6f4", bg = "#1e1e2e" },
			},
			inactive = {
				a = { fg = "#585b70", bg = "#1e1e2e" },
				b = { fg = "#585b70", bg = "#1e1e2e" },
				c = { fg = "#585b70", bg = "#1e1e2e" },
			},
		}
		require("lualine").setup({
			options = {
				theme = custom_mocha,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch" },
				lualine_c = {
					"%=", -- This centers the next components (currently empty placeholder)
				},
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
