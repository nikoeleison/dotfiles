" @author nikoeleison
" - target: ~/.config/nvim/init.vim
" - reload: :source ~/.config/nvim/init.vim

if &compatible
  set nocompatible
endif

call plug#begin("~/.vim/plugged")
  "--- colorscheme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'Mofiqul/vscode.nvim'

  "--- lualine
  Plug 'nvim-lualine/lualine.nvim'

  "--- tree
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'

  "--- telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  "--- gitsigns
  Plug 'lewis6991/gitsigns.nvim'

  "--- blankline
  Plug 'lukas-reineke/indent-blankline.nvim'

  "--- hexokinase
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  "--- treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  "--- lsp
  Plug 'neovim/nvim-lspconfig'

  "--- cmp
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  "--- vsnip
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
call plug#end()

"============
"=== BASIC
"============

filetype indent plugin on
syntax on

"--- encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"--- indentation
set backspace=indent,eol,start
set autoindent
set smartindent

"--- tab
set shiftwidth=2
set tabstop=2
set expandtab
autocmd Filetype java setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd Filetype xml setlocal shiftwidth=4 tabstop=4 noexpandtab

"--- backup & swap files
set nobackup
set nowritebackup
set noswapfile

"--- visual
set number
set ruler
set cursorline
set hlsearch
set laststatus=2
set visualbell
set t_vb=
set termguicolors

"--- etc
set wildmenu
set showcmd
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set completeopt=menu,menuone,noselect
set clipboard=unnamedplus

"--- navigation
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"--- buffer
map bn :bn<CR>
map bp :bp<CR>
"map bw :bw<CR>
"map bdbw :bufdo bw<CR>

"==============
"=== PLUGINS
"==============

lua << EOF
  require('_colorscheme')
  require('_lualine')
  require('_tree')
  require('_telescope')
  require('_gitsigns')
  require('_blankline')
  require('_hexokinase')
  require('_treesitter')
  require('lsp')
  require('_cmp')
  require('_vsnip')
EOF
