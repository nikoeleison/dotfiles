local lspconfig = require('lspconfig')

local LEMMINX_PATH = '/opt/ws/lemminx/0.26.1'

return {
	setup = function(mixin)
		lspconfig['lemminx'].setup {
			on_attach = mixin.on_attach,
			capabilities = mixin.capabilities,
			flags = mixin.flags,
			cmd = {LEMMINX_PATH .. '/lemminx-linux'},
			filetypes = {'xml', 'xsd', 'xsl', 'xslt', 'svg'}
		}
	end
}
