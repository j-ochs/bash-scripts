# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Aliases
alias c='clear'
alias ls='ls -GFh'
alias ll='ls -lG'
alias reset="osascript -e 'if application \"Terminal\" is frontmost then tell application \"System Events\" to keystroke \"k\" using command down'"
# Git Aliases
alias status='git status'
alias diff='git diff'
alias branch='git branch'
alias fetch='git fetch'
alias stats='git diff --stat'

search() {
        find . -name *$1*
}
alias hs='history | grep $1'

# Display git branch
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\u@\[\033[36m\]\h\[\033[33m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]\$ " #Add display of current git branch to the command line
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
