map X :tabnext<CR>
map Z :tabprev<CR>
map t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --sort=foldcase .<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indending and tabbing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                      "set lines to automatically indent based on previous line
set cindent
set smartindent                     "makes vim attempt to intelligently guess the indent level of any new line based on the previous line
set showtabline=2                   "always show tab line
set shiftwidth=4                    "set the shiftwidth (>) to 4
set tabstop=4                       "set the tab size to 4
set smarttab
set nowrap
set textwidth=100 wrap linebreak    "full line breaks at spaces
set expandtab                       "use spaces instead of tabs

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set comments=sl:/*,mb:\ *,elx:\ */
set formatoptions+=r
set list
set listchars=tab:>-,trail:~,extends:>,precedes:< ",eol:$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set wrapscan   " search wrap around the end of the file
set ignorecase " ignore case search
set smartcase  " override 'ignorecase' if the search pattern contains upper case"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interactions and interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme delek
set mouse=a
set number
set ruler
set showmatch
set tags=tags
"set spell
set showmode
set showcmd
set scrolloff=5                " minimal number of screen lines to keep above and below the cursor
"set foldmethod=indent          " use indent for folding
set backspace=eol,start,indent
set clipboard+=unnamed         " share clipboard
"set foldcolumn=3               " display folds
set wildmenu                   " enhance command completion
set wildmode=list:longest,full " first 'list:lingest' and second 'full'"

set nocp
syntax on
filetype on
filetype indent on
filetype plugin on
let c_space_errors = 1
let java_space_errors = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l
nnoremap <C-j> :join<CR>
nnoremap <C-k> i<CR><ESC>
