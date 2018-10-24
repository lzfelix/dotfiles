call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'davidhalter/jedi-vim'          " just don't forget to install jedi from pythonx/jedi with git submodule update --init on the repo
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
 
call plug#end()

" Avoiding issues downstram with colorscheme
colorscheme default

" NerdTree loads on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Closes nerdtree if it's the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NerdTree becomes prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NerdTree removes the buffer of deleted files
let NERDTreeAutoDeleteBuffer = 1

nnoremap <Leader>f :NERDTreeToggle<Enter>

" JEDI
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#auto_close_doc = 1                           " close preview window after completion
let g:jedi#show_call_signatures = "0"
autocmd FileType python setlocal completeopt-=preview   " don't show string docs during autocomplete

" For some reason my VIM's autocomplete suggestion pop up is pink
highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=black ctermbg=blue

" Supertab cycles options from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic python configs
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

hi SpellBad ctermfg=white ctermbg=red guifg=#111 guibg=#875f87
hi SpellCap ctermfg=white  ctermbg=red guifg=#111  guibg=#875f5f

" > python linting -- using python and mypy from conda. The latter ignore
" missing imports
let g:syntastic_python_checkers = ['python', 'mypy']
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_python_exec = 'python'
let g:syntastic_python_mypy_exec = 'mypy'
let g:syntastic_python_mypy_args = "--ignore-missing-imports"

" just CTRL+{h,j,k,l} to navigate
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" by default search is case-insenstive, unless there's an upper case 
set ignorecase
set smartcase

" search matches highlight during typing / highlight matched terms
set incsearch
set hlsearch

" setting Python encoding
set encoding=utf-8

" Setting line numbers
set number

" Replace tabs by 4 spaces always
set tabstop=4 
set shiftwidth=4
set softtabstop=4

" Tabs are spaces etc, automatically fill in tabs to continue indentation
set autoindent nosmartindent
set smarttab
set expandtab

" Turn on mouse to select / resize panes
set mouse=a
vmap <C-c> "+y

" Allows vim to use the system clipboard
set clipboard=unnamed

" Set code folding using tabs
" Fold/unfold with space
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set pastetoggle=<F2>

" every buffer split happens on the right side
set splitright

" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Changing folded code background colour
highlight Folded ctermbg=black

" Trick to aovid using SHIFT+; -> :
nnoremap ; :

" Patching ugly vim default pane separator
set fillchars=vert:\│
hi clear VertSplit

" The tilde for blank lines becomes darker
hi NonText ctermfg=black guifg=black 

" Changing search highlight color
hi Search cterm=NONE ctermfg=black ctermbg=gray

" Don't generate swap files
set noswapfile

