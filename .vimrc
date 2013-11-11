" #### REQUIREMENTS #####
"   git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"   mkdir ~/.vim/undodir
" #######################

if has('vim_starting') " neobundle keeps my vim packages in line since 1895
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle  'Shougo/unite.vim'                 "  powerful & interactive entity listings
NeoBundle  'itchyny/lightline.vim'            "  Better status bars
NeoBundle  'danro/rename.vim'                 "  :Rename new_file_name
NeoBundle  'rking/ag.vim'                     "  :Ag 'file search regex in quotes ..\w*..'
NeoBundle  'tpope/vim-surround'               "  cs'<div> changes single quotes to div tags
NeoBundle  'tomtom/tcomment_vim'              "  gc toggles comments
NeoBundle  'thoughtbot/vim-rspec'             "  \f runs rspec on current file
NeoBundle  'tpope/vim-dispatch'               "  Run async commands in tmux splits
NeoBundle  'Shougo/neocomplete.vim'           "  Faster autocomplete - requires +lua
NeoBundle  'kchmck/vim-coffee-script'         "  highlight
NeoBundle  'juvenn/mustache'                  "  highlight
NeoBundle  'digitaltoad/vim-jade'             "  highlight
NeoBundle  'wavded/vim-stylus'                "  highlight
NeoBundle  'derekwyatt/vim-scala'             "  highlight
NeoBundle  'pangloss/vim-javascript'          "  highlight
NeoBundle  'vim-ruby/vim-ruby'                "  highlight
NeoBundle  'vim-scripts/confluencewiki.vim'   "  highlight
NeoBundle  'slim-template/vim-slim'           "  highlight
NeoBundle  'tpope/vim-repeat'                 "  bugfix
NeoBundle  'tsaleh/vim-matchit'               "  bugfix
NeoBundle  'tpope/vim-rails'                  "  shortcuts for navigating/generating rails files
NeoBundle  'Shougo/vimfiler.vim'              "  better file browser
NeoBundle  'nathanaelkane/vim-indent-guides'  "  color indents
NeoBundle  'vim-scripts/bufkill.vim'          "  :BD delete buffer without closing split
" asyn-background job support
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundleCheck " auto install above packages
" Some day check out these
"NeoBundle 'vim-scripts/dbext.vim' " database adapter
"NeoBundle 'tpope/vim-fugitive'    " git integration

filetype off                   " Fix for syntax highlighting
filetype plugin indent on      " detect filetype, indent, load respective plugins
syntax enable                  " Local scope syntax highlighting

set undodir=~/.vim/undodir     " persistent undos between editing sessions
set undofile                   " enable undo persistence
set number                     " line numbers
set tabstop=2                  " spaces for a tab
set shiftwidth=2               " spaces for indent
set softtabstop=2              " backspace deletes spaces that filled for tab
set expandtab                  " use spaces rather than tabs
set smartindent                " indents after {
set autoindent                 " keep the current indent for new lines
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
set fillchars=fold:\           " Don't append hyphens - at the end of folds, use spaces
set foldmethod=indent          " Autocreate folds based on indentation, use zc and zo to fold/unfold
set foldlevel=20               " Don't close all folds immediately
set backspace=indent,eol,start " Always allow backspace
set whichwrap+=<,>,h,l         " No idea, maybe helps fix backspace
set wildmenu                   " Use nice tab autocomplete when opening new files
set wildmode=list:longest      " with :sp or :vs for horizontal and vertical splits
set colorcolumn=80             " visually enforce the 80 column limit while coding
set fillchars+=vert:\│         " Split windows with thin pipe
set scrolloff=8                " keep some lines of context above/below cursor
set splitbelow                 " unsurprising splits
set splitright                 " down and to the right
set laststatus=2               " status always
set lazyredraw                 " redraw async so UI is responsive during draw lag
set magic                      " less surprising regex escapes
set noerrorbells
set novisualbell
set t_vb=                      " no idea, fewer error bells?
set tm=500                     " no idea, fewer error whistles?
set ffs=unix,dos,mac           " nix is prefered filetype
set nobackup                   " git is good enough for backups
set nowb                       " git is good enough for backups
set noswapfile                 " git is good enough for backups
set viminfo^=%                 " Remember info about open buffers on close
"set clipboard=unnamedplus     " system buffer is used for copy/yank and paste/put
let mapleader = ','            " \ is now ,
let g:mapleader = ','          " \ is now ,
let g:neocomplete#enable_at_startup       = 1    " better autocomplete enabled
let g:neocomplete#enable_smart_case       = 1    " no idea ... sounds good right?
let g:vimfiler_as_default_explorer        = 1    " vimfiler in Unite is default explorer
let g:indent_guides_enable_on_vim_startup = 1    " visually highlight indents
let g:indent_guides_guide_size            = 1    " highlight indents with a single line
let g:indent_guides_auto_colors           = 0    " don't use weird highlight colors
let g:unite_source_history_yank_enable    = 1    " Enable yank history
let g:unite_source_grep_command           = 'ag' " use the silver searcher, speedy
let g:unite_source_grep_default_opts      = '-i --nocolor --nogroup --hidden'
let g:rspec_command                       = 'Start! spring rspec -- {spec} ; bash' " rspec with spring

colorscheme elflord             " no dark blue, but instead use pretty syntax colors
hi LineNr ctermfg=blue
hi ColorColumn ctermbg=235      " 80th column is colored dark dark gray
hi IndentGuidesEven ctermbg=235 " indent highlight is dark dark gray
hi Folded ctermbg=none          " Folds respect terminal transparency
hi clear VertSplit              " make vert split line thinner

" search buffers
nmap <space>b :Unite -quick-match buffer<cr>
" search yank history
nmap <space>y :Unite history/yank<cr>
" search file names
nmap <space>f :Unite -auto-preview -start-insert file_rec/async<cr>
" search file contents
nmap <space>/ :Unite -auto-preview -start-insert grep:.<cr>
" autocomplete current word with tab
imap <TAB> <C-N>
" rspec current file
map <silent> <leader>f :call RunCurrentSpecFile()<CR>
" rspec current block
map <silent> <leader>s :call RunNearestSpec()<CR>
" rspec entire project
map <silent> <leader>a :call RunAllSpecs()<CR>
" replace visual selection with current yank
vmap <silent> r "_dP
" ctrl+h move to left split
nmap <silent> <C-h> :wincmd h<CR>
" ctrl+j move to below split
nmap <silent> <C-j> :wincmd j<CR>
" ctrl+k move to above split
nmap <silent> <C-k> :wincmd k<CR>
" ctrl+l move to right split
nmap <silent> <C-l> :wincmd l<CR>
" ctrl+n move to next buffer
nmap <silent> <C-n> :BF<CR>
" ctrl+p move to previous buffer
nmap <silent> <C-p> :BB<CR>
" ctrl+c close current buffer (not split)
nmap <silent> <C-c> :BD<CR>
" \z fold current indentation, zR to undo
map <silent> <leader>z :let&l:fdl=indent('.')/&sw<cr>
" \c copy current file within it's dir
map <leader>c :!cp % $(dirname %)/
" \w save file
map <silent> <leader>w :w!<cr>
" \y yank current file's name
map <silent> <leader>y :let @" = expand("%")<cr>
" F3 toggle line numbers
nmap <F3> :set invnumber<CR>
" \r reload this vimrc
map <silent> <leader>r :source $MYVIMRC<cr>
" j moves down within a wrapped line
nmap j gj
" k moves up within a wrapped line
nmap k gk
" annoying command history popup blocked
nmap q: :
" no more annoying ... whatever shift k did
nmap K <NOP>
" jj leave insert mode, save a pinky
imap jj <Esc>
" kk leave insert mode, save a pinky
imap kk <Esc>
" ctrl+c copy (not yank) in mac
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
" Remove the Windows ^M - when the encodings gets messed up
nmap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer for scribble notes
map <leader>q :sp ~/chalkboard<cr>
" Search for selected text with *
vmap <silent> * :call VisualSelection('f')<CR>
" \r Search and replace the selected text
vmap <silent> <leader>r :call VisualSelection('replace')<CR>

" bugfix, crontab must be edited in place
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

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

" Handle system paste more intelligently
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

" Autodetect confluence/slim markup better
augroup filetypedetect
  au BufRead,BufNewFile *.confluencewiki set filetype=confluencewiki
  au BufNewFile,BufRead *.slim set filetype=slim
augroup END

autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")
function! Preserve(command) " delete trailing whitespace on write
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Visual find and replace
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction
