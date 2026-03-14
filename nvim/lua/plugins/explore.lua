return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		cond = not vim.g.vscode,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = {
			defaults = {
				mappings = {
					["i"] = {
						["jj"] = { "<Esc>", type = "command" },
						["<Leader>c"] = "close",
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Leader>h"] = "select_horizontal",
						["<Leader>v"] = "select_vertical",
					},
					["n"] = {
						["<Leader>c"] = "close",
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Leader>h"] = "select_horizontal",
						["<Leader>v"] = "select_vertical",
					},
				},
			},
		},
		cmd = "Telescope",
		keys = {
			{
				"<Leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<Leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<Leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<Leader>fo",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Previously Opened Files",
			},
			{
				"<Leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help Tags",
			},
			{
				"<Leader>fH",
				function()
					require("telescope.builtin").live_grep({
						search_dirs = vim.api.nvim_get_runtime_file("doc/*.txt", true),
					})
				end,
				desc = "Live Grep Help",
			},
			{
				"<Leader>fq",
				function()
					require("telescope.builtin").quickfix()
				end,
				desc = "Quickfix List",
			},
			{
				"<Leader>fj",
				function()
					require("telescope.builtin").jumplist()
				end,
				desc = "Jump Lists",
			},
			{
				"<Leader>fc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Commands",
			},
			{
				"<Leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<Leader>fd",
				function()
					require("telescope.builtin").diagnostics({ bufnr = 0 })
				end,
				desc = "Show Diagnostics in Current Buffer",
			},
			{
				"<Leader>fD",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Show Diagnostics in Workspace",
			},
			{
				"<Leader>fs",
				function()
					require("telescope.builtin").spell_suggest()
				end,
				desc = "Spell Suggestions",
			},
			{
				"gd",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "Go to Definition",
			},
			{
				"gr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "Show References",
			},
			{
				"gi",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "Go to Implementation",
			},
			{
				"gy",
				function()
					require("telescope.builtin").lsp_type_definitions()
				end,
				desc = "Go to Type Definition",
			},
			{
				"<Leader>ss",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Document Symbols",
			},
			{
				"<Leader>sw",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},
		},
	},
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		cond = not vim.g.vscode,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			open_for_directories = true,
			keymaps = {
				show_help = "?",
				-- open_file_in_vertical_split = "<Leader>v",
				-- open_file_in_horizontal_split = "<Leader>h",
			},
		},
		keys = {
			{
				"<Leader>-", -- <Leader> -
				mode = { "n", "v" },
				function()
					vim.cmd("Yazi")
				end,
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<Leader>=", -- <Leader> =
				function()
					vim.cmd("Yazi cwd")
				end,
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<Leader>e",
				function()
					vim.cmd("Yazi toggle")
				end,
				desc = "Toggle Yazi for exploration, last yazi session will be resumed if exists",
			},
		},
	},
}
