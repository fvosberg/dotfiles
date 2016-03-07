# Installation

0. Install [rcm](https://github.com/thoughtbot/rcm)
0. Clone this repo to ```~/.dotfiles```
0. Change to ```~/.dotfiles```
0. ```git submodules init```
0. ```git submodules update```

At the first setup you have to initialize the dotfiles with rcm

	env RCRC=$HOME/dotfiles/rcrc rcup

If you just updated

    rcup


# Updates

0. Change to ```~/.dotfiles```
0. ```git pull origin master```
0. ```git submodules update```
0. rcup

# Installation steps for Neovim

0. Install python3
0. Upgrade pip
0. Install neovim python package via pip. ```pip3 install neovim```
0. ```:UpdateRemotePlugins``` in Neovim
0. ```npm install -g jshint```
0. Install phplint for php linting: ```brew install phplint```
0. ```npm install -g js-yaml``

# TODOS

* Comment Plugin for VIM
* Snippet Plugin wich works with deoplete
* Lint self enclosed script tags
* Linting for PHP coding guidelines not only errors
* Linting for SCSS coding guidelines not only errors
* Linting for CSS coding guidelines not only errors
* Semantic completion for JavaScript
* Semantic completion for PHP
* Semantic navigation for PHP
* Semantic completion for ruby
* Semantic navigation for ruby
* Rails plugin
