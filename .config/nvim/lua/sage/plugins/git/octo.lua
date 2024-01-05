return {
	{
		"pwntester/octo.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>O", "<cmd>Octo<CR>", desc = "Octo" },
		},
		config = function()
			require("octo").setup({
				enable_builtin = true,
				ssh_aliasses = {
					["github.com-career"] = "github.com",
					["github.com-personal"] = "github.com",
				},
				vim.cmd([[hi OctoEditable guibg=none]]),
			})
		end,
	},
}
