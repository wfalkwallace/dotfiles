# William Falk-Wallace
# .bash_aliases
#

################################################################################
### BASICS
# force mv, rm and cp to ask user before clobbering file
alias mv="mv -i $*"
alias rm="rm -ri $*"
alias cp="cp -i $*"

alias ll="ls -alFG $*"
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias ax="chmod a+x"
alias src="source ~/.bash_profile"
alias c='clear'
alias cd..='cd ..'
alias home='cd ~'
alias desk='cd ~/Desktop'
alias ducks='du -cksh *'
alias histprof="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias doc="openManInChrome $*"
alias bro="bwana $*"
################################################################################
### STATS
alias now='date +"%m/%d/%y %T"'
alias cpu='top -o cpu'
alias mem='top -o rsize'
alias cal12='cal 12 2013'
alias uphour='caffeinate -t 3600'

# current IP
alias ip='curl icanhazip.com'
alias ip2='curl ifconfig.me'

# wifi info
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias wifi='airport -I'
alias wifiscan='airport -s'

# CLI-speedtest
alias speed='speedtest --simple'

# line count for file
alias lc="awk 'END{print NR}' $*"
################################################################################
### PLACES
alias code='cd ~/Documents/code'
alias eclipse='cd ~/Documents/eclipse/workspace'
################################################################################
### FUN
alias starwars='telnet towel.blinkenlights.nl'
alias matrix='matrixish.sh'
################################################################################
### APPLICATIONS
alias mou='open /Applications/Mou.app/ $*'
alias t='todo.sh -d ~/.todo.cfg'

# browsers:
alias chrm='open /Applications/Google\ Chrome.app'
alias ffx='open -a firefox'

# dashdocs
alias dash='open dash://$*'

# st3 shortcut
alias stt='subl .'
################################################################################
### GIT
alias g='git'
alias h='hub'
alias st='git status'
alias comm='git commit -m $*'
alias push='git push'
alias pull='git pull'
################################################################################
###TOOLS
alias r='rails'
alias startredis='redis-server /usr/local/etc/redis.conf'

# start a python server in the current directory
alias serv='python -m SimpleHTTPServer 8000'

# find all todos in src file
alias todo="awk '/TODO/ {print NR "'"\t" ($1=$2="")'" $0}' $*"

# Betty
alias betty='~/Documents/code/scripts/3P/betty/main.rb'
alias mybetty='~/Documents/code/betty/main.rb'

# Brew stuff
alias bcs='brew cask search'

# gitjk: https://github.com/mapmeld/gitjk#gitjk
alias gitjk="history 10 | tac | gitjk_cmd"

# Node stuff
#alias bode='babel-node'
alias bode='babel-node --stage 1'
alias bodemon='nodemon --exec babel-node -- --optional strict --stage 1 -- '
################################################################################
### OSX TRICKS
# copy-paste in preview
alias qlpbon='defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder'
alias qlpboff='defaults write com.apple.finder QLEnableTextSelection -bool FALSE; killall Finder'

# show hidden files
alias showhiddenon='defaults write com.apple.finder AppleShowAllFiles true; killall Finder'
alias showhiddenoff='defaults write com.apple.finder AppleShowAllFiles false; killall Finder'

# dashboard control
alias dashoff='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias dashon='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'
################################################################################
### OPTIMIZELY
alias mb="JS_BUILD_ARGS='--bundle bundle' make js"
alias opt='cd ~/Documents/code/optimizely/optimizely'
alias fe='cd ~/Documents/code/optimizely/frontend'
alias ae='cd ~/Documents/code/optimizely/atomic-editor'
alias sdk='cd ~/Documents/code/optimizely/iOS-SDK'
