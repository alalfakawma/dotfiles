#! /bin/sh
# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Make vim default editor
set EDITOR /usr/bin/nvim

# Make firefox default browser
set BROWSER /usr/bin/firefox

# Add local bin to path
set PATH $PATH ~/.local/bin

# Android SDK ENV vars
set ANDROID_SDK_ROOT /opt/android-sdk
set ANDROID_HOME /opt/android-sdk
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools
set PATH $PATH $ANDROID_HOME/build-tools
set PATH $PATH /home/aseem/.cargo/bin
set PATH $PATH /usr/local/go/bin
set PATH $PATH ~/.config/composer/vendor/bin

# Add yarn bins to PATH
set PATH $PATH ~/.yarn/bin

bind "\e[25~;" ""

# fzf default options
set -gx FZF_DEFAULT_OPTS "--layout=reverse"
set -gx FZF_DEFAULT_COMMAND "find . -type d \( -name node_modules -o -name vendor -o -name .git -o -name storage \) -prune -false -o -name '*'"

# Aliases
alias gp="git push"
alias gs="git status"
alias gc="git clone"
alias gf="git fetch"
alias gi="git init"
alias gd="git diff"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glo="git log --oneline"
alias gac="git add .; git commit -m"
alias mfs="php artisan migrate:fresh --seed"
alias pas="php artisan serve"
alias nrd="npm run dev"
alias nrw="npm run watch"
alias nrs="npm run start"
alias srcfish="source /home/aseem/.config/fish/conf.d/omf.fish"
alias fishconfig="nvim /home/aseem/.config/fish/conf.d/omf.fish"
alias o="xdg-open"
alias v="nvim"
alias i3conf="nvim /home/aseem/.i3/config"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias kconf="v ~/.config/kitty/kitty.conf"
alias hosts="sudo nvim /etc/hosts"
alias t="tmux"
alias la="exa -la --git"
alias ll="exa -l --git"
alias ls="exa -l --git"
alias pwfo="pass git fetch origin"
alias pwp="pass git pull"
alias pwps="pass git push"
alias fo="fzf | xargs xdg-open"
alias fv="fzf | xargs nvim"
alias art="php artisan"
alias todos="grep --exclude={\*.{php_bak, php.bak, php_old},.tags} --exclude-dir={node_modules, vendor, metronic_assets, public, storage} -rn . -e 'TODO'"
alias sshconf="nvim ~/.ssh/config"

# Open my sites directory in fzf and cd into it
function sites
    set dir (/usr/bin/ls ~/Code/Sites/)
    set dir . $dir
    set dir (printf '%s\n' $dir | fzf | awk '{printf "Code/Sites/%s", $1}')
    if test -n "$dir" 
        cd
        cd $dir
    end
end

# Starship
starship init fish | source

# enable fzf
fzf_key_bindings
