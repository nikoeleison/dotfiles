local lspconfig = require('lspconfig')

local JDTLS_PATH = vim.fn.stdpath('data') .. '/lsp_servers/jdtls-1.10.0'

return {
  Setup = function(mixin)
    lspconfig['jdtls'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      cmd = { 
        '/usr/lib/jvm/java-11-openjdk/bin/java',

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        '-javaagent:' .. JDTLS_PATH .. '/lombok.jar',

        '-jar',
        JDTLS_PATH .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

        '-configuration',
        JDTLS_PATH .. '/config_linux',

        '-data',
        JDTLS_PATH .. '/ws/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
      },
      filetypes = { 
        'java',
      },
    }  
  end
}
