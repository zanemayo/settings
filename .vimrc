set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'racer-rust/vim-racer'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'eslint/eslint'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'rking/ag.vim'
Plugin 'valloric/youcompleteme'
Plugin 'ternjs/tern_for_vim'
"Plugin 'zhaocai/GoldenView.Vim'
Plugin 'tpope/vim-surround'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start

set complete+=k "dictionary autocomplete

set number "view line numbers
highlight LineNr ctermfg=grey

"set listchars=tab:ÎõÎéÎõÎé,trail:~ "nicer whitespace chars
"set list "show whitespace
set mouse=nv "allow mouse

"skip backup & swap files
set nobackup
set nowritebackup
set noswapfile

"save readonly files with sudo using w!!
"cmap w!! %!sudo tee > /dev/null %

set exrc "allow per folder configs
set secure "disallow dangerous commands in per folder configs

syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized
inoremap jj <ESC>
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules

set <F2>=OQ
set <F12>=[24~

nnoremap <CR> :wa<CR>:!!
nnoremap <TAB> <C-w>w
nnoremap <S-TAB> <C-w>W
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
nnoremap <F2> :TernRename<CR>
nnoremap <F12> :TernDef<CR>
:syntax on


let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="solarized"
set laststatus=2


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']

let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
let g:airline_powerline_fonts = 1
