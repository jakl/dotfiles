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
set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ " wrap text with 12 spaces of indentation
set ignorecase                 " ignore case searches
set incsearch                  " search while typing
set hlsearch                   " highlight searches
set pastetoggle=<F2>           " f2 for paste mode, disabling indent
set mouse=a                    " mouse compatability
set autoread                   " reload changed files when unedited
set linebreak                  " wrap lines at natural word dividers
set title                      " set terminal title to file name
set nowrapscan                 " don't wrap back to top searches
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
set encoding=utf-8
setglobal fileencoding=utf-8
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
"let g:neocomplete#enable_at_startup       = 1    " better autocomplete enabled ... but error
let g:investigate_use_dash=1                     " K opens dash documentation
let g:investigate_dash_for_ruby="rails"          " treat ruby as rails for docs
let g:neocomplete#enable_smart_case       = 1    " no idea ... sounds good right?
let g:vimfiler_as_default_explorer        = 1    " vimfiler in Unite is default explorer
let g:indent_guides_enable_on_vim_startup = 1    " visually highlight indents
let g:indent_guides_guide_size            = 1    " highlight indents with a single line
let g:indent_guides_auto_colors           = 0    " don't use weird highlight colors
let g:unite_source_history_yank_enable    = 1    " Enable yank history
let g:unite_source_grep_command           = 'ag' " use the silver searcher, speedy
let g:unite_source_grep_default_opts      = '-i --nocolor --nogroup --hidden'
let g:unite_source_rec_async_command      = 'ag --nocolor --nogroup --hidden -g ""'
let g:rspec_command                       = 'Start! bundle exec spring rspec -- {spec} ; bash' " rspec with spring

colorscheme elflord             " no dark blue, but instead use pretty syntax colors
hi LineNr ctermfg=blue
hi ColorColumn ctermbg=235      " 80th column is colored dark dark gray
hi IndentGuidesEven ctermbg=235 " indent highlight is dark dark gray
hi Folded ctermbg=none          " Folds respect terminal transparency
hi clear VertSplit              " make vert split line thinner
