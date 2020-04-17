" #### REQUIREMENTS #####
" install https://github.com/Shougo/dein.vim
"   mkdir -p ~/.vim/undodir
" #######################

" Source every vim config file in ~/.vimrc.d/
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
  exe 'source' f
endfor
