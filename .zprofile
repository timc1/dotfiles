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

# Update cd path to search in /Desktop as well.
CDPATH=.:$HOME:$HOME/Desktop
