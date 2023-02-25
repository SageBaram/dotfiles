-------------------- HELPERS -------------------------------
local g = vim.g -- a table to set global variables
local o = vim.opt -- a table to set option variables
local bo = vim.bo -- a table to set buffer specific option variables
local wo = vim.wo -- a table to set window specific option variables
local env = vim.env -- vim environment api
-----------------------------------------------------------------
bo.autoindent = true -- figures out how to indent.
bo.smartindent = true -- figures out when to indent.
bo.expandtab = true
wo.number = true -- show row current line.
wo.relativenumber = true -- show relative numbers above/below current row.
o.autoread = true -- read file when switching buffer.
o.autowrite = true -- write file when switching buffer.
o.backup = false -- disable backupfile generator.
o.clipboard = "" -- clipboard settings for my os (darwin)
o.cmdheight = 1 -- command prompt height.
o.colorcolumn = "80"
o.completeopt = "menuone,noinsert,noselect" -- complete option menu.
o.cursorline = false -- highlights the line on cursor.
o.diffopt = "vertical" -- opens git diff in vertical split.
o.encoding = "utf-8" -- encoding settings.
o.errorbells = false -- avoids screen flashes.
o.fileencodings = "utf-8" -- encoding buffer settings.
o.fillchars = { eob = " " } -- avoid trailing whitespace
o.hidden = true -- navigate to other buffers without saving current.
o.hlsearch = true -- highlights search
o.ignorecase = true -- the case of normal letters is ignored.
o.inccommand = "split" -- incremental subtitution
o.incsearch = true -- incremental search.
o.keywordprg = ":help" -- open help with 'K'.
o.lazyredraw = true -- good performance settings.
o.mouse = "a" -- enable mouse
o.scrolloff = 10 -- keep 'n' lines visible when scrolling.
o.showcmd = true -- shows command on the right side of the command prompt.
o.showmode = false -- avoids hl messages in different modes.
o.smartcase = true -- overrides ignorecase if search includes uppercase letters.
o.spelllang = "en_us" -- set spelling to english
o.splitbelow = true -- horizontal splits below.
o.splitright = true -- veritcal splits to the right.
o.swapfile = false -- disable swapfile generator.
o.termguicolors = true -- use the terminal gui colors.
o.timeoutlen = 350 -- timeout before key refresh.
o.ttyfast = true
o.undofile = true -- disable undofile generator.
o.updatetime = 50 -- update interval for gitsigns.
o.laststatus=3
vim.cmd([[setlocal formatoptions-=cro]]) -- disable comment continouation in next line
o.path:append({ "**" }) -- file paths, searching and ignores
o.wildignore:append({
	"*/node_modules/*",
	"*.pyc",
	"*.DS_Store",
	"*.jpg",
	"*.bmp",
	"*.gif",
	"*.png",
	"*.jpeg",
	"versions/*",
	"cache/*",
})

o.suffixesadd:append({
	".html",
	".js",
	".es",
	".jsx",
	".json",
	".css",
	".sass",
	".py",
	".md",
	".java",
	".c",
	".cpp",
})

vim.opt.undodir = vim.fn.expand("$XDG_CACHE_HOME/nvim/undodir/")
o.dictionary = "/usr/share/dict/words"

o.signcolumn = "yes"
wo.wrap = false

-- providers
g.python3_host_prog = "$PYENV_ROOT/shims/python"
g.python2_host_prog = "/usr/bin/python2"

-- env.PATH = vim.fn.expand("$XDG_DATA_HOME/nvim/mason/bin")
env.GIT_WORK_TREE = vim.fn.expand("$HOME")
env.GIT_DIR = vim.fn.expand("$HOME/.cfg")

local disabled_built_ins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
