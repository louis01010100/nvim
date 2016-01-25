export TERM=xterm-256color
export PATH=/home/louis/usr/lib/eclipse:$PATH
#PS1="${debian_chroot:+($debian_chroot)}\[\033[38;5;101m\]\u@\h\[\033[38;5;68m\] \w \$\[\033[00m\] "
PS1="\[\033[38;5;66m\]\u@\h:\[\033[38;5;102m\]\w \[\033[00m\]\$ "



source /usr/share/autojump/autojump.sh
source ~/var/prjs/dot-file/ls_colors.sh
alias ls='ls --color'
eval "$(fasd --init auto)"

shopt -s globstar
shopt -s extglob

export NVM_DIR="/home/louis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
