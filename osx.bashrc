

PS1="\[\033[38;5;66m\]\u@\h:\[\033[38;5;102m\]\w \[\033[00m\]\$ "
PS4=$'>\t[${BASH_SOURCE} $(printf "% 4d" ${LINENO})]  '

shopt -s globstar
shopt -s extglob

alias vi=nvim
alias vim=nvim
alias ls='ls  -G1'

#### fzf ####
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
  
# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
  
# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$(pwd)}") | fzf-tmux --tac)
  cd "$DIR"
}

execute() {
    local -r cmd="${1}"

    if [[ -z  "${cmd}" ]]; then
        printf "Usage: run \$cmd \n"
        return 1;
    fi

    [[ "${cmd}" =~ ^(.+)\.sh$ ]]

    local name="${BASH_REMATCH[1]}"

    if [[ -z "${name}" ]]; then
        name="${cmd}"
    fi

    local timeLog="${name}.time"
    local stdOutErrLog="${name}.log"

    local fullCmd="/usr/bin/time -v -o ${timeLog} bash ${cmd} &> ${stdOutErrLog} &"

    printf "${fullCmd}\n"

    eval "${fullCmd}"
}

#### Fasd ####
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache




# launchTmux() {
#     if [[ -n $TMUX ]]; then
#         return
#     fi
#
#     status="$(tmux ls 2> /dev/null)"
#
#     if [[ -z $status ]]; then
#         exec tmux new -s hskp
#     fi
#
#     if [[ $status =~ hskp: ]]; then
#         exec tmux attach -t hskp
#     fi
# }

#launchTmux

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/louis/.sdkman"
[[ -s "/Users/louis/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/louis/.sdkman/bin/sdkman-init.sh"
