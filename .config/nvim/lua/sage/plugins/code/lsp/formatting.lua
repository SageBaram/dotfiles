return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local prettier_options = {
			config = ".prettierrc", -- Path to your .prettierrc file
		}

		conform.setup({
			formatters_by_ft = {
				javascript = { { cmd = "prettier", options = prettier_options } },
				typescript = { { cmd = "prettier", options = prettier_options } },
				javascriptreact = { { cmd = "prettier", options = prettier_options } },
				typescriptreact = { { cmd = "prettier", options = prettier_options } },
				css = { { cmd = "prettier", options = prettier_options } },
				html = { { cmd = "prettier", options = prettier_options } },
				json = { { cmd = "prettier", options = prettier_options } },
				markdown = { { cmd = "prettier", options = prettier_options } },
				lua = { "stylua" },
				python = { "black", "isort" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
