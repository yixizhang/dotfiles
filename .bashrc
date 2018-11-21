export VISUAL=vim
export EDITOR="$VISUAL"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set completion-ignore-case on'

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

alias gb="git branch"
alias gbd="git branch -D"
alias gc="git checkout"
alias gcl="git clean -fd . && git checkout -- ."
alias gd="git diff"
alias gg="git grep -IPn --color"
alias gl="git log"
alias gp="git pull && git fetch --prune"
alias gr="grep -rIPn --color"
alias gs="git status"
alias co="git commit"
alias cat=bat
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
