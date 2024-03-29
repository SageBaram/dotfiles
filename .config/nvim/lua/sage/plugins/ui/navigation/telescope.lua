return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
	config = function()
		local present, telescope = pcall(require, "telescope")
		if not present then
			return
		end

		local actions = require("telescope.actions")
		local sorters = require("telescope.sorters")
		local previewers = require("telescope.previewers")
		local trouble_providers = require("trouble.providers.telescope")
		local live_grep_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = actions.send_to_qflist,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-t>"] = trouble_providers.open_with_trouble,
					},
					n = {
						["<C-q>"] = actions.send_to_qflist,
						["<C-t>"] = trouble_providers.open_with_trouble,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.30,
					preview_cutoff = 120,
				},
				file_sorter = sorters.get_fuzzy_file,
				generic_sorter = sorters.get_generic_fuzzy_sorter,
				file_ignore_patterns = {
					"^.git",
					"node_modules",
					"build",
					".cache",
					".DS_Store",
				},
				path_display = { "absolute" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = previewers.vim_buffer_cat.new,
				grep_previewer = previewers.vim_buffer_vimgrep.new,
				qflist_previewer = previewers.vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = previewers.buffer_previewer_maker,
			},
			-- pickers = {
			-- 	find_files = {
			-- 		no_ignore = true,
			-- 		hidden = true,
			-- 	},
			-- },
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-k>"] = live_grep_actions.quote_prompt(),
							["<C-i>"] = live_grep_actions.quote_prompt({
								postfix = " --iglob",
							}),
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("harpoon")
	end,
}
