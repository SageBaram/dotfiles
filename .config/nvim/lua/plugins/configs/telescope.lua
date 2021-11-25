local present, telescope = pcall(require, "telescope")
if not present then
    return
end

telescope.setup(
    {
        defaults = {
            mappings = {
                i = {
                        ["<C-x>"] = false,
                        ["<C-q>"] = require("telescope.actions").send_to_qflist,
                        ["<C-k>"] = require('telescope.actions').move_selection_previous,
                        ["<C-j>"] = require('telescope.actions').move_selection_next,
                }
            },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case"
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
                    results_width = 0.8
                },
                vertical = {
                    mirror = false
                },
                width = 0.87,
                height = 0.30,
                preview_cutoff = 120
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {".git", "node_modules"},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {"absolute"},
            winblend = 0,
            border = {},
            borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
            color_devicons = true,
            use_less = true,
            set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
)

require("telescope").load_extension("themes")
require("telescope").load_extension("ghq")


local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        cwd = "~/.config/nvim/",
        prompt_title = '< Dotfiles >',
        hidden = true,
    })
end

-- M.search_dotfiles = function()
--     local opts = {prompt_title = "< Dotfiles >", cwd = vim.env.DOTFILES, hidden = true}
--     require("telescope.builtin").find_files(opts)
-- end

-- M.grep_string_prompt = function()
--     local opts = {search = vim.fn.input("Grep for > ")}
--     require("telescope.builtin").grep_string(opts)
-- end

return M
