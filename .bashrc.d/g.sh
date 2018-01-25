export WORKSPACE="$HOME/workspace"

# If zsh, load bash autocomplete compat lib.
if [ -n "$ZSH_VERSION" ]; then
  autoload bashcompinit
  bashcompinit
fi

# Bash Autocompletion Function
_g() {
  local cur prev opts
  
  COMPREPLY=()

  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="$(ls ${WORKSPACE})"

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}
complete -F _g g

# G project function.
g() {
    if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
        echo 'Usage:'
        echo '   g                  cd to primary workspace directory'
        echo '   g <project>        cd to specified project'
        echo '   g <search term>    cd to closest match for search term'
        
        return
    fi

    if [ -z "$WORKSPACE" ]; then
        echo 'WARNING: You dont have a ${WORKSPACE} directory. Running mkdir ${WORKSPACE}...'
        mkdir "${WORKSPACE}"
    fi

    local DIR="${WORKSPACE}"
    if [ -n "$1" ]; then
        DIR="${WORKSPACE}/$1"
    fi

    if [ -d "$DIR" ]; then
        cd "$DIR"
    else
        # HACK multiple results are possible.
        cd $WORKSPACE/`ls $WORKSPACE | grep $1`
    fi
}
