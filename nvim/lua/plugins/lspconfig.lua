local telescope = require('telescope.builtin')

local signs = { 
	Error = '󰅚 ', 
	Warn = '󰀪 ', 
	Hint = '󰌶 ', 
	Info = ' ' 
}

for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
	virtual_text = {
		prefix = '●'
	}
}

vim.keymap.set('n', '<leader>ce', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>cE', telescope.diagnostics)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { buffer = bufnr }
	vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', '<leader>cD', vim.lsp.buf.type_definition, opts)

	vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<leader>cI', telescope.lsp_references, opts)

	vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<leader>cH', vim.lsp.buf.signature_help, opts)

	vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
	vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>cc', function()
		vim.lsp.buf.format { async = true }
	end, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local mixin = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150
	}
}

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/lsp')) do
	require('lsp.'..file:gsub('%.lua$', '')).setup(mixin)
end
