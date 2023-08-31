#########
# Shell #
#########

export SHELL='/bin/zsh'

##########
# Editor #
##########

export EDITOR=vim
export BUNDLER_EDITOR=vim

##################
# Emacs Bindings #
##################

bindkey -e

########
# Path #
########

# Setting PATH for Python 3.4
# The orginal version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

###########
# History #
###########

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

########
# Brew #
########

# Give brew priority
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";


##########
# Colors #
##########

# adds the current branch name in green with path in blue
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

# makes color constants available
autoload -U colors
colors

source ~/Developer/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

# Git prompt
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '

###########
# Aliases #
###########
alias ll='ls -alG'
alias now="date '+%Y%m%d%H%M%S'"
alias epoch="date +%s"
alias mux='tmuxinator'

#########################
# Python Compiler Files #
#########################
export PYTHONDONTWRITEBYTECODE=1

######
# GO #
######
export GOPATH=~/Developer/go
export GOBIN=${GOPATH}/bin
export PATH=$PATH:~/Developer/go/bin

##########
# Docker #
##########
# echo "Docker IP: `docker-machine ip && eval $(docker-machine env)`"

###########
# Android #
###########

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

########
# Node #
########
export PATH=/usr/local/lib:$PATH

################
# Google Cloud #
################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/liam/Developer/google-cloud-sdk/path.zsh.inc' ]; then
  . '/Users/liam/Developer/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/liam/Developer/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/Users/liam/Developer/google-cloud-sdk/completion.zsh.inc';
fi

###################
# Zsh Autocomplete #
###################

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/Users/liam/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

#######
# RVM #
#######

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# The following lines were added by compinstall
