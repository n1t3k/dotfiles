call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'skanehira/preview-markdown.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'vim-scripts/Zenburn'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

autocmd VimEnter * NERDTree | wincmd p

colors zenburn
let g:airline_theme='zenburn'

" Basic settings
set mouse=a
set number relativenumber
set encoding=utf_8
set nocompatible

" tabs / spaces
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
filetype plugin indent on

" automatically re-read
set autoread

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_emphasis_multiline = 0
autocmd FileType markdown set conceallevel=2

let g:preview_markdown_auto_update = 1

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
