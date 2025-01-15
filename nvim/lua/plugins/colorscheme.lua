require('tokyonight').setup {
	transparent = true,
	styles = {
		sidebars = 'transparent',
		floats = 'dark'
	},
	sidebars = { 'packer', 'cmp' }
}

vim.cmd [[colorscheme tokyonight-storm]]

--vim.cmd [[colorscheme midnight]]
--require('transparent')
