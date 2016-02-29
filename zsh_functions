#!/bin/zsh
#
# William Falk-Wallace
# functions.zsh
#

# TODO: Investigate fpath, autoload
###############################  MISC FUNCTIONS  ###############################
### cd up-tree by specifying the number of jumps (ie. up 3 === cd ../../../)
function up()
{
  ALTITUDE=1
  if [ ! -z $1 ]; then
    ALTITUDE=$1
  fi

  DIR=""
  for ((i = 0; i < ALTITUDE; i++)); do
    DIR="../$DIR"
  done

  cd $DIR
}
### open the specified manpage in chrome
function openManPageInChrome()
{
  if [ $# -ne 1 ]; then
    echo "Usage: openManPageInChrome <cmd>"
  fi
  man $1 | col -b | open -a /Applications/Google\ Chrome.app -f
}

###############################  TERMINAL HACKS  ###############################
### From thelucid.com/2012/01/04/naming-your-terminal-tabs-in-osx-lion
### name the current terminal tab
function name_tab()
{
  if [ $# -ne 1 ]; then
    echo "Usage: name_tab <name>"
  fi
  printf "\e]1;$1\a"
}
### name the current terminal window
function name_window()
{
  if [ $# -ne 1 ]; then
    echo "Usage: name_window <name>"
  fi
  printf "\e]2;$1\a"
}
### name the current terminal tab or window
function name()
{
  if [ $# -ne 2 ]; then
    echo "Usage: name <tab|t|window|win|w> <name>"
  fi
  case "$1" in
    "tab") name_tab $2 ;;
    "t") name_tab $2 ;;
    "window") name_window $2 ;;
    "win") name_window $2 ;;
    "w") name_window $2 ;;
    *) echo "Usage: name <tab|t|window|win|w> <name>" ;;
  esac
}

#############################  GIT + GITHUB HACKS  #############################
### from ifandelse.com/listing-git-branches-in-order-of-most-recent-commit
function branches()
{
  git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)|%(committerdate:iso)|%(authorname)' |
    sed 's/refs\/heads\///g' |
    grep -v BACKUP  |
    while IFS='|' read branch date author
    do
        printf '%-15s %-30s %s\n' "$branch" "$date" "$author"
    done
}

###############################  PROMPT HELPERS  ###############################
### return a random bash color code
function colorize()
{
  local color="$(($RANDOM % 2));$(($RANDOM % 7 + 30))m"
  echo "\[\033[$color\]"
}
### return standard thin black bash color code
function uncolor()
{
  local black='\[\033[00m\]'
  echo "$black"
}
### From engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html
### return a colored venv environment information string
function venv_prompt()
{
  local green='\[\033[32m\]'
  local venv=''
  if [[ $VIRTUAL_ENV != "" ]]
  then
    local venv="$green{${VIRTUAL_ENV##*/}}$(uncolor)"
  fi
  echo "$venv"
}
### From coderwall.com/p/pn8f0g
### return a colored git status information string
function git_color()
{
  local red="\[\033[0;31m\]"
  local yellow="\[\033[0;33m\]"
  local green="\[\033[0;32m\]"
  local ochre="\[\033[38;5;95m\]"

  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo "$red"
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo "$yellow"
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo "$green"
  else
    echo "$ochre"
  fi
}
### From coderwall.com/p/pn8f0g
### return a colored git branch information string
function git_branch()
{
  local git_status="$(git status 2> /dev/null)"
  local pattern="^On branch ([^${IFS}]*)"

  if [[ $git_status =~ $pattern ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  fi
}

#################################  SUBPROMPTS  #################################
### return an uncolored timestring
function time_prompt()
{
  echo "$(uncolor)[\A]"
}
### return a colored prompt terminator, and end (uncolor) the prompt
function end_prompt()
{
  echo "$(colorize)\$$(uncolor)"
}
### return a colored host string
function host_prompt()
{
  if [[ "$(venv_prompt)" != "" ]]
  then
    local host="$(venv_prompt)"
  else
    local host="$(uncolor)\h"
  fi
  echo "$host"
}
### return an uncolored, shortened pwd string
function dir_prompt()
{
  echo "$(uncolor)[\W]"
}
### return a colored user string
function user_prompt()
{
  echo "$(colorize)\u$(uncolor)"
}
### return a compound, colored git status string
function git_prompt()
{
  echo "$(git_color)$(git_branch)$(uncolor)"
}

###################################  PROMPT  ###################################
### Homebrewed prompt
function set_prompt()
{
  PS1="$(time_prompt)$(user_prompt)@$(host_prompt):$(dir_prompt)$(git_prompt)$(end_prompt) "
}
