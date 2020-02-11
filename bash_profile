##################
##### COLORS #####
##################
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export EDITOR=/usr/bin/vim

###################
##### ALIASES #####
###################
alias eb='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
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
alias cdjd='cd ~/git/jive-desktop/'
alias cdjw='cd ~/git/jiveweb/'
alias cdg='cd ~/git/'
alias jw='npm run start'
alias jd='yarn start'
alias vsc='code .'

#######################
##### GIT ALIASES #####
#######################
alias ga='alias | grep git'
alias s='git status && git diff --stat'
alias status='git status'
alias diff='git diff'
alias branch='git branch'
alias b='git branch'
alias fetch='git fetch'
alias stat='git status -s'
alias stats='git diff --stat'
alias stash='git stash'
alias gl='git log'
alias co='git checkout'
alias grbm='git rebase -i origin/master'
alias remote='git remote -v'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias pull='git pull'
alias add='git add .'
alias amend='git commit --amend --no-edit --date=1.seconds.ago'
# force-push to origin/<currentBranch>
current_git_branch=$(git rev-parse --abbrev-ref HEAD)
alias gfpo='git push -f origin $current_git_branch'

#####################
##### FUNCTIONS #####
#####################

# Recursive search for filename from current location
search() {
        find . -name "*$1*"
}
# Recursive search by file extension from current location
fbe() {
        find . -name "*.$1"
}

# print the current git branch name
printCurrentBranch() { git rev-parse --abbrev-ref HEAD; }

# open the current branch in Github
githubOpen() { open "https://github.com/<OWNER>/<REPO>/compare/$(printCurrentBranch)"; }

# Display git branch
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Add display of current git branch to the command line
export PS1="[\u@\[\033[36m\]\h\[\033[33m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]\$ "
# Add git autocompletion
if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
        # Add git autocompletion for aliases
        __git_complete co _git_checkout
fi
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
