# Installation

0. Install [rcm](https://github.com/thoughtbot/rcm)
0. Clone this repo to ```~/.dotfiles```
0. Change to ```~/.dotfiles```
0. ```git submodule init```
0. ```git submodule update```

At the first setup you have to initialize the dotfiles with rcm

	env RCRC=$HOME/dotfiles/rcrc rcup

If you just updated

    rcup


# Updates

0. Change to ```~/.dotfiles```
0. ```git pull origin master```
0. ```git submodule update```
0. rcup

# Installation steps for Neovim

0. Install python3
0. Upgrade pip
0. Install neovim python package via pip. ```pip3 install neovim```
0. ```:VimProcInstall CC=clang``` for vimproc
0. ```:UpdateRemotePlugins``` in Neovim
0. ```npm install -g jshint```
0. ```brew install php-code-sniffer```
0. ```npm install -g js-yaml``

Maybe you have to install the powerline patched fonts for OSX and select one of them for your terminal.

# TODOS

* Comment Plugin for VIM
* Warn lines exceeding 80/120 characters
* Snippet Plugin wich works with deoplete
* Lint self enclosed script tags
* Linting for SCSS coding guidelines not only errors
* Linting for CSS coding guidelines not only errors
* Semantic completion for JavaScript
* Semantic navigation for PHP
* Semantic completion for ruby
* Semantic navigation for ruby
* Rails plugin
