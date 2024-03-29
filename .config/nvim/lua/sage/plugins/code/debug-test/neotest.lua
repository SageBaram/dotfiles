return {
	"nvim-neotest/neotest",
	cmd = "Neotest",
	dependencies = {
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-python",
		"haydenmeade/neotest-jest",
	},
	config = function()
		local status, neotest = pcall(require, "neotest")
		if not status then
			return
		end

		neotest.setup({
			adapters = {
				require("neotest-python")({
					runner = "pytest",
					dap = { justMyCode = false },
				}),
				require("neotest-jest")({
					jestCommand = "npm run test --",
					jestConfigFile = function()
						local file = vim.fn.expand("%:p")
						if string.find(file, "/packages/") then
							return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
						end

						return vim.fn.getcwd() .. "/jest.config.js"
					end,
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
