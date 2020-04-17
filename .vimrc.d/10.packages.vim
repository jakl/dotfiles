"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/unite.vim') "  powerful & interactive entity listings
  call dein#add('itchyny/lightline.vim') "  Better status bars
  call dein#add('danro/rename.vim') "  :Rename new_file_name
  call dein#add('rking/ag.vim') "  :Ag 'file search regex in quotes ..\w*..'
  call dein#add('tpope/vim-surround') "  cs'<div> changes single quotes to div tags
  call dein#add('tomtom/tcomment_vim') "  gc toggles comments
  call dein#add('thoughtbot/vim-rspec') "  ,f runs rspec on current file
  call dein#add('tpope/vim-dispatch') "  Run async commands in tmux splits
  "call dein#add('Shougo/neocomplete.vim') "  Faster autocomplete - requires +lua
  call dein#add('kchmck/vim-coffee-script') "  highlight
  call dein#add('mustache/vim-mustache-handlebars') "  highlight
  call dein#add('digitaltoad/vim-jade') "  highlight
  call dein#add('wavded/vim-stylus') "  highlight
  call dein#add('derekwyatt/vim-scala') "  highlight
  call dein#add('pangloss/vim-javascript') "  highlight
  call dein#add('jelera/vim-javascript-syntax', {
        \ 'autoload':{'filetypes':['javascript']}}) "  highlight
  call dein#add('vim-ruby/vim-ruby') "  highlight
  call dein#add('vim-scripts/confluencewiki.vim') "  highlight
  call dein#add('slim-template/vim-slim') "  highlight
  call dein#add('tpope/vim-repeat') "  bugfix
  call dein#add('tmhedberg/matchit') "  bugfix
  call dein#add('kana/vim-textobj-user') "  support new text objects
  call dein#add('kana/vim-textobj-line') "  select line: vil
  call dein#add('tpope/vim-rails') "  shortcuts for navigating/generating rails files
  call dein#add('Shougo/vimfiler.vim') "  better file browser
  call dein#add('nathanaelkane/vim-indent-guides') "  color indents
  call dein#add('vim-scripts/bufkill.vim') "  :BD delete buffer without closing split
  call dein#add('Keithbsmiley/investigate.vim') "  open documentation from code
  call dein#add('vim-scripts/closetag.vim') "  close xml tags with ctrl+_
  call dein#add('mattn/flappyvird-vim') "  flappy bird

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
"

"Neo Bundle is gone, replaced with dein, but maybe this below stuff could be
"useful someday to look into
"
" asyn-background job support
"NeoBundle 'Shougo/vimproc', {
"      \ 'build' : {
"      \     'windows' : 'make -f make_mingw32.mak',
"      \     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }
"NeoBundleCheck " auto install above packages
" Some day check out these
"NeoBundle 'vim-scripts/dbext.vim'            " database adapter
"NeoBundle 'vim-scripts/SQLUtilities.vim'     " database adapter
"NeoBundle 'tpope/vim-fugitive'               " git integration
"NeoBundle 'junegunn/fzf'                     " fuzzy-finder written in Go, faster than unite?
