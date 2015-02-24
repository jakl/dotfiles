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
NeoBundle  'thoughtbot/vim-rspec'             "  ,f runs rspec on current file
NeoBundle  'tpope/vim-dispatch'               "  Run async commands in tmux splits
"NeoBundle  'Shougo/neocomplete.vim'           "  Faster autocomplete - requires +lua
NeoBundle  'kchmck/vim-coffee-script'         "  highlight
NeoBundle  'mustache/vim-mustache-handlebars' "  highlight
NeoBundle  'digitaltoad/vim-jade'             "  highlight
NeoBundle  'wavded/vim-stylus'                "  highlight
NeoBundle  'derekwyatt/vim-scala'             "  highlight
NeoBundle  'pangloss/vim-javascript'          "  highlight
NeoBundle  'jelera/vim-javascript-syntax', {
   \ 'autoload':{'filetypes':['javascript']}} "  highlight
NeoBundle  'vim-ruby/vim-ruby'                "  highlight
NeoBundle  'vim-scripts/confluencewiki.vim'   "  highlight
NeoBundle  'slim-template/vim-slim'           "  highlight
NeoBundle  'tpope/vim-repeat'                 "  bugfix
NeoBundle  'tmhedberg/matchit'                "  bugfix
NeoBundle  'kana/vim-textobj-user'            "  support new text objects
NeoBundle  'kana/vim-textobj-line'            "  select line: vil
NeoBundle  'tpope/vim-rails'                  "  shortcuts for navigating/generating rails files
NeoBundle  'Shougo/vimfiler.vim'              "  better file browser
NeoBundle  'nathanaelkane/vim-indent-guides'  "  color indents
NeoBundle  'vim-scripts/bufkill.vim'          "  :BD delete buffer without closing split
NeoBundle  'Keithbsmiley/investigate.vim'     "  open documentation from code
NeoBundle  'vim-scripts/closetag.vim'         "  close xml tags with ctrl+_
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
