export TERM=screen-256color

[[ -f ~/.bashrc ]] && source ~/.bashrc

if [[ -d ~/.bash_profile.d ]]; then
    for file in ~/.bash_profile.d/*; do
        source $file
    done
fi

export NVM_DIR="/Users/louis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#export GRADLE_HOME=~/Applications/gradle-2.11

export PYENV_ROOT=/usr/local/var/pyenv   # default is ~/.pyenv

if which pyenv > /dev/null; then 
    eval "$(pyenv init -)"; 
fi

export PATH=$PATH:$GRADLE_HOME/bin
PATH=$PATH:/Users/louis/Applications/htslib/htslib-1.3.1
PATH=$PATH:/Users/louis/Applications/samtools/samtools-1.3.1
PATH=$PATH:/Users/louis/Applications/bcftool/bcftools-1.3.1
PATH=$PATH:/Users/louis/Applications/cufflinks/cufflinks-2.2.1.OSX_x86_64
PATH=/usr/local/opt/sqlite/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
