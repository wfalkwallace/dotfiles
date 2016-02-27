#!/bin/zsh
#
# William Falk-Wallace
# keybindings.zsh
#

bindkey '^[^[[D' backward-word # TODO: Investigate this
bindkey '^B' backward-word # TODO: Investigate this
bindkey ';5D' backward-word # ^left # TODO: Investigate this
bindkey '^[^[[C' forward-word # TODO: Investigate this
bindkey '^F' forward-word # TODO: Investigate this
bindkey ';5C' forward-word # ^right # TODO: Investigate this
bindkey '^[[5D' beginning-of-line # TODO: Investigate this
bindkey '^a' beginning-of-line # TODO: Investigate this
bindkey '^[[5C' end-of-line # TODO: Investigate this
bindkey '^e' end-of-line # TODO: Investigate this
bindkey '^[[3~' delete-char # TODO: Investigate this
bindkey '^[^N' newtab # TODO: Investigate this
bindkey '^?' backward-delete-char # TODO: Investigate this
bindkey '^r' history-incremental-search-backward # TODO: Investigate this
bindkey '^R' history-incremental-search-backward # TODO: Investigate this
bindkey '^u' backward-kill-line
# bindkey -v # vim mode # TODO: Investigate this

# C-x C-e to edit
autoload -U edit-command-line # TODO: Investigate this
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line


