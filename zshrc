# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export MYVIMRC="/home/lailen-dev/.config/nvim/init.lua"

export BROWSER=/usr/bin/brave

export EDITOR=/usr/bin/nvim

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias gp="git push"
alias gs="git status"
alias gc="git clone"
alias gf="git fetch"
alias gi="git init"
alias gd="git diff -- . ':(exclude)public/*'"
alias gda="git diff"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glo="git log --oneline"
alias gac="git add .; git commit -m"
alias mfs="php artisan migrate:fresh --seed"
alias pas="php artisan serve"
alias nrd="npm run dev"
alias nrw="npm run watch"
alias nrs="npm run start"
alias nrh="npm run hot"
alias srczsh="source ~/.zshrc"
alias zshconfig="nvim ~/.zshrc"
alias o="xdg-open"
alias v="nvim"
alias i3conf="nvim /home/lailen-dev/.config/i3/config"
alias vimrc="nvim ~/.config/nvim/init.lua"
alias kconf="v ~/.config/kitty/kitty.conf"
alias hosts="sudo nvim /etc/hosts"
alias t="tmux"
alias la="exa --icons -la --git"
alias ll="exa --icons -l --git"
alias ls="exa --icons -l --git"
alias art="php artisan"
alias sshconf="nvim ~/.ssh/config"
alias projects="cd ~/Code/Projects"
alias lg="lazygit"
alias cd="z"

# Open my sites directory in fzf and cd into it
function p {
    dir=$(/usr/bin/ls ~/Code/)
    dir=$(printf '%s\n' $dir | fzf | awk '{printf "Code/%s", $1}')
    if [[ -n "$dir" ]]; then
        cd
        cd $dir
    fi
}

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Android
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk

export PATH=$ANDROID_HOME/build-tools:$PATH

# Add composer bin to path
export PATH=/home/lailen-dev/.config/composer/vendor/bin:$PATH

# Add cargo bin to path
export PATH=/home/lailen-dev/.cargo/bin:$PATH

source /usr/share/fzf/key-bindings.zsh

export PHPENV_ROOT="/home/lailen-dev/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

# ZSH Config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold,underline"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
