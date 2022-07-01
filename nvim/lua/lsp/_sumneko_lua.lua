local lspconfig = require('lspconfig')

local SUMNEKO_LUA_PATH = vim.fn.stdpath('data') .. '/lsp_servers/lua-language-server-3.4.0-linux-x64'

return {
  Setup = function(mixin)
    lspconfig['sumneko_lua'].setup {
      on_attach = mixin.on_attach,
      capabilities = mixin.capabilities,
      flags = mixin.flags,
      cmd = { SUMNEKO_LUA_PATH .. '/bin/lua-language-server' },
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          format = {
            enable = true,
            defaultConfig = {
              indent_style = 'tab',
              indent_size = "2",
            }
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
      filetypes = { 'lua' },
    }
  end
}
