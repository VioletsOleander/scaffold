if not vim.g.vscode then
	local au = vim.api.nvim_create_autocmd
	local function augroup(name)
		return vim.api.nvim_create_augroup("user." .. name, { clear = true })
	end

	-- Completion
	local completion_group = augroup("completion")
	-- cmdline autocompletion
	au("CmdlineChanged", {
		group = completion_group,
		pattern = { ":", "/", "?" },
		callback = function()
			vim.fn.wildtrigger()
		end,
		desc = "Automatically show popup menu when typing in cmd line",
	})

	local lsp_group = augroup("lsp")
	-- set kemaps when lsp attaches to buffer
	au("LspAttach", {
		group = lsp_group,
		pattern = "*",
		callback = function(event)
			local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
			if client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
			end

			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			local buf = vim.lsp.buf
			map("n", "gD", buf.declaration, "Go to Declaration")

			map("n", "K", buf.hover, "Hover Documentation")
			map("i", "<C-k>", buf.signature_help, "Signature Help")

			map("n", "<Leader>r", buf.rename, "Rename Symbol")
			map({ "n", "v" }, "<Leader>a", buf.code_action, "Code Action")

			local diagnostic = vim.diagnostic
			map("n", "<Leader>cd", diagnostic.open_float, "Show Line Diagnostics")
			map("n", "[d", function()
				diagnostic.jump({ count = 1, float = true })
			end, "Prev Diagnostic")
			map("n", "]d", function()
				diagnostic.jump({ count = -1, float = true })
			end, "Next Diagnostic")
		end,
	})
end
