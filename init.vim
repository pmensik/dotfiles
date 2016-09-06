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
vnoremap <F1> <ESC>

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
inoremap jj <ESC> 
"
"Clear search results
nnoremap <leader><space> :noh<cr> 
"Jump to parenthesis
nnoremap <tab> %
vnoremap <tab> %
"Opens vertical split
nnoremap <leader>w <C-w>v<C-w>l

"Tabs
set tabstop=4
set shiftwidth=4 
set softtabstop=4 "for indentation in normal mode
set expandtab "insert spaces instead of tabs 

"Save of file on lost focus
"autocmd FocustLost * :wa

"dein Scripts-----------------------------

" Required:
set runtimepath^=/home/pmensik/.config/nvim/dein/repos/github.com/Shougo/dein.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/pmensik/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline')
call dein#add('scrooloose/syntastic')
call dein#add('scrooloose/nerdtree')
call dein#add('artur-shaik/vim-javacomplete2')
call dein#add('janko-m/vim-test')
call dein#add('mhinz/vim-startify')
call dein#add('tpope/vim-fireplace')
call dein#add('Shougo/deoplete.nvim')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"------------ Plugins ------------

"Gruvbox 
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
syntax enable
colorscheme gruvbox
set background=dark

"Airline
let g:airline#extensions#tabline#enabled = 1

"Syntastic
let g:syntastic_quiet_messages = { "type": "style" }

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
let g:startify_bookmarks = ['~/.zshrc', '~/.config/nvim/init.vim']
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
" power tab
imap <silent><expr><tab> TabWrap()
" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
" Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"
