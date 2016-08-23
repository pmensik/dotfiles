"Global settings
set nu
set nocompatible
set modelines
"Tabs
set tabstop=4
set shiftwidth=4 
set softtabstop=4 "for indentation in normal mode
set expandtab "insert spaces instead of tabs 

set relativenumber
set undofile

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
