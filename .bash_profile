alias ls="ls --color=auto"
alias qgit="git"
alias giot="git"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\e[1;91m\u\e[m\e[0;32m@\e[m\e[1;93m\h\e[m \e[1;96m\w\e[m\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
