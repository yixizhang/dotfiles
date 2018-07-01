export VISUAL=vim
export EDITOR="$VISUAL"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set completion-ignore-case on'

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

alias gb="git branch"
alias gbd="git branch -D"
alias gs="git status"
alias gc="git checkout"
alias gd="git diff"
alias gl="git log"
alias gcl="git clean -fd . && git checkout -- ."
alias gg="git grep"
alias co="git commit"
