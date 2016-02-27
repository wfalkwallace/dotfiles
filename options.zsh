#!/bin/zsh
#
# William Falk-Wallace
# options.zsh
#

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP # TODO: Investigate this
setopt NO_LIST_BEEP # don't beep on autocomplete options list
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY # TODO: Investigate this
setopt SHARE_HISTORY # share history between sessions # TODO: Investigate this
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST # TODO: Investigate this
setopt CORRECT # TODO: Investigate this
setopt COMPLETE_IN_WORD # TODO: Investigate this
setopt IGNORE_EOF # TODO: Investigate this
setopt INC_APPEND_HISTORY  # adds history incrementally
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS # TODO: Investigate this
setopt complete_aliases # don't expand aliases _before_ completion has finished
unsetopt nomatch # if no completion matches leave unchanged, don't print error
