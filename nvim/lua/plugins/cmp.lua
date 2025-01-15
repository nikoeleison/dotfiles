local cmp = require('cmp')

cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert{
		['<C-h>'] = cmp.mapping.scroll_docs(-4),
		['<C-l>'] = cmp.mapping.scroll_docs(4),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}
	},
	sources = cmp.config.sources{
		{name = 'nvim_lsp'},
		{name = 'vsnip'}
	}
}
