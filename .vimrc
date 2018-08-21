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
set langmap=ba,éz,pe,or,èt,çy,vu,di,lo,fp,j^,z$,aq,us,id,ef,\\,g,ch,tj,sk,rl,nm,mù,^*,ê<,àw,yx,xc,.v,kb,'n,q\\,,g\\;,h:,f!,BA,ÉZ,PE,OR,ÈT,ÇY,VU,DI,LO,FP,J¨,Z£,AQ,US,ID,EF,?G,CH,TJ,SK,RL,NM,M%,!*,Ê>,ÀW,YX,XC,:V,KB,\\;N,QG,G.,H/,F§,@œ,_&,"é,«",»',((,)-,+è,-_,*ç,/à,=),%=,$Œ,^°,µ+,#“,{´,}~,<#,>{,[[,]|,±`,¬\,×^,÷@,¯],%}

" Configuration des plugins :
" Vim-Airline :
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
