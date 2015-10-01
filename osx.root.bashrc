[[ -s /etc/bashrc ]] && source /etc/bashrc

PS1="[\u@\h:\w]# "

source /usr/local/share/autojump/autojump.bash

source /Users/louis01010100/Projects/dot-file/ls_colors.sh
alias ls='gls -A --color'

alias readlink="greadlink"

source /usr/local/etc/bash_completion.d/git-completion.bash
