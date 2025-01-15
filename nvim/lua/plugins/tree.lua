require('nvim-tree').setup {
	hijack_cursor = true,
	view = {
		adaptive_size = true
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		indent_markers = {
			enable = true
		},
		icons = {
			glyphs = {
				git = {
					unstaged = '~',
					staged = '+',
					unmerged = '=',
					renamed = '>',
					untracked = '*',
					deleted = '-',
					ignored = '!'
				}
			}
		}
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true
	}
}

vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
