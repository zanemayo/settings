set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

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
"Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'eslint/eslint'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rust-lang/rust.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
" Plugin '844196/lightline-badwolf.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'rking/ag.vim'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'valloric/youcompleteme'
" Plugin 'ternjs/tern_for_vim'
Plugin 'tpope/vim-surround'
" Plugin 'astashov/vim-ruby-debugger'
" Plugin 'sidorares/node-vim-debugger'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'ervandew/supertab'
" Plugin 'ensime/ensime-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'dgryski/vim-godef'
Plugin 'vim-jp/vim-go-extra'
" Plugin 'jodosha/vim-godebug'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'easymotion/vim-easymotion'
"Plugin 'mkitt/tabline.vim'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'nanotech/jellybeans.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-dispatch'
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
set encoding=utf-8

set ignorecase
set smartcase

"indentation stuff
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" set softtabstop=0 noexpandtab
set backspace=indent,eol,start

set complete+=k "dictionary autocomplete

set number "view line numbers
highlight LineNr ctermfg=grey

"set listchars=tab:��������,trail:~ "nicer whitespace chars
"set listchars=trail:~
set syntax=whitespace
"set list "show whitespace
set mouse=nv "allow mouse

"make copy to clipboard work in linux
set clipboard=unnamedplus

"skip backup & swap files
set nobackup
set nowritebackup
set noswapfile

"save readonly files with sudo using w!!
"cmap w!! %!sudo tee > /dev/null %

set exrc "allow per folder configs
set secure "disallow dangerous commands in per folder configs

set wildignore+=*/dist/* " ctrlp ignore dist

"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
"
"set timeout ttimeoutlen=500
"
tnoremap <M-.> <Esc>.

inoremap \ej <C-o>j

syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme jellybeans
inoremap jk <ESC>
inoremap kj <ESC>
inoremap jj <ESC>
inoremap <C-p> <C-r><C-r>"
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules

set <F2>=OQ
set <F12>=[24~

nnoremap <Space>i <C-I>
nnoremap <Space>o <C-O>
nnoremap j gj
nnoremap k gk
nnoremap <TAB> <C-w>w
nnoremap ]w <C-w>w
nnoremap [w <C-w>W
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
nnoremap <F2> :TernRename<CR>
nnoremap <F12> :TernDef<CR>
nmap gt gdf'gf
" vnoremap / I// <ESC>
vnoremap ; :s/^\(\s*\)\/\/ \?/\1/<CR>
vnoremap / :s/^/\/\/ /<CR>:nohlsearch<CR>
noremap <C-s> :w
nnoremap <Space>t :NERDTreeFind<CR>

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
inoremap <A-e> <C-o>e
"inoremap <BS> <NOP>
"inoremap <CR> <NOP>

" Go
nnoremap <Space>gr :GoRun<CR>

"nnoremap <Space>g :wa<CR>:!!<CR>

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

nnoremap <Space>ov :sp ~/.vimrc<CR>
nnoremap <Space>os :sp ~/.scratch<CR>
nnoremap <Space>on :e ~/Documents/notes.org<CR>

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

nnoremap <Space>os :vs ~/.scratch<CR>
nnoremap <Space>ov :vs ~/.vimrc<CR>

nnoremap <Space>a :Ag 

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

" nnoremap <S-> O<Esc>j
syntax on

let g:tsuquyomi_disable_quickfix = 1
"let g:tsuquyomi_completion_detail = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
"autocmd FileType typescript setlocal completeopt+=menu,preview

set nohlsearch
set incsearch
"highlight search cterm=underline
nnoremap <Space>h :nohlsearch<CR>

set pumheight=10

set hidden

"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme="solarized"
"let g:airline_theme="badwolf"
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256
" let g:airline_powerline_fonts = 1
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set laststatus=2

let g:lightline = { 'colorscheme': 'jellybeans' }
"set showtabline=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_debug = 3

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

let g:multi_cursor_exit_from_insert_mode = 0

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2


let g:NERDTreeHijackNetrw=0

let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'


nnoremap <C-_> <plug>NERDComToggleComment 

let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:yankring_replace_n_pkey = '<M-p>'
let g:yankring_replace_n_nkey = '<M-n>'

let g:ag_highlight = 1
