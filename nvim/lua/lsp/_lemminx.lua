local lspconfig = require('lspconfig')

local LEMMINX_PATH = vim.fn.stdpath('data') .. '/lsp_servers/lemminx-linux-0.19.1-541'

return {
  Setup = function(mixin)
    lspconfig['lemminx'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = mixin.flags,
      cmd = { LEMMINX_PATH .. '/lemminx-linux' },
      settings = {
        xml = {
          format = {
            splitAttributes = true,
            joinCDATALines = false,
            joinContentLines = false,
            joinCommentLines = false,
            spaceBeforeEmptyCloseTag = false,
            enabled = true
          }
        }
      },
      filetypes = { 'xml', 'xsd', 'xsl', 'xslt', 'svg' },
    }
  end
}
