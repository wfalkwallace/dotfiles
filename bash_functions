# William Falk-Wallace
# .bash_functions
#

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

function prompt_colorize
{
	COLOR="$(($RANDOM % 2));$(($RANDOM % 7 + 30))m"
	PS1="\[\e[0;30m\][\A]\[\e[${COLOR}\]\u\[\e[0m\]@\h:[\W]\[\$(git_color)\]\$(git_branch)\[\e[${COLOR}\]\$\[\e[0;30m\] "
}


# git_color and git_branch from coderwall:
# https://coderwall.com/p/pn8f0g

RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
OCHRE="\033[38;5;95m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $RED
  else if [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  else if [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  else
    echo -e $OCHRE
  fi fi fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local pattern="^On branch ([^${IFS}]*)"

  if [[ $git_status =~ $pattern ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  fi
}
