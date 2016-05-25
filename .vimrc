set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
"set rtp+=~/.vim/bundle/Vundle.vim
vundle#begin('$USERPROFILE/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
"Plugin 'ctrlp.vim'
"Plugin 'elzr/vim-json'
"Plugin 'editorconfig-vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
"Plugin 'eslint/eslint'
"Plugin 'jlanzarotta/bufexplorer'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"indentation stuff
"set smartindent
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set expandtab
"
"set complete+=k "dictionary autocomplete
"
"set number "view line numbers
"highlight LineNr ctermfg=grey
"
"set listchars=tab:▸▸,trail:~ "nicer whitespace chars
"set list "show whitespace
"set mouse=nv "allow mouse
"
""skip backup & swap files
"set nobackup
"set nowritebackup
"set noswapfile
"
""save readonly files with sudo using w!!
"cmap w!! %!sudo tee > /dev/null %
"
"set exrc "allow per folder configs
"set secure "disallow dangerous commands in per folder configs
"
"syntax enable
"set background=dark
"colorscheme solarized
inoremap jj <ESC>
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
