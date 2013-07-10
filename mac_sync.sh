function sync_favorite_apps {
  brew install tmux wget aircrack-ng coreutils curl reattach-to-user-namespace rbenv ruby-build the_silver_searcher irssi nmap
  brew install git --with-pcre
  brew install vim --override-system-vi --with-perl --with-python --with-ruby
  brew link curl --force
}

function update_bashrc {
  local LOCAL_BIN='PATH=/usr/local/bin:$PATH'
  local LOCAL_SBIN='PATH=/usr/local/sbin:$PATH'
  local HOME_BASHRC='. $HOME/.bashrc'
  local GLOBAL_BASHRC=/etc/bashrc
  fgrep -x $LOCAL_BIN $GLOBAL_BASHRC || echo $LOCAL_BIN | sudo tee -a $GLOBAL_BASHRC
  fgrep -x $LOCAL_SBIN $GLOBAL_BASHRC || echo $LOCAL_SBIN | sudo tee -a $GLOBAL_BASHRC
  fgrep -x "$HOME_BASHRC" $GLOBAL_BASHRC || echo $HOME_BASHRC | sudo tee -a $GLOBAL_BASHRC
}

function update_profile {
  local GLOBAL_PROFILE=/etc/profile
  local HOME_PROFILE='. $HOME/.profile'
  fgrep -x "$HOME_PROFILE" $GLOBAL_PROFILE || echo $HOME_PROFILE | sudo tee -a $GLOBAL_PROFILE
}

function link_coreutils {
  local LOCAL_BASHRC=$HOME/.bashrc.d/local.sh
  local CORE_UTILS='PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH'
  local MAN_CORE_UTILS='MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH'
  touch $LOCAL_BASHRC
  fgrep -x $CORE_UTILS $LOCAL_BASHRC || echo $CORE_UTILS | tee -a $LOCAL_BASHRC
  fgrep -x $MAN_CORE_UTILS $LOCAL_BASHRC || echo $MAN_CORE_UTILS | tee -a $LOCAL_BASHRC
}

function node_js {
  echo Download node from nodejs.org
  echo sudo chown $USER /usr/local/lib/node_modules/
}

function main {
  sync_favorite_apps
  update_bashrc
  update_profile
  link_coreutils
}

main &>/dev/null
node_js
