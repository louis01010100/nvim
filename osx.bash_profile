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

export APPLICATION_PATH=/Users/louis/Applications
export GRADLE_HOME=$APPLICATION_PATH/gradle-3.0
PATH=$GRADLE_HOME/bin:$PATH
PATH=$PATH:$APPLICATION_PATH/htslib/htslib-1.3.1
PATH=$PATH:$APPLICATION_PATH/samtools/samtools-1.3.1
PATH=$PATH:$APPLICATION_PATH/bcftool/bcftools-1.3.1
PATH=$PATH:$APPLICATION_PATH/cufflinks/cufflinks-2.2.1.OSX_x86_64
PATH=/usr/local/opt/sqlite/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/louis/.sdkman"
[[ -s "/Users/louis/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/louis/.sdkman/bin/sdkman-init.sh"
