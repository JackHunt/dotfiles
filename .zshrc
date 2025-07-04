# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="half-life"

DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=13

# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
  cabal
  colored-man-pages
  emacs
  git
  git-prompt
  iterm2
  safe-paste
  stack
  zsh-navigation-tools
)

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

zstyle :omz:plugins:iterm2 shell-integration yes

source $ZSH/oh-my-zsh.sh

export EDITOR='emacs'
export PATH=$PATH:/sbin:/usr/sbin

# May need to copy /usr/share/terminfo/r/rxvt-unicode to ~/.terminfo/r/rxvt-unicode
# or uncomment the following if there's terminal identification issues.
#export TERM='xterm-256color'

# Completion
autoload -U compinit
compinit

# Correction
setopt correctall

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.zsh_private
