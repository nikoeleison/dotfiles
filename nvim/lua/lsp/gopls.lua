local lspconfig = require('lspconfig')

return {
	setup = function(mixin)
		lspconfig['gopls'].setup {
			on_attach = mixin.on_attach,
			capabilities = mixin.capabilities,
			cmd = {'gopls'},
			filetypes = {'go', 'gomod', 'gowork', 'gotmpl'}
		}
	end
}
