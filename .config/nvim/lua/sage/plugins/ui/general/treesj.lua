return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = { "<space>tj" },

	config = function()
		require("treesj").setup({})
	end,
}
