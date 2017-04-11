set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'zhaocai/GoldenView.Vim'
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
"Plugin 'ternjs/tern_for_vim'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'jceb/vim-orgmode'
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
colorscheme solarized
" colorscheme monokai
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules

set <F2>=OQ
set <F12>=[24~

nnoremap <Space>i <C-I>
nnoremap <Space>o <C-O>
nnoremap j gj
nnoremap k gk
nnoremap <Space>g :wa<CR>:!!<CR>
nnoremap <TAB> <C-w>w
nnoremap <S-TAB> <C-w>W
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
nnoremap <F2> :TernRename<CR>
nnoremap <F12> :TernDef<CR>
nmap gt gdf'gf
" vnoremap / I// <ESC>
vnoremap ; :s/^\(\s*\)\/\/ \?/\1/<CR>
vnoremap / :s/^/\/\/ /<CR>:nohlsearch<CR>
noremap <C-s> :w
nnoremap <Space>t :NERDTree<CR> 

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
inoremap <A-e> <C-o>e
"inoremap <BS> <NOP>
"inoremap <CR> <NOP>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" experimental
nnoremap <C-j> 4j4<C-e>
nnoremap <C-k> 4k4<C-y>
nnoremap <C-j> 7j
nnoremap <C-k> 7k
nnoremap <C-h> _
nnoremap <C-l> g_
nnoremap <Space>q :q<CR>
nnoremap <Space>w :w<CR>
"nnoremap ; :

nnoremap [c :cprevious <CR>
nnoremap ]c :cnext <CR>

nnoremap <Space>k :lprevious<CR>

function! CloseLocationAndQuickFix()
  :windo if &buftype == "quickfix" || &buftype == "locationlist" | lclose | endif
endfunction

nnoremap <Space>v :e ~/.vimrc<CR>
nnoremap <Space>c :call CloseLocationAndQuickFix()<CR>
" Typescript
nnoremap <Space>r :TsuRenameSymbol<CR>
nnoremap <Space>d :TsuDefinition<CR>
nnoremap <Space>f :TsuReferences<CR>
nnoremap <Space>s :TsuSearch 

" wrap :cnext/:cprevious and :lnext/:lprevious
function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

" go up and down the quickfix list and wrap around
nnoremap <Space>j :call WrapCommand('down', 'l')<CR>
nnoremap <Space>k :call WrapCommand('up', 'l')<CR>

syntax on

let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
autocmd FileType typescript setlocal completeopt+=menu,preview

"let g:multi_cursor_exit_from_visual_mode = 0
"let g:multi_cursor_exit_from_insert_mode = 0

let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme="solarized"
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
"set t_Co=256
let g:airline_powerline_fonts = 1

" set term=xterm
" set t_Co=256
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm"
" colorscheme solarized

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

set go-=m
set go-=T
set go-=L
set go-=r
set guifont=HACK:h12:cANSI:qDRAFT

hi MatchParen guibg=NONE guifg=blue gui=bold

