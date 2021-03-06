if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

alias ll='ls -lisahG'
alias ..='cd ..'
alias :q="exit"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bash/bin:$PATH
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:/Library/TeX/texbin
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl
export DEP_OPENSSL_INCLUDE=/usr/local/opt/openssl/include
export EDITOR=vim
export VISUAL=vim
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export IGNOREEOF=2
export export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
export CDPATH=$GOPATH/src

# Base16 Shell
#BASE16_SHELL="$HOME/.bash/colors/base16-shell/base16-solarized.light.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export TERM="xterm-256color"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
alias tmux="tmux -2"

# gnu utils from homebrew
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

fortune | cowsay

#### PROMPT
# Get the Git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

last_two_directories() {
	echo -n "${PWD/#$HOME/~}" | awk -F "/" '{
	if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF;
	else if (NF>3) print $1 "/" $2 "/.../" $NF;
	else print $1 "/.../" $NF; }
	else print $0;}'
}

# Custom bash prompt
#
# Includes custom character for the prompt, path, and Git branch name.
#
# Source: kirsle.net/wizards/ps1.html
PS1="\n\u@\h \[$(tput bold)\]\[$(tput setaf 5)\]➜ \[$(tput setaf 6)\] \$(last_two_directories)\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi
