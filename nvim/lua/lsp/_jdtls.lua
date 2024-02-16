local lspconfig = require('lspconfig')

local JDTLS_PATH = vim.fn.stdpath('data') .. '/lsp_servers/jdt-language-server-1.29.0-202310022015'

return {
  Setup = function(mixin)
    lspconfig['jdtls'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = mixin.flags,
      cmd = {
        '/usr/lib/jvm/java-17-openjdk/bin/java',

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
        JDTLS_PATH .. '/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',

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
