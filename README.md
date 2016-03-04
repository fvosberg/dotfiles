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

# Neovim

Please install jshint with npm globally to use the javascript linting.
Please install phplint for php linting.
