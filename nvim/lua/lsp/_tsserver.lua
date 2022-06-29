local lspconfig = require('lspconfig')

return {
  Setup = function(mixin)
    lspconfig['tsserver'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = {
        debounce_text_changes = 150,
      },
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

