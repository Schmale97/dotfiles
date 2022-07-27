##### Set Variables For Interactive Shell #####
# Set path to homebrew bundle file
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
# Set default command to bat instead of cat
export NULLCMD=bat
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export NVM_DIR="$HOME/.nvm"
###############################################

############# Change ZSH Options ##############
# Adjust History Variables & Options
[[ -z $HISTFILE ]] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000 # Session Memory Limit
SAVEHIST=4000 # File Memory Limit
setopt histNoStore
setopt extendedHistory
setopt histIgnoreAllDups
# setopt appendHistory # explicit and unnecessary
setopt incAppendHistoryTime

# Line Editor Options (Completion, Menu, Directory, etc.)
# autoMenu & autoList are on by default
setopt autoCd
setopt globDots
###############################################


############### Create Aliases ################
alias ls='exa'
alias exa='exa -laFh --git'
alias trail='<<<${(F)path}'
alias ftrail='<<<${(F)fpath}'
alias rm=trash
alias bbd="brew bundle dump --force --describe"
# Load history into shell (shareHistory alternative)
alias lh='fc -RI; echo "loaded and showing..."; history;'
alias npm="$DOTFILES/npm.zsh"
###############################################

### Add Locations to $PATH Variable

path=(
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# Remove duplicates from path
typeset -U path

############### Use ZSH Plugins ###############
# Load statically generatted antibody 
source $DOTFILES/zsh_plugins.zsh
# Remove duplicates from fpath
typeset -U fpath

# Configure key bindings for history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
###############################################

eval "$(starship init zsh)"
TMOUT=10
TRAPALRM() {
    zle reset-prompt
}

### OTHER




