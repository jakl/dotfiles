BIN=$HOME/bin
WORKSPACE=$HOME/workspace
GIT_BD=$WORKSPACE/git-bd
DOTFILES=$PWD/`dirname $0 | sed 's|^\./||'`

function make_environment_dirs {
  mkdir -p $BIN
  mkdir -p $GIT_BD
  mkdir -p $HOME/.bashrc.d
  mkdir -p $HOME/.vim
}

function obtain_git_new_workdir_command {
  #Copy git-new-workdir from master git repo unless it exists
  command -v git-new-workdir || curl https://raw.github.com/git/git/master/contrib/workdir/git-new-workdir > $BIN/git-new-workdir
  chmod +x $BIN/git-new-workdir
}

function sync_git_branch_dir {
  #Clone, update, and use nathan's awesome git branch directory command
  test -e $GIT_BD/git-bd || git clone https://github.com/nnutter/git-bd $GIT_BD
  git --git-dir=$GIT_BD/.git --work-tree=$GIT_BD pull
  ln -s $GIT_BD/git-bd $BIN/
  ln -s $GIT_BD/git-bd.bashrc $HOME/.bashrc.d/
}

function install_depricated_git_b_command { #TODO: delete
  curl https://raw.github.com/nnutter/git-branchdir-manager/master/setup | bash
  source $HOME/.bashrc.d/git-branchdir-manager/git-branchdir-manager.sh
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
  obtain_git_new_workdir_command
  sync_git_branch_dir
  sync_config_files
  setup_rsa
  setup_vim
}

function main {
  sync_environment &> /dev/null
  source $HOME/.bashrc
  uname -a | grep Ubuntu >/dev/null && bash $DOTFILES/ubuntu_sync.sh
  uname -a | grep MacBook >/dev/null && bash $DOTFILES/mac_sync.sh
}

main
echo Remember to give $HOME/.ssh/id_rsa.pub to github
