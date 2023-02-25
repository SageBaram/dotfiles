---@diagnostic disable: param-type-mismatch
local M = {}

M.colorizer = function()
	local present, colorizer = pcall(require, "colorizer")

	if not present then
		return
	end

	local options = {
		filetypes = {
			"*",
		},
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- "Name" codes like Blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			rgb_fn = false, -- CSS rgb() and rgba() functions
			hsl_fn = false, -- CSS hsl() and hsla() functions
			css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			mode = "background", -- Set the display mode.
			virtualtext = "■",
		},
	}

	colorizer.setup(options)
	-- execute colorizer as soon as possible
	vim.defer_fn(function()
		require("colorizer").attach_to_buffer(0)
	end, 0)
	vim.cmd("ColorizerAttachToBuffer")
end

M.presence = function()
	local present, presence = pcall(require, "presence")
	if present then
		presence:setup({
			enable_line_number = true,
			main_image = "file",
			neovim_image_text = "Don't memorize what you can search for - Albert Einstein",
		})
	end
end

M.blankline = function()
	local present, blankline = pcall(require, "indent_blankline")
	if not present then
		return
	end
	local opts = {
		indentLine_enabled = 1,
		filetype_exclude = {
			"help",
			"terminal",
			"packer",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"mason",
			"",
		},
		buftype_exclude = { "terminal" },
		show_trailing_blankline_indent = true,
		show_first_indent_level = true,
		show_current_context = false,
		show_current_context_start = false,
		space_char_blankline = " ",
	}
	blankline.setup(opts)
end

M.undotree = function()
	vim.g.undotree_WindowLayout = 4
	vim.g.undotree_DiffpanelHeight = 20
end

return M
