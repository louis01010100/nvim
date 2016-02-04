export TERM=xterm-256color

PS1="\[\033[38;5;66m\]\u@\h:\[\033[38;5;102m\]\w \[\033[00m\]\$ "

source ~/.dot-file/ls_colors.sh
alias ls='ls --color'

#### fasd ####
eval "$(fasd --init auto)"

shopt -s globstar
shopt -s extglob

export NVM_DIR="/home/louis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -f ~/Applications/fzf-extras/fzf-extras.sh ]] && source ~/Applications/fzf-extras/fzf-extras.sh
