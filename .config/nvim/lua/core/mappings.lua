---@diagnostic disable: param-type-mismatch, missing-parameter
vim.g.mapleader = " " -- leader key keybinding map
local function map(mode, lhs, rhs, opts) -- keybinding convention
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable command history list on q:
map("n", "q:", "<nop>")
map("n", "Q", "<nop>")

-- stylua: ignore start
map("x", "<leader>p", "\"_dP")
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("v", "<leader>d", "\"_d")
map("n", "<leader>d", "\"_d")
-- stylua: ignore end

map("n", "<C-q>", ":lua require'core.functions'.toggle_quickfix()<CR>")
map("n", "<C-n>", ":cnext<CR>zz")
map("n", "<C-p>", ":cprev<CR>zz")
map("n", "<C-f>", ":lnext<CR>zz")
map("n", "<C-b>", ":lprev<CR>zz")

-- Cursor standstill
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Moving lines faster with J & K
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<leader>j", ":m .+1<CR>==")
map("n", "<leader>k", ":m .-2<CR>==")

vim.keymap.set("n", "<leader>/", ":%s/<C-r><C-w>//gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>?", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>")
map("n", "<leader>ch", ":!chmod +x %<CR>")

-- Better undo - undos to punctuation
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- Use ESC to turn off search highlighting
map("n", "<Esc>", ":noh<CR>")

-- Harpoon

-- Fugitive
map("n", "<leader>gs", ":Git<CR>")
map("n", "gdf", ":diffget //2<CR>")
map("n", "gdj", ":diffget //3<CR>")
map("n", "<leader>gb", ":GBrowse<CR>")
map("n", "<leader>gv", ":Gdiff<CR>")

map("n", "<Leader>'", ":lua require('neogen').generate()<CR>")

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- Telescope
vim.api.nvim_create_user_command("Dotfiles", function()
	require("telescope.builtin").find_files({ cwd = "~/.config/", prompt_title = "< Dotfiles >", hidden = true })
end, {})
vim.keymap.set("n", "<leader>rc", ":Dotfiles<CR>")

vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>gc", function()
	require("telescope.builtin").git_commits()
end, {})
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, {})
vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, {})
vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, {})
vim.keymap.set("n", "<leader>fw", function()
	require("telescope.builtin").grep_string()
end, {})
vim.keymap.set("n", "<C-g><C-g>", function()
	require("telescope.builtin").git_files()
end, {})
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, {})
vim.keymap.set("n", "<leader>fG", function()
	require("telescope").extensions.live_grep_args.live_grep_args({ prompt_title = " < Live Rip Grep >" })
end, {})
vim.keymap.set("n", "<leader>fr", function()
	require("telescope").extensions.file_browser.file_browser()
end, {})
vim.keymap.set("n", "<leader>fp", function()
	require("telescope").extensions.projects.projects()
end, { silent = true })

-- Nvim Tree
map("n", "<leader>n", ":NvimTreeToggle<CR>")

-- Trouble
map("n", "<leader>xx", "<Cmd>TroubleToggle<CR>")
map("n", "<leader>xw", "<Cmd>TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xd", "<Cmd>TroubleToggle document_diagnostics<CR>")
map("n", "<leader>xl", "<Cmd>TroubleToggle loclist<CR>")
map("n", "<leader>xq", "<Cmd>TroubleToggle quickfix<CR>")
map("n", "<leader>gR", "<Cmd>TroubleToggle lsp_references<CR>")

-- Lspsaga
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
map("n", "gr", "<Cmd>Lspsaga lsp_finder<CR>")

-- Code action
map("v", "<leader>ca", "<Cmd>Lspsaga code_action<CR>")
map("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>")

map("n", "rn", "<Cmd>Lspsaga rename<CR>")
map("n", "<leader>rn", "<cmd>Lspsaga rename ++project<CR>")

-- Outline
map("n", "<leader>o", "<Cmd>Lspsaga outline<CR>")

-- Hover Doc
map("n", "K", "<Cmd>Lspsaga hover_doc ++quiet<CR>")
map("n", "<leader>K", "<Cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
map("n", "gj", "<Cmd>Lspsaga peek_definition<CR>")
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
map("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-- Show buffer diagnostics
-- Diagnostic jump can use `<c-o>` to jump back
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

map("n", "[e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", "<Cmd>Lspsaga diagnostic_jump_next<CR>")

-- Only jump to error
vim.keymap.set("n", "[d", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]d", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- DAP
vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end, {})
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
end, {})
vim.keymap.set("n", "<leader>dn", function()
	require("dap").step_over()
end, {})
vim.keymap.set("n", "<leader>di", function()
	require("dap").step_into()
end, {})
vim.keymap.set("n", "<leader>do", function()
	require("dap").step_out()
end, {})
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, {})
vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, {})
vim.keymap.set("n", "<leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, {})
vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.toggle()
end, {})

-- GIT SIGNS
--
local gs = package.loaded.gitsigns
vim.keymap.set("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		gs.next_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

vim.keymap.set("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		gs.prev_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

-- Actions
map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>hS", ":Gitsigns stage_buffer<CR>")
map("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
map("n", "<leader>hR", ":Gitsigns reset_buffer<CR>")
map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>hd", ":Gitsigns diffthis<CR>")
map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>")

vim.keymap.set("n", "<leader>hb", function()
	gs.blame_line({ full = true })
end)
vim.keymap.set("n", "<leader>hB", function()
	gs.diffthis("~")
end)
