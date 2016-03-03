[[ -s /etc/bashrc ]] && source /etc/bashrc

launchTmux() {
    if [[ -n $TMUX ]]; then
        return
    fi

    if [[ $(tmux ls) =~ (hskp:|no server running) ]]; then
        if [[ "${BASH_REMATCH[1]}" == 'no server running' ]]; then
            exec tmux new -s hskp
        else
            exec tmux attach -t hskp
        fi
    fi
}

launchTmux

PS1="[\u@\h:\w]$ "

source /usr/local/share/autojump/autojump.bash

source /Users/louis/Projects/dot-file/ls_colors.sh

alias ls='gls --color'

source /usr/local/etc/bash_completion.d/git-completion.bash

export NVM_DIR="/Users/louis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
