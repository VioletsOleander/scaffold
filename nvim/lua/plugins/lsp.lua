return {
	{
		"stevearc/conform.nvim",
		cond = not vim.g.vscode,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				yaml = { "prettier" },
				toml = { "taplo" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		cond = not vim.g.vscode,
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}
