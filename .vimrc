" #### REQUIREMENTS #####
"   git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"   mkdir ~/.vim/undodir
" #######################

" Source every vim config file in ~/.vimrc.d/
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
  exe 'source' f
endfor
