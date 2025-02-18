-- @author nikoeleison
-- target: ~/.config/nvim/init.vim
-- reload: :so / :source <target or %>

--[[ plugins ]]--
vim.cmd [[packadd packer.nvim]]

local packer=require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'folke/tokyonight.nvim'
	use 'dasupradyumna/midnight.nvim'
	use 'xiyaowong/transparent.nvim'

	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-tree/nvim-tree.lua'

	use 'nvim-lualine/lualine.nvim'

	use 'lukas-reineke/indent-blankline.nvim'

	use 'lewis6991/gitsigns.nvim'

	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	use 'nvim-treesitter/nvim-treesitter'

	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
end)

--[[ options ]]--
vim.opt.number=true
vim.opt.ruler=true
vim.opt.cursorline=true

vim.opt.shiftwidth=2
vim.opt.tabstop=2
vim.opt.expandtab=false
vim.opt.smartindent=true

vim.opt.hlsearch=true
vim.opt.incsearch=true

vim.opt.backup=false
vim.opt.writebackup=false
vim.opt.swapfile=false

vim.opt.splitright=true
vim.opt.splitbelow=true

vim.opt.termguicolors=true
vim.opt.clipboard='unnamedplus' -- yank xclip

vim.opt.wrap=false
vim.opt.fixeol=false -- no newline at end of file

--[[ keymaps ]]--
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

vim.keymap.set('n', 'bn', ':bnext<CR>')
vim.keymap.set('n', 'bp', ':bprevious<CR>')

vim.keymap.set('x', 'P', [["_dP]]) -- replace block without yanking

vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]]) -- move block up
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]]) -- move block down

--[[ plugins ]]--
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins')) do
	require('plugins.'..file:gsub('%.lua$', ''))
end

return packer
