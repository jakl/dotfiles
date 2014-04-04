when() {
  history | grep -i $1 | grep -v when | sed 's/\s*//' | cut -d' ' -f3-999
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

repeat () {
  while true; do $@; sleep 1s; done;
}

toggletouchscreen () {
  id=`xinput | grep -i touchscreen | sed 's/.*id=\(..\).*/\1/'`
  toggle_value=`xinput list-props $id | grep Enabled | tail -c2 | perl -ne '$_ == 1 ? print 0 : print 1'`
  xinput set-prop $id 'Device Enabled' $toggle_value
}

expandurl () { #find the final landing page of a short url like t.co/UgSnleeKua
  curl -sIL $1 | grep ^Location: | tail -n1 | sed 's/Location: //'
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
