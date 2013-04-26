function make_environment_dirs {
  mkdir -p ~/bin
  mkdir -p ~/workspace/git-bd
  mkdir -p ~/.bashrc.d
  mkdir -p ~/.vim
}


function obtain_git_new_workdir_command {
  #Copy git-new-workdir from master git repo unless it exists
  command -v git-new-workdir >/dev/null || curl https://raw.github.com/git/git/master/contrib/workdir/git-new-workdir > ~/bin/git-new-workdir
}

function obtain_git_branch_dir {
  #Clone and use nathan's awesome git branch directory command
  test ! -e ~/workspace/git-bd && git clone https://github.com/nnutter/git-bd ~/workspace/git-bd
  ln -s ~/workspace/git-bd/git-bd ~/bin/ 2>/dev/null
  ln -s ~/workspace/git-bd/bd.bashrc ~/.bashrc.d 2>/dev/null
}

function sync_config_files {
  #Backup current ~/.bashrc if it exists
  test ! -h ~/.bashrc && mv ~/.bashrc ~/.bashrc.d

  #Symlink all config files from this repo into their proper location
  local ignore_files='README.md|sync.sh|.swp|.git/'
  local sync_files=`find . -type f | egrep -v "($ignore_files)" | sed 's|^\./||'`
  local basedir=`dirname $0`

  for i in $sync_files; do
    ln -s $basedir/$i ~/$i 2>/dev/null
  done
}

function sync_environment {
  make_environment_dirs
  obtain_git_new_workdir_command
  obtain_git_branch_dir
  sync_config_files
}

sync_environment
