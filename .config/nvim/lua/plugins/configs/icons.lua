local present, icons = pcall(require, "nvim-web-devicons")
if not present then
	return
end

local defaults = icons.get_icons()

local override = function(icon, name)
	return {
		name = defaults[name].name,
		color = defaults[name].color,
		cterm_color = defaults[name].cterm_color,
		icon = icon,
	}
end

icons.setup({
	override = {
		html = override("", "html"),
		css = override("", "css"),
		js = override("", "js"),
		ts = override("ﯤ", "ts"),
		png = override("", "png"),
		jpg = override("", "jpg"),
		jpeg = override("", "jpeg"),
		rb = override("", "rb"),
		vue = override("﵂", "vue"),
		py = override("", "py"),
		toml = override("", "toml"),
		lock = override("", "lock"),
		lua = override("", "lua"),
		md = override("", "markdown"),
		Dockerfile = override("", "Dockerfile"),
		-- zip = override("", "zip"),
		-- xz = override("", "xz"),
		-- mp3 = override("", "mp3"),
		-- mp4 = override("", "mp4"),
		-- out = override("", "out"),
		-- xlsx = override("", "excel"),
		-- csv = override("", "csv"),
		-- ipynb = override("", "ipynb"),
	},
})
