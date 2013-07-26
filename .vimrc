" #### DO THIS FIRST ####
"     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"     mkdir ~/.vim/undodir
" #######################

"Must `apt-get install git` and run above clone. These Bundle commands won't work otherwise.
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
" BundleInstall! updates all bundles
" BundleClean!   removes data of old bundles

Bundle 'scrooloose/nerdtree'
" \n to open file browser

Bundle 'fholgado/minibufexpl.vim'
" :tmi<tab> to toggle showing buffers like tabs

Bundle 'danro/rename.vim'
" :Rename new_file_name

Bundle 'rking/ag.vim'
" :Ag 'any \w* search pattern'

Bundle 'majutsushi/tagbar'
" \t shows method names for current file/class/module

Bundle 'tpope/vim-surround'
" cs'<div> changes single quotes to div tags

Bundle 'tomtom/tcomment_vim'
" gc toggles comments

" Highlight and properly indent more filetypes
Bundle 'kchmck/vim-coffee-script'
Bundle 'juvenn/mustache'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'derekwyatt/vim-scala'
Bundle 'pangloss/vim-javascript'

" Intuitive behavior fixes
Bundle 'tpope/vim-repeat'
Bundle 'tsaleh/vim-matchit'

" Cool plugins I havn't learned/made habit yet
"Bundle 'vim-scripts/dbext.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'wincent/Command-T' causes segfault

          " ~/.vim/undodir/      directory must exist
set undodir=~/.vim/undodir     " persistent undos between editing sessions
set undofile
set number                     " line numbers
set tabstop=2                  " spaces for a tab
set shiftwidth=2               " spaces for indent
set softtabstop=2              " backspace deletes spaces that filled for tab
set expandtab                  " use spaces rather than tabs
set smartindent                " indents after {
set autoindent                 " keep the current indent for new lines
filetype off                   " Fix for syntax highlighting
filetype plugin indent on      " detect filetype, indent, load respective plugins
syntax enable                  " Local scope syntax highlighting
set ignorecase                 " ignore case searches
set incsearch                  " search while typing
set hlsearch                   " highlight searches
set pastetoggle=<F2>           " f2 for paste mode, disabling indent
nmap <F3> :set invnumber<CR>
set mouse=a                    " mouse compatability
set autoread                   " reload changed files when unedited
set linebreak                  " wrap lines at natural word dividers
set title                      " set terminal title to file name
set nowrapscan                 " don't wrap back to top searches
set nowrap                     " don't wrap long lines of text. ':set wrap' to reenable
colorscheme elflord            " no dark blue, but instead use pretty syntax colors
set fillchars=fold:\           " Don't append hyphens - at the end of folds, use spaces
hi Folded ctermbg=none         " Folds respect terminal transparency
set foldmethod=indent          " Autocreate folds based on indentation, use zc and zo to fold/unfold
set foldlevel=20               " Don't close all folds immediately
set backspace=indent,eol,start " Always allow backspace
set wildmenu                   " Use nice tab autocomplete when opening new files
set wildmode=list:longest      " with :sp or :vs for horizontal and vertical splits
set colorcolumn=80             " visually enforce the 80 column limit while coding

autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e") "Delete trailing whitespace on write
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction

"complete current word with tab, looking upwards for matches
"use ctrl+v tab if you need an actual tab
inoremap <TAB> <C-P>

"r replaces visual selection with yank's buffer
vmap <silent> r "_dP

"Use ctrl+h,j,k,l to move among split buffers
nmap <silent> <C-k> :wincmd k<CR>

nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

"ctrl+n/p to switch buffers, same as irssi and tmux, next/previous
nmap <silent> <C-p> :bp<CR>
nmap <silent> <C-n> :bn<CR>

"Backslash n to open NerdTree
map <silent> <leader>n :NERDTreeToggle<CR>
map <silent> <leader>t :TagbarToggle<CR>

map <silent> <leader>z :let&l:fdl=indent('.')/&sw<cr> "\z will close all folds at current level

"j and k move inside wrapped lines as well
nnoremap j gj
nnoremap k gk

"Alternate esc characters
imap jj <Esc>
imap kk <Esc>

"ctrl+c in visual mode will copy to mac system buffer
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
"set clipboard=unnamedplus "system buffer is used for copy/yank and paste/put

" Search for selected text with *
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
