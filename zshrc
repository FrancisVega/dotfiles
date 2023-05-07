# Path to your oh-my-zsh installation.
export ZSH=/Users/hisco/.oh-my-zsh

ZSH_THEME=robbyrussell
# ZSH_THEME=af-magic

# Plugins
plugins=(zsh-nvm git-open)

# Init zplug
source ~/.zplug/init.zsh
zplug 'wfxr/forgit'

# Functions
source ~/dotfiles/functions/git

# Exports
source ~/dotfiles/exports/exports

# OHMYZSH
source $ZSH/oh-my-zsh.sh

# Aliases
source ~/dotfiles/functions/misc
source ~/dotfiles/aliases/dev
source ~/dotfiles/aliases/git
source ~/dotfiles/aliases/griddo


# Import nvm
source ~/.nvm/nvm.sh

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH=/Users/hisco/.local/bin:$PATH


eval "$(zoxide init zsh)"
