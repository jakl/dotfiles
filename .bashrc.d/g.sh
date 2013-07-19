function _g() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts=`ls $HOME/workspace`

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}
complete -F _g g

function g {
    if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        echo 'Usage:'
        echo '   g                  changes to primary workspace directory'
        echo '   g <project>        changes to specified project'
        return
    fi

    if [ -z "$HOME/workspace" ]; then
        echo 'WARNING: You dont have a $HOME/workspace directory. Running mkdir $HOME/workspace...'
        mkdir $HOME/workspace
    fi

    local DIR
    if [ -n "$1" ]; then
        DIR="$HOME/workspace/$1"
    else
        DIR="$HOME/workspace"
    fi

    if [ -d "$DIR" ]; then
        cd "$DIR"
    else
        echo "ERROR: project does not exist in $HOME/workspace: $DIR"
    fi
}