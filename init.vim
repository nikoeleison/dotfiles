" @author nikoeleison
" - target: ~/.config/nvim/init.vim
" - reload: :source ~/.config/nvim/init.vim

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
	Plug 'junegunn/fzf.vim'

	"--- prettier
	" (\ + t)
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'css', 'scss', 'json', 'markdown', 'jsx', 'yaml', 'html'] }

	"--- coc
	" coc-json, coc-eslint, coc-tsserver
	" autocomplete: ctrl+space, tab
	" dignostic next/prev: [g/]g
	" definition: gd
	" type-definition: gy
	" implementation: gi
	" references: gr
	" documentation: K
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
set smartindent

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
nnoremap <silent> <C-p> :Files<Cr>

"--- prettier
nmap <silent> <Leader>t <Plug>(Prettier)
let g:prettier#config#single_quote='true'
let g:prettier#config#semi='false'
let g:prettier#config#trailing_comma='none'

"--- coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
