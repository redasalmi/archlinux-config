# zsh autocomplete
autoload -Uz compinit
fpath+=~/.zfunc
compinit

# autocomplete config
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

source ~/.zsh/aliases.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/keys.zsh
source ~/.zsh/plugins.zsh

# fnm
export PATH=/home/reda/.fnm:$PATH
eval "`fnm env`"

# starship
eval "$(starship init zsh)"

