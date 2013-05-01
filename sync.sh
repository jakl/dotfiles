BIN=$HOME/bin
WORKSPACE=$HOME/workspace
DOTFILES=$PWD/`dirname $0`

function make_environment_dirs {
  mkdir -p $BIN
  mkdir -p $WORKSPACE/git-bd
  mkdir -p $HOME/.bashrc.d
  mkdir -p $HOME/.vim
}

function obtain_git_new_workdir_command {
  #Copy git-new-workdir from master git repo unless it exists
  command -v git-new-workdir >/dev/null || curl https://raw.github.com/git/git/master/contrib/workdir/git-new-workdir > $BIN/git-new-workdir
}

function obtain_git_branch_dir {
  #Clone and use nathan's awesome git branch directory command
  test ! -e $WORKSPACE/git-bd/git-bd && git clone https://github.com/nnutter/git-bd $WORKSPACE/git-bd
  ln -s $WORKSPACE/git-bd/git-bd $BIN/
  ln -s $WORKSPACE/git-bd/bd.bashrc $HOME/.bashrc.d/
}

function sync_config_files {
  #Backup current $HOME/.bashrc if it exists
  test ! -h $HOME/.bashrc && mv $HOME/.bashrc $HOME/.bashrc.d/

  #Symlink all config files from this repo into their proper location
  local ignore_files='README.md|sync.sh|.swp|.git/'
  local sync_files=`find . -type f | egrep -v "($ignore_files)" | sed 's|^\./||'`

  for i in $sync_files; do
    ln -s $DOTFILES/$i $HOME/$i
  done
}

function sync_environment {
  make_environment_dirs
  obtain_git_new_workdir_command
  obtain_git_branch_dir
  sync_config_files
}

sync_environment 2> /dev/null
