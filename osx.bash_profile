export TERM=screen-256color

[[ -f ~/.bashrc ]] && source ~/.bashrc
[[ -f ~/.bash_profile.d ]] && source ~/.bash_profile.d/*

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
