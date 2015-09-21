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
nmap <silent> <C-n> :bn<CR>
" ctrl+p move to previous buffer
nmap <silent> <C-p> :bp<CR>
" ctrl+c close current buffer and go to next
nmap <silent> <C-c> :bw<CR>
" ,z fold current indentation, zR to undo
map <silent> <leader>z :let&l:fdl=indent('.')/&sw<cr>
" ,c copy current file within it's dir
map <leader>c :!cp % $(dirname %)/
" ,w save all files
map <silent> <leader>w :wa<cr>
" ,q instantly quit everything without saving
map <silent> <leader>q :qa!<cr>
" ,y yank current file's name
map <silent> <leader>y :let @" = expand("%")<cr>
" F3 toggle line numbers
nmap <F3> :set invnumber<CR>
" ,r reload this vimrc
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
" Quickly open a buffer to (j)ot down notes
map <leader>j :sp ~/chalkboard<cr>
" Search for selected text with *
vmap <silent> * :call VisualSelection('f')<CR>
" ,r Search and replace the selected text
vmap <silent> <leader>r :call VisualSelection('replace')<CR>
" K opens documentation for method name under cursor
nnoremap K :call investigate#Investigate()<cr>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" Update vim modules
map <silent> <leader>u :NeoBundleUpdate! <CR>
" Disable apostrophe ' whatever the heck it does idek, something about mark
map <silent> ' <Nop>
" :df to delete current file
" cmap df call delete(expand('%'))
" ctrl + \ to follow a ctag reference in a vertical split pane
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" ctrl + - to follow a ctag reference in a horizontal split pane
map <C-_> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
