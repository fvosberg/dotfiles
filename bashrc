if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

alias ll='ls -lisahG'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bash/bin:$PATH
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=/usr/local/sbin:$PATH
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl
export DEP_OPENSSL_INCLUDE=/usr/local/opt/openssl/include
export EDITOR=vim
export VISUAL=vim
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export IGNOREEOF=2
export export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Base16 Shell
BASE16_SHELL="$HOME/.bash/colors/base16-shell/base16-solarized.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export TERM="xterm-256color"
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
