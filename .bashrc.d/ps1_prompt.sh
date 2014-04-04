GIT_PS1_SHOWDIRTYSTATE=1
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ (\1)/'
}
get_dir() {
  pwd | sed -e 's/.*\///'
}
get_box() {
    uname -n | sed -e 's/\..*//'
}

#make the input line in the terminal only show the deepest dir and git info
PS1="😺  \$(whoami)@\$(get_box):\$(get_dir) 😸  "
PS1="\[\033[G\]$PS1" # left align prompt, WARNING: will overwrite output that doesn't end in a newline
