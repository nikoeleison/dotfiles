local lspconfig = require('lspconfig')

return {
  Setup = function(mixin)
    lspconfig['tsserver'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = mixin.flags,
      filetypes = {
        'javascript',
        'javascript.jsx',
        'javascriptreact',
        'typescript',
        'typescript.tsx',
        'typescriptreact',
      },
    }
  end
}
