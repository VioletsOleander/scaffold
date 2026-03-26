return {
	-- Colorscheme
	{
		"olimorris/onedarkpro.nvim",
		cond = not vim.g.vscode,
		priority = 1000,
		config = function()
			local custom_colors = {
				onelight = {
					fg = "#2a2c33",
					bg = "#fafafa",
					black = "#000000",
					blue = "#2f5af3",
					cyan = "#078378",
					green = "#378433",
					purple = "#950095",
					red = "#d04239",
					white = "#ffffff",
					yellow = "#867109",
					orange = "#bc6b0b",
					gray = "#747681",
					highlight = "#e8e9ed",
					comment = "#747681",
				},
			}
			local custom_highlights = {
				Cursor = { fg = "#ffffff", bg = "#4b73ec" },
			}

			require("onedarkpro").setup({ colors = custom_colors, highlights = custom_highlights })
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
