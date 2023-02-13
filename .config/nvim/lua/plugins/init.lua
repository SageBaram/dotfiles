local _packer, packer = pcall(require, "plugins.bootstrap")
if not _packer then
	return false
end

return packer.startup(function(use)
	-- Faster startup speeds
	use({ "lewis6991/impatient.nvim" })

	-- Plugin manager
	use({ "wbthomason/packer.nvim" })

	-- UI & Colors, icons
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("plugins.configs.colorscheme")
		end,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("plugins.configs.icons")
		end,
	}) -- NOTE: requires nerd font }

	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.alpha")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		after = "catppuccin",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.configs.lualine")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.configs.others").blankline()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		ft = { "css", "javascript", "html", "reactjavascript", "markdown" },
		config = function()
			require("plugins.configs.others").colorizer()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		keys = { { "n", "<C-t>" }, { "n", "<leader>gt" } },
		config = function()
			require("plugins.configs.terminal")
		end,
		tag = "*",
	})

	-- Lsp related
	use({ "folke/neodev.nvim" })

	use({
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"jayp0521/mason-null-ls.nvim",
			"jayp0521/mason-nvim-dap.nvim",
		},
		event = "CursorMoved",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		module = "nvim-lspconfig",
		after = "mason.nvim",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	})

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "BufRead",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.lspsaga")
		end,
		requires = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	})

	-- Completion engine & Snippets
	use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })

	use({
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
		config = function()
			require("plugins.configs.cmp")
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		run = "make install_jsregexp",
		config = function()
			require("plugins.configs.luasnip")
		end,
	})

	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.autopairs")
		end,
	})
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "cmp-nvim-lsp" })
	use({ "bydlw98/cmp-env", after = "nvim-cmp" })
	use({ "dcampos/cmp-emmet-vim", after = "nvim-cmp" })

	-- File navigation & fuzzy finder
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		cmd = "NvimTreeToggle",
		config = function()
			require("plugins.configs.nvimtree")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
		config = function()
			require("plugins.configs.telescope")
		end,
	})

	use({
		"theprimeagen/harpoon",
		config = function()
			require("plugins.configs.harpoon")
		end,
	})

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				manual_mode = true,
				show_hidden = true,
			})
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.configs.trouble")
		end,
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		keys = { "n", "<leader>b" },
		config = function()
			require("plugins.configs.dap")
		end,
		requires = { "mfussenegger/nvim-dap-python", "theHamsta/nvim-dap-virtual-text" },
	})

	use({
		"rcarriga/nvim-dap-ui",
		keys = { "n", "<leader>du" },
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("plugins.configs.dapui")
		end,
	})

	-- Testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("plugins.configs.neotest")
		end,
	})

	-- Formatting and linting

	use({
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.null_ls")
		end,
	})

	-- Git related

	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-rhubarb" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.configs.signs")
		end,
	})
	use({
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	})

	-- Essentials
	use({ "mbbill/undotree", keys = { "n", "<leader>u" } })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-repeat" })
	use({ "andymass/vim-matchup", event = "CursorMoved" })
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		branch = "main",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	-- Commenting and documentation
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.configs.comment")
		end,
	})

	use({
		"danymat/neogen",
		config = function()
			require("plugins.configs.neogen")
		end,
		requires = "nvim-treesitter/nvim-treesitter",
		tag = "*",
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		cmd = "MarkdownPreview",
		ft = "markdown",
		run = [[sh -c 'cd app && yarn install']],
	})

	use({
		"lukas-reineke/headlines.nvim",
		ft = { "markdown" },
		config = function()
			require("plugins.configs.headlines")
		end,
	})

	-- Emmet for html snippets
	use({
		"mattn/emmet-vim",
		ft = { "html", "javascript" },
		config = function()
			require("plugins.configs.emmet")
		end,
	})

	-- Tmux integeration
	use({
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup()
		end,
	})

	-- Discord integration
	use({
		"andweeb/presence.nvim",
		config = function()
			require("plugins.configs.others").presence()
		end,
	})

	use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
end)
