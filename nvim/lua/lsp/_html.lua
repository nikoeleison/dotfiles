local lspconfig = require('lspconfig')

return {
  Setup = function(mixin)
    lspconfig['html'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = mixin.flags,
      filetypes = { 
        'html',
      },
      configurationSection = { 'html', 'css', 'javascript' },
        embeddedLanguages = {
          css = true,
          javascript = true
        },
        provideFormatter = true,
    }
  end
}
