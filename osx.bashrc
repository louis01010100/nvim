[[ -s /etc/bashrc ]] && source /etc/bashrc

PS1="[\u@\h:\w]$ "

source /usr/local/share/autojump/autojump.bash

source /Users/louis/Projects/dot-file/ls_colors.sh
alias ls='gls --color'

alias readlink="greadlink"

source /usr/local/etc/bash_completion.d/git-completion.bash

export NVM_DIR="/Users/louis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
