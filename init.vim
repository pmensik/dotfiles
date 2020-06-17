"Global settings
set nu
set nocompatible
set relativenumber
set undofile
set ignorecase
set smartcase "Case insensitive if everything is lower case
set gdefault "Global replacement by default, omit the g in :%s/foo/bar
set textwidth=120 "Line length before wrap
set colorcolumn=121
set autoread "Files refresh automatically
set autowrite

"So you don't cheat using the arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"Get rid of Help
noremap <F1> <ESC>
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

"Exit terminal mode
tnoremap <Esc> <C-\><C-n>

"Better move between splitted windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"So you don't have to use Shift for commands
nnoremap ; :

let mapleader = "," "Sets leader key
let maplocalleader = "\\"
inoremap jj <ESC>
"
"Clear search results
nnoremap <leader><space> :noh<cr>
"Jump to parenthesis
nnoremap <tab> %
vnoremap <tab> %
"Opens vertical split
nnoremap <leader>w <C-w>v<C-w>l

"Closes buffer without closing the underlying window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>.
"Cycle between buffers
map <C-P> :e#<CR>
map <C-N> :bnext<CR>

"Autocomplete window"
"inoremap <C-Space> <C-X><C-O>
"inoremap <C-x><C-o> <C-Space>
"if exists('g:neovim_dot_app')
"  nmap <c-space> <nul>
"end

"Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4 "for indentation in normal mode
set expandtab "insert spaces instead of tabs

"Save of file on lost focus
"autocmd FocustLost * :wa

" Open markdown files with Firefox (with Markdown plugin installed).
autocmd BufEnter *.md exe 'noremap <F5> :!firefox %:p<CR>'

"Close help split after autocmplete done
autocmd CompleteDone * pclose

"Autoreloads config when saved
 au BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim|set fdm=marker|AirlineRefresh

"Map lclose command"
map <leader>c :lclose<CR>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
set clipboard=unnamed

set fileformat=unix
set fileformats=unix,dos
"set nobinary

" Search and replace in block
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

call plug#begin('~/.local/share/nvim/plugged')

" Add or remove your plugins here:
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'janko-m/vim-test'
Plug 'mhinz/vim-startify'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'vim-syntastic/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }

"Clojure specific
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-slamhound', { 'for': 'clojure' }
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'snoe/clj-refactor.nvim', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'arsenerei/vim-sayid', { 'for': 'clojure' }
" Plug 'snoe/nvim-parinfer.js', { 'for' : 'clojure'}

Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

"Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()

filetype plugin indent on

"------------ Plugins ------------

"Gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
syntax enable
colorscheme gruvbox
set background=dark

"Airline
let g:airline#extensions#tabline#enabled = 1

"javacomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"NERDTree
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
"Closed NERDTree if it's last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"vim-test
let test#python#runner = 'pytest'
let test#strategy = 'neovim'
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>t :TestNearest<CR>

"Startify
autocmd User Startified setlocal buftype=
let g:startify_bookmarks = ['~/dotfiles/zshrc', '~/dotfiles/init.vim', '~/dotfiles/vimperatorrc', '~/.lein/profiles.clj']
let g:startify_list_order = ['bookmarks', 'files', 'dir', 'sessions', 'commands']

"Deoplete
let g:deoplete#enable_at_startup = 1
"use <tab> for completion
function! TabWrap()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
        return "\<tab>"
    elseif &omnifunc !~ ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction
let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
"
" power tab
imap <silent><expr><tab> TabWrap()
" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
" Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"
" Enter: complete&close popup if visible (so next Enter works); else: break undo
inoremap <silent><expr> <Cr> pumvisible() ? deoplete#mappings#close_popup() : "<C-g>u<Cr>"
" MacOS fix for tab completition
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_clojure_checkers = ['eastwood']
"
"Calls Slamhound
nnoremap <F2> :Slamhound<CR>

"Fireplace"
inoremap <C-b> [<C-D>
vnoremap <C-b> [<C-D><CR>

"Clojure static
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom", "defroutes"],
    \ 'clojureFunc': ["set-fields", "exec-raw", "select", "fields", "values", "join", "delete", "where", "insert",
    \ "select*", "group", "aggregate", "subselect"]
    \ }

"FZF
nnoremap <SPACE> :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-v': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-t': 'vsplit' }

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

"Snippets
let g:UltiSnipsExpandTrigger="<`>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"ALE linter
let g:airline#extensions#ale#enabled = 1

"JavaScript linter
let g:neomake_javascript_enabled_makers = ['eslint']

"JavaScript formatting
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG

"Go
let g:go_fmt_command = "goimports"
let g:go_bin_path= "/usr/local/go/"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
