" @author nikoeleison
" - target: ~/.config/nvim/init.vim
"	- reload: :source ~/.config/nvim/init.vim

if &compatible
  set nocompatible
endif

call plug#begin("~/.vim/plugged")
	"--- colorscheme
	Plug 'dylanaraps/wal.vim'

	"--- airline
	Plug 'vim-airline/vim-airline'

	"--- nerdtree
	" (ctrl + n)
	Plug 'scrooloose/nerdtree'

	"--- nerdcommenter
	" (\ + c + <space>)
	Plug 'scrooloose/nerdcommenter'

	"--- git branch
	Plug 'tpope/vim-fugitive'

	"--- git line
	Plug 'airblade/vim-gitgutter'

	"--- emmet
	" (ctrl + y + ,)
	Plug 'mattn/emmet-vim'

	"--- fzf
	" (ctrl + p)
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	"--- prettier
	" (\ + t)
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'css', 'scss', 'json', 'markdown', 'jsx', 'yaml', 'html'] }

	"--- coc
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

"--- command-line autocomplete
set wildmenu
set showcmd

"--- search
set hlsearch
"set ignorecase
"set smartcase

"--- indentation
set backspace=indent,eol,start
set autoindent

"--- tab
set shiftwidth=2
"set softtabstop=2
"set expandtab
set tabstop=2

"--- backup & swap files
set nobackup
set nowritebackup
set noswapfile

"--- dll
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set completeopt=longest,menuone
"set autoread
"set mouse=a

"=============
"=== VISUAL
"=============

"--- basic
set number
set ruler
"set cursorline
set laststatus=2
set visualbell
set t_vb=

"====================
"=== PLUG SETTINGS
"====================

"--- colorscheme
colorscheme wal

"--- airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='default'

"--- nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

"--- fzf
nnoremap <silent> <C-p> :FZF<Cr>

"--- prettier
nmap <silent> <Leader>t <Plug>(Prettier)
let g:prettier#config#single_quote='true'
let g:prettier#config#semi='false'
let g:prettier#config#trailing_comma='none'
