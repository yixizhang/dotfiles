export VISUAL=vim
export EDITOR="$VISUAL"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set completion-ignore-case on'

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias gb="git branch"
alias gbd="git branch -D"
alias gs="git status"
alias gc="git checkout"
alias gd="git diff"
alias gl="git log"
alias gcl="git clean -fd . && git checkout -- ."
alias gg="git grep"
alias co="git commit"
