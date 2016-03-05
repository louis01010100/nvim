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
PS4=$'>\t[${BASH_SOURCE} $(printf "% 4d" ${LINENO})]  '

shopt -s globstar
shopt -s extglob

alias gls='gls --color=auto'
alias vi=nvim
alias vim=nvim

colorConfig=(
    'rs=0:'
    'di=00;38;5;67:'
    'ln=00;38;5;109:'
    'mh=00;38;5;230:'
    'pi=00;38;5;185:'
    'pi=00;38;5;185:'
    'so=00;38;5;96:'
    'do=00;38;5;96:'
    'bd=00;38;5;185:'
    'cd=00;38;5;185:'
    'or=0;38;5;9:'
    'mi=0;48;5;88;38;5;230:'
    'su=37;41:'
    'sg=30;43:'
    'ca=30;41:'
    'tw=30;42:'
    'ow=34;42:'
    'st=37;44:'
    'ex=00;38;5;65:'
    '*.tar=00;38;5;166:'
    '*.tgz=00;38;5;166:'
    '*.arj=00;38;5;166:'
    '*.taz=00;38;5;166:'
    '*.lzh=00;38;5;166:'
    '*.lzma=00;38;5;166:'
    '*.tlz=00;38;5;166:'
    '*.txz=00;38;5;166:'
    '*.zip=00;38;5;166:'
    '*.z=00;38;5;166:'
    '*.Z=00;38;5;166:'
    '*.dz=00;38;5;166:'
    '*.gz=00;38;5;166:'
    '*.lz=00;38;5;166:'
    '*.xz=00;38;5;166:'
    '*.bz2=00;38;5;166:'
    '*.bz=00;38;5;166:'
    '*.tbz=00;38;5;166:'
    '*.tbz2=00;38;5;166:'
    '*.tz=00;38;5;166:'
    '*.deb=00;38;5;166:'
    '*.rpm=00;38;5;166:'
    '*.jar=00;38;5;166:'
    '*.war=00;38;5;166:'
    '*.ear=00;38;5;166:'
    '*.sar=00;38;5;166:'
    '*.rar=00;38;5;166:'
    '*.ace=00;38;5;166:'
    '*.zoo=00;38;5;166:'
    '*.cpio=00;38;5;166:'
    '*.7z=00;38;5;166:'
    '*.rz=00;38;5;166:'
    '*.jpg=00;38;5;96:'
    '*.jpeg=00;38;5;96:'
    '*.gif=00;38;5;96:'
    '*.bmp=00;38;5;96:'
    '*.pbm=00;38;5;96:'
    '*.pgm=00;38;5;96:'
    '*.ppm=00;38;5;96:'
    '*.tga=00;38;5;96:'
    '*.xbm=00;38;5;96:'
    '*.xpm=00;38;5;96:'
    '*.tif=00;38;5;96:'
    '*.tiff=00;38;5;96:'
    '*.png=00;38;5;96:'
    '*.svg=00;38;5;96:'
    '*.svgz=00;38;5;96:'
    '*.mng=00;38;5;96:'
    '*.pcx=00;38;5;96:'
    '*.mov=00;38;5;96:'
    '*.mpg=00;38;5;96:'
    '*.mpeg=00;38;5;96:'
    '*.m2v=00;38;5;96:'
    '*.mkv=00;38;5;96:'
    '*.webm=00;38;5;96:'
    '*.ogm=00;38;5;96:'
    '*.mp4=00;38;5;96:'
    '*.m4v=00;38;5;96:'
    '*.mp4v=00;38;5;96:'
    '*.vob=00;38;5;96:'
    '*.qt=00;38;5;96:'
    '*.nuv=00;38;5;96:'
    '*.wmv=00;38;5;96:'
    '*.asf=00;38;5;96:'
    '*.rm=00;38;5;96:'
    '*.rmvb=00;38;5;96:'
    '*.flc=00;38;5;96:'
    '*.avi=00;38;5;96:'
    '*.fli=00;38;5;96:'
    '*.flv=00;38;5;96:'
    '*.gl=00;38;5;96:'
    '*.dl=00;38;5;96:'
    '*.xcf=00;38;5;96:'
    '*.xwd=00;38;5;96:'
    '*.yuv=00;38;5;96:'
    '*.cgm=00;38;5;96:'
    '*.emf=00;38;5;96:'
    '*.axv=00;38;5;96:'
    '*.anx=00;38;5;96:'
    '*.ogv=00;38;5;96:'
    '*.ogx=00;38;5;96:'
    '*.aac=00;38;5;109:'
    '*.au=00;38;5;109:'
    '*.flac=00;38;5;109:'
    '*.mid=00;38;5;109:'
    '*.midi=00;38;5;109:'
    '*.mka=00;38;5;109:'
    '*.mp3=00;38;5;109:'
    '*.mpc=00;38;5;109:'
    '*.ogg=00;38;5;109:'
    '*.ra=00;38;5;109:'
    '*.wav=00;38;5;109:'
    '*.axa=00;38;5;109:'
    '*.oga=00;38;5;109:'
    '*.spx=00;38;5;109:'
    '*.xspf=00;38;5;109:'
)

export LS_COLORS="$(echo "${colorConfig[*]}" | tr -d ' ')"

#### Fasd ####
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

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
export NVM_DIR="/Users/louis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GRADLE_HOME=~/Applications/gradle-2.11
export PATH=$PATH:$GRADLE_HOME/bin
