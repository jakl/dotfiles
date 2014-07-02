" bugfix, crontab must be edited in place
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

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
  au BufRead,BufNewFile *.slim set filetype=slim
  au BufRead,BufNewFile *.scss set filetype=css
augroup END

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
