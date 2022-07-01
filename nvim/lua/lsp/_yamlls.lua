local lspconfig = require('lspconfig')

return {
  Setup = function(mixin)
    lspconfig['yamlls'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = mixin.flags,
      settings = {
        yaml = {
          format = {
            enable = true,
            singleQuote = true,
          },
          completion = true,
        },
      },
      filetypes = {
        'yml',
        'yaml',
      },
    }
  end
}
