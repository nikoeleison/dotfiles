local telescopebuiltin = require('telescope.builtin')

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = ' ',
  }
})

local on_attach = function(client, bufnr)
  --client.resolved_capabilities.document_formatting = true

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>da', telescopebuiltin.diagnostics, opts)
  vim.keymap.set('n', '<leader>dc', '<cmd>Telescope diagnostics bufnr=0<cr>', opts)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gf', telescopebuiltin.lsp_definitions, bufopts)
  vim.keymap.set('n', 'gt', telescopebuiltin.lsp_type_definitions, bufopts)
  vim.keymap.set('n', 'gi', telescopebuiltin.lsp_implementations, bufopts)
  vim.keymap.set('n', 'gr', telescopebuiltin.lsp_references, bufopts)

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>t', vim.lsp.buf.formatting, bufopts)
end

--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local mixin = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

--require('lsp/_sumneko_lua').Setup(mixin)
require('lsp/_tsserver').Setup(mixin)
require('lsp/_cssls').Setup(mixin)
require('lsp/_html').Setup(mixin)
require('lsp/_yamlls').Setup(mixin)
require('lsp/_jdtls').Setup(mixin)
require('lsp/_lemminx').Setup(mixin)
