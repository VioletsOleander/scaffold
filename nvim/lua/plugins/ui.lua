return {
	-- Colorscheme
	{
		"olimorris/onedarkpro.nvim",
		cond = not vim.g.vscode,
		priority = 1000,
		config = function()
			local custom_colors = {
				fg = "#2a2c33",
				bg = "#fafafa",
				black = "#2a2c33",
				blue = "#2f5af3",
				cyan = "#048a81",
				green = "#3f953a",
				purple = "#950095",
				red = "#d04239",
				white = "#fafafa",
				yellow = "#a77301",
				orange = "#986801",
				highlight = "#ededed",
				comment = "#a0a1a7",
			}

			require("onedarkpro").setup({ colors = custom_colors })
			vim.cmd("colorscheme onelight")
		end,
	},
	{
		"folke/tokyonight.nvim",
		cond = not vim.g.vscode,
		priority = 1000,
		opts = {},
		lazy = true,
	},
	{
		"sainnhe/gruvbox-material",
		cond = not vim.g.vscode,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_better_performance = 1
			vim.opt.background = "light"
		end,
		lazy = true,
	},
	-- Statusline
	{
		"nvim-treesitter/nvim-treesitter-context",
		cond = not vim.g.vscode,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		event = { "BufReadPost", "BufNewFile" },
	},
}
