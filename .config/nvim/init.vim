if &compatible
  set nocompatible
endif

call plug#begin("~/.vim/plugged")
	"--- pywal
	Plug 'dylanaraps/wal.vim'

	"--- fzf
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	"--- airline
	Plug 'vim-airline/vim-airline'

	"--- nerdtree
	" :NERD...
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

	"--- prettier
	" \ + p
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'css', 'scss', 'json', 'markdown', 'vue', 'jsx', 'yaml', 'html'] }

	"--- deoplete
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

filetype indent plugin on
syntax on

"============
"=== BASIC
"============

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
set pastetoggle=<F2>
nmap <Leader>r :edit %<CR>
nmap <Leader>s :source %<CR>

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

"--- fzf
nnoremap <C-p> :FZF<Cr>

"--- airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='default'

"--- nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

"--- prettier
nmap <Leader>t <Plug>(Prettier)
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'none'

"--- deoplete
let g:deoplete#enable_at_startup = 1
