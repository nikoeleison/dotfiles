local lspconfig = require('lspconfig')

return {
	setup = function(mixin)
		lspconfig['volar'].setup {
			on_attach = mixin.on_attach,
			capabilities = mixin.capabilities,
			cmd = {'vue-language-server', '--stdio'},
			init_options = {
				vue = {
					hybridMode = false
				},
				typescript = {
					tsdk = '/home/nikoeleison/.nvm/versions/node/v21.6.2/lib/node_modules/typescript/lib'
				}
			},
			filetypes = {'vue'}
		}
	end
}
