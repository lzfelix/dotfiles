# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/lzfelix/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="avit"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/bin/subl
# export JAVA_HOME=/usr/

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/sbin

export PATH="$PATH:/usr/local/complatex/"
export PATH="$PATH:/usr/local/opt/rabbitmq/sbin"

# Using custom Ruby env for brew. Ensure to install rbenv first
eval "$(rbenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lzfelix/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lzfelix/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/lzfelix/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lzfelix/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

plugins+=(k)

alias exp="source activate exp"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gpp="git push origin $(git rev-parse --abbrev-ref HEAD)"
alias gl="git log --oneline --graph"
