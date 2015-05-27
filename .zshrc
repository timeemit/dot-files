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

# Give brew priority
export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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
alias ll='ls -al'
alias now="date '+%Y%m%d%H%M%S'"

#########################
# Python Compiler Files #
#########################
export PYTHONDONTWRITEBYTECODE=1
export PYTHONPATH=$HOME/Developer/hydra:$HOME/Developer/hydra/core
