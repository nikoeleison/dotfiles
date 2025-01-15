local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		layout_config = {
			prompt_position = 'bottom',
		},
		sorting_strategy = 'descending',
		layout_strategy = 'bottom_pane',
		prompt_prefix = '>> ',
		borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
		mappings = {
			i = {
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
				['<C-h>'] = actions.preview_scrolling_up,
				['<C-l>'] = actions.preview_scrolling_down
			},
			n = {
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
				['<C-h>'] = actions.preview_scrolling_up,
				['<C-l>'] = actions.preview_scrolling_down
			}
		}
	}
}

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fF', builtin.git_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
