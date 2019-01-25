#! /bin/sh
# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Make vim default editor
set EDITOR /usr/bin/vim

# Add local bin to path
set PATH $PATH ~/.local/bin

# Android SDK ENV vars
set ANDROID_HOME /opt/android-sdk
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools
set PATH $PATH $ANDROID_HOME/build-tools

bind "\e[25~;" ""

# Aliases
alias gp="git push"
alias gc="git clone"
alias gf="git fetch"
alias gi="git init"
alias gac="git add .; git commit -m"
alias hosts="sudo vim /etc/hosts"
alias nrd="npm run dev"
alias nrw="npm run watch"
alias nrs="npm run start"
alias srcfish="source /home/aseem/.config/fish/conf.d/omf.fish"
alias fishconfig="v /home/aseem/.config/fish/conf.d/omf.fish"
alias o="xdg-open"
alias v="vim"
alias s="subl"
alias awsconfig="v /home/aseem/.aws/config"
alias i3conf="v /home/aseem/.i3/config"
alias vimrc="v ~/.vimrc"
alias gentags="ctags -R -f .tags --PHP-kinds=cfi --languages=php"
alias pas="php artisan serve"
