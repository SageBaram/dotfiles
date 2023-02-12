local modules = {
	"core.options",
	"core.mappings",
	"core.utils",
	"core.functions",
	"core.commands",
}

local _impatient, impatient = pcall(require, "impatient")
if not _impatient then
	return false
end
impatient.enable_profile()

for _, module in ipairs(modules) do
	local pass, err = pcall(require, module)
	if not pass then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end
