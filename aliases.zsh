#!/bin/zsh
#
# William Falk-Wallace
# aliases.zsh
#

###################################  BASICS  ###################################
### force mv, rm and cp to ask user before clobbering file
alias mv='mv -i'
alias rm='rm -ri'
alias rmf='rm -rf' # or don't ask
alias cp='cp -i'
### editing/config
alias vim='TERM=xterm-256color vim' # TODO: Investigate this
alias vi='vim'
alias tmux='TERM=screen-256color-bce tmux' # TODO: Investigate this
### gnu overides for ls where available (via `brew install coreutils` on OSX)
if which gls &>/dev/null; then
  alias ls="gls -F --color" # TODO: Document flags
  alias l="gls -l --color" # TODO: Document flags
  alias ll="gls -AlLh --color" # TODO: Document flags
  alias la='gls -A --color' # TODO: Document flags
else
  alias ls="ls"
  alias l="ls -lG" # TODO: Document flags
  alias ll="ls -alFG" # TODO: Document flags
fi
### conveniences
alias mkdir='mkdir -pv' # TODO: Document flags
alias path='echo -e ${PATH//:/\\n}' # TODO: Document
alias ax='chmod a+x'
alias src='source ~/.zshrc'
alias zshrc='vim ~/.zshrc'
alias c='clear'
alias uphour='caffeinate -t 3600'
### typos
alias cd..='cd ..'
alias subl.='subl .'
### docs
alias doc='openManPageInChrome'

###################################  STATS  ####################################
alias ducks='du -cksh *' # TODO: Document
alias histprof="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr" # TODO: Document; split
alias now='date +"%m/%d/%y %T"' # TODO: Document
alias cpu='top -o cpu' # TODO: Document
alias mem='top -o rsize' # TODO: Document
alias lc="awk 'END{print NR}'" # line count for file
### current IP
alias ip='curl icanhazip.com'
alias ip2='curl ifconfig.me'
### wifi info
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias wifi='airport -I' # TODO: Document
alias wifiscan='airport -s' # TODO: Document

###################################  PLACES  ###################################
alias code='cd ~/code'
alias home='cd ~'
alias desk='cd ~/Desktop'

####################################  FUN  #####################################
alias starwars='telnet towel.blinkenlights.nl'

################################  APPLICATIONS  ################################
alias dash='open dash://' # dashdocs
alias stt='subl .' # st3 shortcut
### browsers:
alias chrome='open /Applications/Google\ Chrome.app'
alias chrm='chrome'
alias firefox='open -a firefox'
alias ffx='firefox'

####################################  GIT  #####################################
alias g='git'
alias h='hub'
alias st='git status'
alias comm='git commit -m'
alias cm='comm'
alias push='git push'
alias pull='git pull'
alias branches='branches'
alias brs='branches'

###################################  TOOLS  ####################################
alias serv='python -m SimpleHTTPServer 9999' # start a python server in the current directory
alias todo="awk '/TODO/ {print NR "'"\t" ($1=$2="")'" $0}'" # find all todos in src file

#################################  OSX HACKS  ##################################
# copy-paste in preview
alias qlpbon='defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder'
alias qlpboff='defaults write com.apple.finder QLEnableTextSelection -bool FALSE; killall Finder'

# show hidden files
alias showhiddenon='defaults write com.apple.finder AppleShowAllFiles true; killall Finder'
alias showhiddenoff='defaults write com.apple.finder AppleShowAllFiles false; killall Finder'

# dashboard control
alias dashoff='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias dashon='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'

# safari loading pie instead of bar
alias safaripieon='defaults write com.apple.Safari DebugUsePieProgressIndicator -bool true'
alias safaripieoff='defaults write com.apple.Safari DebugUsePieProgressIndicator -bool false'

# yosemite press and hold key repeat
alias keyrepeaton='defaults write -g ApplePressAndHoldEnabled -bool false'
alias keyrepeatoff='defaults write -g ApplePressAndHoldEnabled -bool true'
