#!/bin/bash
#
# William Falk-Wallace
# .bash_aliases
#

###################################  BASICS  ###################################
### force mv, rm and cp to ask user before clobbering file
alias mv="mv -i $*"
alias rm="rm -ri $*"
alias rmf="rm -r $*" # or don't ask
alias cp="cp -i $*"

alias mkdir='mkdir -pv $*'
alias ll="ls -alFG $*"
### conveniences
alias path='echo -e ${PATH//:/\\n}'
alias ax="chmod a+x $*"
alias src="source ~/.bash_profile"
alias c='clear'
alias uphour='caffeinate -t 3600'
### typos
alias cd..='cd ..'
### docs
alias doc="openManPageInChrome $*"
alias bro="bwana $*"


###################################  STATS  ####################################
alias ducks='du -cksh *'
alias histprof="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias now='date +"%m/%d/%y %T"'
alias cpu='top -o cpu'
alias mem='top -o rsize'
alias cal12='cal 6 2015'

### current IP
alias ip='curl icanhazip.com'
alias ip2='curl ifconfig.me'

### wifi info
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias wifi='airport -I'
alias wifiscan='airport -s'

alias speed='speedtest --simple' # CLI-speedtest
alias lc="awk 'END{print NR}' $*" # line count for file


###################################  PLACES  ###################################
alias code='cd ~/Documents/code'
alias eclipse='cd ~/Documents/eclipse/workspace'
alias home='cd ~'
alias desk='cd ~/Desktop'


####################################  FUN  #####################################
alias starwars='telnet towel.blinkenlights.nl'
alias matrix='matrixish.sh'


################################  APPLICATIONS  ################################
alias mou='open /Applications/Mou.app/ $*' # mou md editor
alias dash='open dash://$*' # dashdocs
alias stt='subl .' # st3 shortcut

# browsers:
alias chrm='open /Applications/Google\ Chrome.app'
alias ffx='open -a firefox'


####################################  GIT  #####################################
alias g='git  $*'
alias h='hub $*'
alias st='git status'
alias comm='git commit -m $*'
alias cm='comm $*'
alias push='git push $*'
alias pull='git pull $*'
alias branches='branches'
alias brs='branches'


###################################  TOOLS  ####################################
alias r='rails $*'
alias startredis='redis-server /usr/local/etc/redis.conf'
alias t='todo.sh -d ~/.todo.cfg  $*' # todoTXT
alias serv='python -m SimpleHTTPServer 8000' # start a python server in the current directory
alias todo="awk '/TODO/ {print NR "'"\t" ($1=$2="")'" $0}' $*" # find all todos in src file
alias bcs='brew cask search  $*' # Brew cask
alias gitjk="history 10 | tac | gitjk_cmd" # gitjk: https://github.com/mapmeld/gitjk#gitjk
alias fuck='eval $(thefuck $(fc -ln -1))' # https://github.com/nvbn/thefuck

# Betty
alias betty='~/Documents/code/scripts/3P/betty/main.rb  $*'
alias mybetty='~/Documents/code/betty/main.rb  $*'

# Node stuff
alias bode='babel-node --stage 1  $*'
alias bodemon='nodemon --exec babel-node -- --optional strict --stage 1 --  $*'


#################################  OSX TRICKS  #################################
# copy-paste in preview
alias qlpbon='defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder'
alias qlpboff='defaults write com.apple.finder QLEnableTextSelection -bool FALSE; killall Finder'

# show hidden files
alias showhiddenon='defaults write com.apple.finder AppleShowAllFiles true; killall Finder'
alias showhiddenoff='defaults write com.apple.finder AppleShowAllFiles false; killall Finder'

# dashboard control
alias dashoff='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias dashon='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'

alias safaripieon'defaults write com.apple.Safari DebugUsePieProgressIndicator -bool true'
alias safaripieoff'defaults write com.apple.Safari DebugUsePieProgressIndicator -bool false'
