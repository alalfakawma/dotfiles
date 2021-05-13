# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/aseem/.oh-my-zsh"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Android
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk

# Add to path
export PATH=~/.yarn/bin:/$ANDROID_HOME/build-tools:$PATH

# Make nvim default editor
export EDITOR=/usr/bin/nvim
export GIT_EDITOR=/usr/bin/nvim

# Make brave default browser
export BROWSER=/usr/bin/brave

# fzf default options
export FZF_DEFAULT_OPTS="--layout=reverse"
export FZF_DEFAULT_COMMAND="find . -type d \( -name node_modules -o -name vendor -o -name .git -o -name storage \) -prune -false -o -name '*'"

# Aliases
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
alias projects="cd ~/Code/Projects"

# Open my sites directory in fzf and cd into it
function sites {
    dir=$(/usr/bin/ls ~/Code/Sites/)
    dir=$(printf '%s\n' $dir | fzf | awk '{printf "Code/Sites/%s", $1}')
    if [[ -n "$dir" ]]; then
        cd
        cd $dir
    fi
}
