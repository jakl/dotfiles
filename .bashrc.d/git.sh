alias gs='git status'
alias ga='git add -A'
alias gc='git commit'
alias gcg='git commit -F -'
alias gf='git fetch'
alias gd='git diff --color -w'
alias gdm='gd --diff-filter=M' #diff modified contents only, not renames or deletes
alias gds='gd --staged'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias glm='gl --author=koval'
alias glg='gl --first-parent'
alias gph='git push origin HEAD'
alias gsh='git show --date=relative --color'
alias gco='git checkout'
alias gmd='git fetch && git merge origin/deploy'
alias gmb='git fetch && git merge origin/`git symbolic-ref --short -q HEAD`' #merge a branch named after local branch, from origin
alias gms='git merge --squash'
alias gmm='git fetch && git merge origin/master'
alias gmmff='git fetch && git merge origin/master --ff-only'
alias grm='git fetch && git rebase origin/master'
alias gp='git pull'
alias gr='git reset'
