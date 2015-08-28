export TERM=xterm-256color
local user='%n@%m'
local pwd='%~'
local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%F{65}‹$(rvm-prompt i v g)›%f'
else
  if which rbenv &> /dev/null; then
    rvm='%F{65}‹$(rbenv version | sed -e "s/ (set.*$//")›%f'
  fi
fi
local return_code='%(?..%F{9}%? ↵%f)'
local git_branch='$(git_prompt_status)%f$(git_prompt_info)%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{65}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%F{65} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{67} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%F{130} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{96} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{185} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{109} ✭"

PROMPT="%F{102}[${user}:${pwd}]$%f "
RPROMPT="${return_code} ${git_branch} ${rvm}"

