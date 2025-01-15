require('lualine').setup {
	options = {
		ignore_focus = {
			'packer',
			'NvimTree'
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {{'filename', path = 2}},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {{'filename', path = 2}},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = {{'buffers', mode = 2}},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {'filesize'},
		lualine_z = {'tabs'}
	}
}
