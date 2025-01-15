require('gitsigns').setup {
	current_line_blame = false,
	current_line_blame_opts = {
		delay = 500
	}
}

vim.keymap.set('n', '<leader>gg', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '<leader>gG', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>gS', ':Gitsigns undo_stage_hunk<CR>')
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>')
vim.keymap.set('n', '<leader>gB', ':Gitsigns toggle_current_line_blame<CR>')
vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>')
