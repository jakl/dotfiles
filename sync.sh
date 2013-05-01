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
}

function sync_git_branch_dir {
  #Clone, update, and use nathan's awesome git branch directory command
  test ! -e $GIT_BD/git-bd && git clone https://github.com/nnutter/git-bd $GIT_BD
  git --git-dir=$GIT_BD/.git --work-tree=$GIT_BD pull
  ln -s $GIT_BD/git-bd $BIN/
  ln -s $GIT_BD/bd.bashrc $HOME/.bashrc.d/
}

function sync_config_files {
  #Backup current $HOME/.bashrc if it exists
  test ! -h $HOME/.bashrc && mv $HOME/.bashrc $HOME/.bashrc.d/

  #Symlink all config files from this repo into their proper location
  local ignore_files='README.md|sync.sh|.swp|.git/'
  local sync_files=`find $DOTFILES -type f | egrep -v "($ignore_files)" | sed "s|^$DOTFILES/||"`

  for i in $sync_files; do
    ln -s $DOTFILES/$i $HOME/$i
  done
}

function sync_environment {
  make_environment_dirs
  obtain_git_new_workdir_command
  sync_git_branch_dir
  sync_config_files
}

sync_environment &> /dev/null
