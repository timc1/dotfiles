# Sets colors for Terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Start the SSH agent
eval "$(ssh-agent -s)"
# Add the SSH key
ssh-add

# Stop any processes running on specified port
function killport (){
  lsof -i tcp:"$1" -t | xargs kill -9
  lsof -i tcp:"$1" -t 2>/dev/null >/dev/null || printf "killed processes on port %s\n" "$1"
}

# Restart Mac Touchbar -_-
function restartTouchbar() {
  pkill "Touch Bar agent";
  killall "ControlStrip";
}

# Unlimited WiFi at places with restricted time limits.
function changeMac() {
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "Your new physical address is $mac"
}

function weather() {
  if [ "$1" != "" ]
    then
  curl "v2.wttr.in/$1"
    else
  curl "v2.wttr.in/sf"
  fi
}

/**
 * `gcr` cleans up git repositories by deleting branches that are fully merged into `origin/main`
 * reference: https://gist.github.com/robmiller/5133264
 */
function gcr() {
  git checkout main &> /dev/null

  # Make sure we're working with the most up-to-date version of main.
  git fetch

  # Prune obsolete remote tracking branches. These are branches that we
  # once tracked, but have since been deleted on the remote.
  git remote prune origin

  # List all the branches that have been merged fully into main, and
  # then delete them. We use the remote main here, just in case our
  # local main is out of date.
  git branch --merged origin/main | grep -v 'main$' | xargs git branch -d

  # Now the same, but including remote branches.
  MERGED_ON_REMOTE=`git branch -r --merged origin/main | sed 's/ *origin\///' | grep -v 'main$'`

  if [ "$MERGED_ON_REMOTE" ]; then
    echo "The following remote branches are fully merged and will be removed:"
    echo $MERGED_ON_REMOTE

    if read -q "?Continue (y/N)? "; then
      git branch -r --merged origin/main | sed 's/ *origin\///' \
        | grep -v 'main$' | xargs -I% git push origin :% 2>&1 \
        | grep --colour=never 'deleted'
      echo "Done!"
    fi
  fi
}

# Update cd path to search in /Desktop as well.
CDPATH=.:$HOME:$HOME/Desktop
