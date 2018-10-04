##### COLORS #####
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export EDITOR=/usr/bin/vim

##### ALIASES ######
alias c='clear'
alias sl='ls'
alias l='ls'
alias ls='ls -GFh'
alias ll='ls -lG'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias vi='vim'
alias reset="osascript -e 'if application \"Terminal\" is frontmost then tell application \"System Events\" to keystroke \"k\" using command down'"
alias hs='history | grep $1'
alias f='open -a Finder ./'
alias numFiles='echo $(ls -1 | wc -l)'
alias cdg='cd ~/git/'

##### GIT ALIASES #####
alias status='git status'
alias diff='git diff'
alias branch='git branch'
alias fetch='git fetch'
alias stats='git diff --stat'
alias co='git checkout'

##### FUNCTIONS ######
# Recursive search for filename from current location
search() {
        find . -name "*$1*"
}
# Recursive search by file extension from current location
fbe() {
        find . -name "*.$1"
}

# Display git branch
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Add display of current git branch to the command line
export PS1="[\u@\[\033[36m\]\h\[\033[33m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]\$ "
# Add git autocompletion --- requires ~/.git-completion.bash file
if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
        # Add git autocompletion for aliases
        __git_complete co _git_checkout
fi
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
