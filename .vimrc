" #### DO THIS FIRST ####
"     # install git # brew install git # apt-get install git
"     git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"     mkdir ~/.vim/undodir
" #######################

" BundleInstall! updates all bundles
" BundleClean!   removes data of old bundles

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundleCheck

" Recommended to install from shougo, handles asyn-background jobs
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/unite.vim'
" Search/select/preview - to the maximum awesome - files/buffers/yanks/...

NeoBundle 'itchyny/lightline.vim'
" Better status bars

NeoBundle 'danro/rename.vim'
" :Rename new_file_name

NeoBundle 'rking/ag.vim'
" :Ag 'any \w* search pattern'

NeoBundle 'majutsushi/tagbar'
" \t shows method names for current file/class/module

NeoBundle 'tpope/vim-surround'
" cs'<div> changes single quotes to div tags

NeoBundle 'tomtom/tcomment_vim'
" gc toggles comments

NeoBundle 'thoughtbot/vim-rspec'
" \f runs rspec on current file

NeoBundle 'tpope/vim-dispatch'
" Support for async commands in tmux splits

NeoBundle 'Shougo/neocomplete.vim'
" Faster autocomplete - requires +lua

NeoBundle 'Shougo/neosnippet'
" Autocomplete blocks of commonly typed code structures

NeoBundle 'honza/vim-snippets.git'
" Aggregation of community contributed snippets

" Highlight and properly indent more filetypes
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'juvenn/mustache'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/confluencewiki.vim'

" Intuitive behavior fixes
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tsaleh/vim-matchit'

NeoBundle 'tpope/vim-rails'
" Helpful vim shortcuts for navigating and generating rails files

NeoBundle 'Shougo/vimfiler.vim'
" File Browser in Unite

" Cool plugins I havn't learned/made habit yet
"NeoBundle 'vim-scripts/dbext.vim'
"NeoBundle 'tpope/vim-fugitive'

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
hi ColorColumn ctermbg=darkgray
set scrolloff=8                " keep some lines of context above/below cursor
set splitbelow                 " unsurprising splits
set splitright
set laststatus=2               " status always
set lazyredraw                 " redraw async so UI is responsive during draw lag
let g:neocomplete#enable_at_startup = 1 " better autocomplete enabled
let g:neocomplete#enable_smart_case = 1 " no idea ... sounds good right?
let g:unite_source_grep_command="ag" " use the silver searcher, speedy
let g:unite_source_grep_default_opts="-i --nocolor --nogroup --hidden"
let gneosnippet#snippets_directory='~/.vim/bundle/vim-snippets, ~/.vim/snippets'
let g:vimfiler_as_default_explorer = 1 "VimFiler in Unite is default explorer

" search buffers
nnoremap <space>b :Unite -quick-match buffer<cr>

" Save and query yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" search file names
nnoremap <space>f :Unite -auto-preview -start-insert file_rec/async<cr>

" search file contents
nnoremap <space>/ :Unite -auto-preview -start-insert grep:.<cr>

" Snippet, complete code blocks
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Delete trailing whitespace on write
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction

"complete current word with tab, looking down for matches
"use ctrl+v tab if you need an actual tab
inoremap <TAB> <C-N>

" Rspec.vim mappings
map <silent> <leader>f :call RunCurrentSpecFile()<CR>
map <silent> <leader>s :call RunNearestSpec()<CR>
map <silent> <leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Start! spring rspec -- {spec} ; bash"

"r replaces visual selection with yank's buffer
vmap <silent> r "_dP

"Use ctrl+h,j,k,l to move among split buffers
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

"ctrl+n/p to switch buffers, same as irssi and tmux, next/previous
nmap <silent> <C-n> :bn<CR>
nmap <silent> <C-p> :bp<CR>

"\z will close all folds at current level
map <silent> <leader>z :let&l:fdl=indent('.')/&sw<cr>

" \c will copy current file to new name in its directory
map <leader>c :!cp % $(dirname %)/

" \w will save! current file
map <silent> <leader>w :w!<cr>

"yank file name
map <silent> <leader>y :let @" = expand("%")<cr>

"disable line numbers
nmap <F3> :set invnumber<CR>

"reload vimrc
map <silent> <leader>r :source $MYVIMRC<cr>

"j and k move inside wrapped lines as well
nnoremap j gj
nnoremap k gk

" no more annoying command history popup
nnoremap q: :

" no more annoying ... whatever shift k did
nnoremap K <NOP>

"Alternate esc characters
imap jj <Esc>
imap kk <Esc>

"crontab must be edited in place
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

"ctrl+c in visual mode will copy to mac system buffer
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
"set clipboard=unnamedplus "system buffer is used for copy/yank and paste/put

" Search for selected text with *
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Create parent directories on save if they don't exist
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Handle paste more intelligently - cmd+v or ctrl+v in insert mode
if exists('$ITERM_PROFILE') || exists('$TMUX')
  let &t_ti = "\<Esc>[?2004h" . &t_ti
  let &t_te = "\<Esc>[?2004l" . &t_te

  function! XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction

  execute "set <f28>=\<Esc>[200~"
  execute "set <f29>=\<Esc>[201~"
  map <expr> <f28> XTermPasteBegin("i")
  imap <expr> <f28> XTermPasteBegin("")
  vmap <expr> <f28> XTermPasteBegin("c")
  cmap <f28> <nop>
  cmap <f29> <nop>
end

" Config for status bar
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'filename'] ],
      \   'right': [ [ 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename'] ],
      \   'right': [ [ 'modified' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" Allow pretty colors
if !has('gui_running')
  set t_Co=256
endif

" Autodetect confluence markup better
augroup filetypedetect
  au BufRead,BufNewFile *.confluencewiki set filetype=confluencewiki
augroup END
