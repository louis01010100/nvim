export TERM=xterm-256color

launchTmux() {
    if [[ -n $TMUX ]]; then
        return
    fi

    status="$(tmux ls 2> /dev/null)"

    if [[ -z $status ]]; then
        exec tmux new -s hskp
    fi

    if [[ $status =~ hskp: ]]; then
        exec tmux attach -t hskp
    fi
}

launchTmux

PS1="\[\033[38;5;66m\]\u@\h:\[\033[38;5;102m\]\w \[\033[00m\]\$ "

export PS4=$'>\t[${BASH_SOURCE} $(printf "% 4d" ${LINENO})]  '

source ~/.dot-file/ls_colors.sh
alias ls='ls --color'
alias vi='nvim'

#### fasd ####
eval "$(fasd --init auto)"

shopt -s globstar
shopt -s extglob

export NVM_DIR="/home/louis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/Applications/gradle-2.11/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -f ~/Applications/fzf-extras/fzf-extras.sh ]] && source ~/Applications/fzf-extras/fzf-extras.sh
