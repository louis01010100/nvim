
export PATH="/usr/local/lib/default-node/bin:/usr/lib/jvm/default-java/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

export TERM=xterm-256color
. /usr/share/autojump/autojump.sh

alias ls='ls --color=auto'


#############################################################################
#                                  vi-mode                                  #
#############################################################################
KEYTIMEOUT=1
local user="%n@%m%"
local pwd="%~"
#local prompt_vicmd='%F{160}[%D{%b %d %H:%M}] ${user}\:${pwd}$%f '
#local prompt_viins='%F{245}[%D{%b %d %H:%M}] ${user}\:${pwd}$%f '
local prompt_vicmd="%F{160}${user}\:${pwd}$%f "
local prompt_viins="%F{245}${user}\:${pwd}$%f "

function zle-keymap-select zle-line-init {

    case ${KEYMAP} in
      (vicmd)      PROMPT="$prompt_vicmd";;
      (main|viins) PROMPT="$prompt_viins";;
      (*)          PROMPT="$prompt_viins";;
    esac

    zle reset-prompt
}

function zle-line-finish {
    PROMPT="$prompt_viins"
    zle reset-prompt
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line


bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

local return_code='%(?..%F{160}%? ↵%f)'

PROMPT="$prompt_viins"
RPROMPT="${return_code}"

