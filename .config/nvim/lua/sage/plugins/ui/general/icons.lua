return {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	config = function()
		require("nvim-web-devicons").setup({
			override_by_filename = {

				["Dockerfile"] = {
					icon = "",
					color = "#458ee6",
					cterm_color = "68",
					name = "Dockerfile",
				},

				["docker-compose.yaml"] = {
					icon = "",
					color = "#458ee6",
					cterm_color = "68",
					name = "Dockerfile",
				},

				[".dockerignore"] = {
					icon = "",
					color = "#458ee6",
					cterm_color = "68",
					name = "Dockerfile",
				},
				["svg"] = {
					icon = "",
					color = "#FFB13B",
					cterm_color = "214",
					name = "Svg",
				},
				[".env.*"] = {
					icon = "",
					color = "#faf743",
					cterm_color = "227",
					name = "Env",
				},
			},
		})
	end,
}
