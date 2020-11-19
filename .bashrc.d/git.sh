alias gs='git status'
alias ga='git add -A'
alias gc='git commit'
alias gf='git fetch'
alias gd='git diff --color -w --no-prefix'
alias gdm='gd --diff-filter=M' #diff modified contents only, not renames or deletes
alias gds='gd --staged'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias glm='gl --author=koval'
alias glg='gl --first-parent'
alias gph='git push origin HEAD'
alias gsh='git show --date=relative --color --no-prefix'
alias gco='git checkout'
alias gmb='git fetch && git merge origin/`git symbolic-ref --short -q HEAD`' #merge a branch named after local branch, from origin
alias gb='git branch'
# Don't forget about git remote prune origin to cleanup local history of remote branches
alias gmyremotebranches='git for-each-ref --sort=committerdate --format="%(committerdate) %09 %(authorname) %09 %(refname)" refs/remotes | grep Koval'
