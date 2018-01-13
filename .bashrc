export VISUAL=vim
export EDITOR="$VISUAL"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set completion-ignore-case on'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias gb="git branch"
alias gbd="git branch -D"
alias gs="git status"
alias gc="git checkout"
alias gd="git diff"
alias gcl="git clean -fd . && git checkout -- ."
alias co="git commit"
