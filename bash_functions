# William Falk-Wallace
# .bash_functions
#


################################################################################
################################ Misc Functions ################################
################################################################################

function up()
{
	DIR=""
	ALTITUDE=1

	if [ ! -z $1 ]
	then
		ALTITUDE=$1
	fi

	for ((i = 0; i < ALTITUDE; i++));
	do
		DIR="../$DIR"
	done

	cd $DIR
}


################################################################################
################################ Terminal Hacks ################################
################################################################################
# From http://thelucid.com/2012/01/04/naming-your-terminal-tabs-in-osx-lion/

function name_tab() {
  printf "\e]1;$1\a"
}

function name_window() {
  printf "\e]2;$1\a"
}

function name() {
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


################################################################################
################################# Github Hacks #################################
################################################################################

repo()
{
  echo "Creating new repo '$1' via Github API..."
  curl -u 'wfalkwallace' https://api.github.com/user/repos -d '{"name":"$1"}'

  echo "Creating directory '$1'..."
  mkdir $1

  echo "Entering directory '$1'..."
  cd $1

  echo "Creating README..."
  touch README.md

  echo "Initializing git repo in directory '$1'..."
  git init

  echo "Adding remote 'https://github.com/wfalkwallace/$1.git'..."
  git remote add origin https://github.com/wfalkwallace/$1.git
}


################################################################################
################################ Prompt Helpers ################################
################################################################################

function colorize
{
  local color="$(($RANDOM % 2));$(($RANDOM % 7 + 30))m"
  echo "\[\033[$color\]"
}

function uncolor
{
  local black='\[\033[00m\]'
  echo "$black"
}

# From http://engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html
function venv_prompt
{
  local green='\[\033[32m\]'
  local venv=''
  if [[ $VIRTUAL_ENV != "" ]]
  then
    local venv="$green{${VIRTUAL_ENV##*/}}$(uncolor)"
  fi
  echo "$venv"
}

# From https://coderwall.com/p/pn8f0g
function git_color {
  local red="\[\033[0;31m\]"
  local yellow="\[\033[0;33m\]"
  local green="\[\033[0;32m\]"
  local ochre="\[\033[38;5;95m\]"

  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo "$red"
  else if [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo "$yellow"
  else if [[ $git_status =~ "nothing to commit" ]]; then
    echo "$green"
  else
    echo "$ochre"
  fi fi fi
}

# From https://coderwall.com/p/pn8f0g
function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local pattern="^On branch ([^${IFS}]*)"

  if [[ $git_status =~ $pattern ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  fi
}


################################################################################
################################## SubPrompts ##################################
################################################################################

function time_prompt
{
  echo "$(uncolor)[\A]"
}

function end_prompt
{
  echo "$(colorize)\$$(uncolor)"
}

function host_prompt
{
  if [[ "$(venv_prompt)" != "" ]]
  then
    local host="$(venv_prompt)"
  else
    local host="$(uncolor)\h"
  fi
  echo "$host"
}

function dir_prompt
{
  echo "$(uncolor)[\W]"
}

function user_prompt
{
  echo "$(colorize)\u$(uncolor)"
}

function git_prompt
{
  echo "$(git_color)$(git_branch)$(uncolor)"
}


################################################################################
################################## The Prompt ##################################
################################################################################

### Homebrewed
function set_prompt
{
  PS1="$(time_prompt)$(user_prompt)@$(host_prompt):$(dir_prompt)$(git_prompt)$(end_prompt) "
}

### Powerline-shell
function _update_ps1() {
   export PS1="$(~/powerline-shell.py --mode flat --cwd-max-depth 3 $? 2> /dev/null)"
}
