local lspconfig = require('lspconfig')

return {
  Setup = function(mixin)
    lspconfig['cssls'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = mixin.flags,
      filetypes = { 
        'css',
        'scss',
        'less',
      },
    }
  end
}
