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

function main {
  sync_favorite_apps
  update_bashrc
  update_profile
}

main &>/dev/null
