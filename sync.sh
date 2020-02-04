BIN=$HOME/bin
WORKSPACE=$HOME/workspace
DOTFILES=$PWD/`dirname $0 | sed 's|^\./||'`

function make_environment_dirs {
  mkdir -p $BIN
  mkdir -p $HOME/.bashrc.d
  mkdir -p $HOME/.vim
}

function sync_config_files {
  #Backup current $HOME/.bashrc if it exists
  test -h $HOME/.bashrc || mv $HOME/.bashrc $HOME/.bashrc.d/

  #Symlink all config files from this repo into their proper location
  local ignore_files='README.md|sync.sh|.swp|.git/'
  local sync_files=`find $DOTFILES -type f | egrep -v "($ignore_files)" | sed "s|^$DOTFILES/||"`

  for i in $sync_files; do
    ln -s $DOTFILES/$i $HOME/$i
  done
}

function setup_rsa {
  test -e $HOME/.ssh/id_rsa.pub || ssh-keygen -qf $HOME/.ssh/id_rsa -N ''
}

function setup_vim {
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
  mkdir -p $HOME/.vim/undodir
  vim -c BundleInstall -c cq
}

function sync_environment {
  make_environment_dirs
  sync_config_files
  setup_rsa
  setup_vim
}

function main {
  sync_environment &> /dev/null
  source $HOME/.bashrc
}

main
echo Remember to give $HOME/.ssh/id_rsa.pub to github
