local _headlines, headlines = pcall(require, "headlines")
if not _headlines then
	return
end

vim.cmd([[highlight Headline1 guibg=#0081C9 ]])
vim.cmd([[highlight Headline1 guifg=#ffffff ]])
vim.cmd([[highlight Headline2 guibg=#5BC0F8 ]])
vim.cmd([[highlight Headline2 guifg=#ffffff ]])
vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
vim.cmd([[highlight Dash guibg=#FFC93C gui=bold]])

headlines.setup({
	markdown = {
		query = vim.treesitter.parse_query(
			"markdown",
			[[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @headline)

                (thematic_break) @dash

                (fenced_code_block) @codeblock

                (block_quote_marker) @quote
                (block_quote (paragraph (inline (block_continuation) @quote)))
            ]]
		),
		headline_highlights = { "Headline1", "Headline2" },
		codeblock_highlight = "CodeBlock",
		dash_highlight = "Dash",
		dash_string = "-",
		quote_highlight = "Quote",
		quote_string = "┃",
		fat_headlines = false,
		fat_headline_upper_string = "▃",
		-- fat_headline_lower_string = "",
	},
})
