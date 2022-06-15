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

  "--- fugitive
  Plug 'tpope/vim-fugitive'

  "--- gitgutter
  Plug 'airblade/vim-gitgutter'

  "--- nerdcommenter
  " (\ + c + <space>)
  Plug 'scrooloose/nerdcommenter'

  "--- emmet
  " (ctrl + y + ,)
  Plug 'mattn/emmet-vim'

  "--- autopairs
  Plug 'jiangmiao/auto-pairs'

  "--- fzf
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'

  "--- treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

"--- indentation
set backspace=indent,eol,start
set autoindent
set smartindent

"--- tab
set shiftwidth=2
set tabstop=2
set expandtab

"--- backup & swap files
set nobackup
set nowritebackup
set noswapfile

"--- visual
set number
set ruler
set laststatus=2
set visualbell
set t_vb=

"--- dll
set nostartofline
set notimeout ttimeout ttimeoutlen=200
set completeopt=longest,menuone

"--- navigation
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"==============
"=== PLUGINS
"==============

autocmd FileType css setl iskeyword+=-
autocmd FileType scss setl iskeyword+=@-@

autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

"--- colorscheme
colorscheme wal

"--- airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='default'

"--- autopairs
let g:AutoPairsFlyMode=0
let g:AutoPairsMapCh=0

"--- fzf
nnoremap <silent> <C-p> :Files<Cr>
nnoremap <silent> <C-g> :Rg!<Cr>

"--- treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight={
    enable=true
  },
  ensure_installed={
    "tsx",
    "dart",
    "java"
  }
}

local parser_config=require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername={ "typescript.tsx" }
EOF

"--- coc
let g:coc_global_extensions=[
\   'coc-explorer',
\   'coc-eslint',
\   'coc-prettier',
\   'coc-tsserver',
\   'coc-html',
\   'coc-css',
\   'coc-flutter',
\   'coc-java',
\ ]

if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>t  <Plug>(coc-format)
nmap <silent> <leader>rn <Plug>(coc-rename)

xmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>ac  <Plug>(coc-codeaction)
nmap <silent> <leader>af  <Plug>(coc-fix-current)

let g:coc_explorer_global_presets={
\ 'explorer': {
\   'width': 30,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

nmap <C-n> <Cmd>CocCommand explorer --preset explorer<CR>
