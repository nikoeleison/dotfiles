local lspconfig = require('lspconfig')

return {
	setup = function(mixin)
		lspconfig['ts_ls'].setup {
			on_attach = mixin.on_attach,
			capabilities = mixin.capabilities,
			cmd = {'typescript-language-server', '--stdio'},
			filetypes = {
				'javascript',
				'javascriptreact',
				'javascript.jsx',
				'typescript',
				'typescriptreact',
				'typescript.tsx'
			}
		}
	end
}
