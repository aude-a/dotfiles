"" Vimrc
"" François-Xavier Colas - 2018

set nocompatible

" Installation de Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin() " Nécessite l'installation de vim-plug
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
call plug#end()

" Couleurs
set t_Co=256
colorscheme dracula
syntax on
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Interface
set ruler
set number
set showmode
set showcmd
set laststatus=2
set wildmenu
set ttyfast
set splitright

" Tabulations et indentation
filetype plugin on
filetype indent on
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

" Recherche
set incsearch
set hlsearch
set ignorecase
set smartcase

" Divers
set autoread
set hidden
set undodir=~/.vim/.undo//      " Il est nécessaire de créer
set backupdir=~/.vim/.backup//  " ces trois répertoires
set directory=~/.vim/.swp//     " manuellement
set history=10000
set backspace=indent,eol,start

" Disposition de clavier Bépo
noremap c h
noremap r l
noremap t j
noremap s k
nnoremap <C-T> <C-W><C-J>
nnoremap <C-S> <C-W><C-K>
nnoremap <C-R> <C-W><C-L>
nnoremap <C-C> <C-W><C-H>

" Configuration des plugins :
" Vim-Airline :
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Git-Gutter :
set updatetime=100 
" NERDTree :
autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap ll :NERDTreeToggle<Enter>
nnoremap le :NERDTreeFind<CR>
