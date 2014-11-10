# William Falk-Wallace
# .bash_aliases
#

# force mv, rm and cp to ask user before clobbering file
alias mv="mv -i $*"
alias rm="rm -ri $*"
alias cp="cp -i $*"

alias ll="ls -alFG $*"
alias c='clear'
alias cd..='cd ..'
alias home='cd ~'
alias desk='cd ~/Desktop'
alias code='cd ~/Documents/code'
alias ling='cd ~/Documents/code/linger'
alias lw='cd ~/Documents/code/linger/web_app'
alias eclipse='cd ~/Documents/eclipse/workspace'
alias starwars='telnet towel.blinkenlights.nl'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%m/%d/%y %T"'
alias ax="chmod a+x"
alias bp="$EDITOR ~/.bash_profile"
alias src="source ~/.bash_profile"
alias cpu='top -o cpu'
alias mem='top -o rsize'
alias cal12='cal 12 2013'
alias uphour='caffeinate -t 3600'
alias t='todo.sh -d ~/.todo.cfg'

# current IP
alias ip='curl icanhazip.com'
alias ip2='curl ifconfig.me'

# wifi info
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias wifi='airport -I'
alias wifiscan='airport -s'

# forget where this is from, but matrix
alias mat='matrixish.sh'

# applications
alias mou='open /Applications/Mou.app/ $*'

# browsers:
alias chrm='open /Applications/Google\ Chrome.app'
alias ffx='open -a firefox'

# git shortcuts
alias g='git'
alias h='hub'
alias st='git status'
alias comm='git commit -m $*'
alias push='git push'
alias pull='git pull'

# rails shortcuts
alias r='rails'

# st3 shortcut
alias stt='subl && sleep 0.2 && subl .'

# start a python server in the current directory
alias serv='python -m SimpleHTTPServer 8000'

# CLI-speedtest
alias speed='speedtest --simple'

# line count for file
alias lc="awk 'END{print NR}' $*"

# find all todos in src file
alias todo="awk '/TODO/ {print NR "'"\t" ($1=$2="")'" $0}' $*"

# dashdocs
alias dash='open dash://$*'

# Betty
alias betty='~/Documents/code/scripts/3P/betty/main.rb'
alias mybetty='~/Documents/code/betty/main.rb'

# OSX Tricks
# copy-paste in preview
alias qlpbon='defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder'
alias qlpboff='defaults write com.apple.finder QLEnableTextSelection -bool FALSE; killall Finder'
# show hidden files
alias showhiddenon='defaults write com.apple.finder AppleShowAllFiles true; killall Finder'
alias showhiddenoff='defaults write com.apple.finder AppleShowAllFiles false; killall Finder'
# dashboard control
alias dashoff='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias dashon='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'

# Brew stuff
alias bcs='brew cask search'

# Optimizely stuff
alias mb="JS_BUILD_ARGS='--bundle bundle' make js"
alias opt='cd ~/Documents/code/optimizely/optimizely'

# gitjk: https://github.com/mapmeld/gitjk#gitjk
alias gitjk="history 10 | tac | gitjk_cmd"

alias startredis='redis-server /usr/local/etc/redis.conf'
