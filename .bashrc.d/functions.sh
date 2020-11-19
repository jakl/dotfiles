die () {
  echo >&2 "$@"
  exit 1
}

when() {
  history | grep -i $1 | grep -v when | sed 's/\s*//' | cut -d' ' -f3-999
}
recent() {
  when $1 | grep -v recent | tail | sort | uniq
}

tunnel () {
  if [ $# = 4 ]; then
    LOCAL_PORT=$1
    HOST_NAME=$2
    REMOTE_PORT=$3
    PROXY_HOST=$4

    if [ -z "`nc -z localhost $LOCAL_PORT`" ]; then
      ssh -N -f -L$LOCAL_PORT:$HOST_NAME:$REMOTE_PORT -l $USER $PROXY_HOST
    else
      echo "Port $LOCAL_PORT is already in use"
    fi
  else
    echo "tunnel usage:"
    echo "   tunnel local_port host_name remote_port proxy_host"
  fi
}

every () {
  local seconds=$1
  shift
  [[ $seconds =~ ^[0-9]+$ ]] || echo 'Hint: every $seconds $command' && return
  while true; do $@; sleep $seconds; done;
}

everyclear () {
  local seconds=$1
  shift
  [[ $seconds =~ ^[0-9]+$ ]] || echo 'Hint: everyclear $seconds $command' && return
  while true; do clear; $@; sleep $seconds; done;
}

toggletouchscreen () {
  id=`xinput | grep -i touchscreen | sed 's/.*id=\(..\).*/\1/'`
  toggle_value=`xinput list-props $id | grep Enabled | tail -c2 | perl -ne '$_ == 1 ? print 0 : print 1'`
  xinput set-prop $id 'Device Enabled' $toggle_value
}

urlexpand () { #find the final landing page of a short url like t.co/UgSnleeKua
  curl -sIL $1 | grep ^Location: | tail -n1 | sed 's/Location: //'
}

urlmoved () { #find where a url "moved" like bit.do/gphoto
  curl -s $1 | grep moved | sed -r 's/.*"(.*)".*/\1/g'
}

rootalways() {
  sudo chown root:wheel `which $1`
  sudo chmod u+s `which $1`
}

rootnever() {
  sudo chown $USER `which $1`
  sudo chmod u-s `which $1`
}

whiteboard() {
  # Make a photo of a whiteboard pretty
  # https://gist.github.com/lelandbatey/8677901
  convert "$@" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "whiteboard.$@"
}

f() {
  find ${2-.} -iregex ".*$1.*"
}

prepend() {
  cat - "$1" > /tmp/chalkboard && mv /tmp/chalkboard "$1"
}

vscodeDoNotBurnMe() {
  while true; do date; echo killing $(ps aux | grep watcherService | grep -v grep); kill $(ps x | grep watcherService | grep -v grep | cut -f1 -d' ') 2>/dev/null; sleep 6s; done;
}

export -f die
export -f when
export -f recent
export -f tunnel
export -f every
export -f everyclear
export -f toggletouchscreen
export -f urlexpand
export -f urlmoved
export -f rootalways
export -f rootnever
export -f whiteboard
export -f f
export -f prepend
export -f vscodeDoNotBurnMe
