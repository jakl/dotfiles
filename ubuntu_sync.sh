function sync_favorite_repos {
  # sudo add-apt-repository -y ppa:chris-lea/node.js
  # sudo add-apt-repository -y ppa:ubuntu-wine/ppa
  echo nothing > /dev/null
}

function sync_favorite_apps {
  sudo apt-get install -y aptitude git vim-nox curl irssi nmap g++ ssh python-software-properties # chromium-codecs-ffmpeg-extra pavucontrol 
  sudo npm install -g ecstatic
  sudo apt-get purge -y libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-emailmerge libreoffice-gnome libreoffice-gtk libreoffice-help-en-us libreoffice-impress libreoffice-math libreoffice-style-human libreoffice-style-tango libreoffice-writer thunderbird firefox
  sudo aptitude update -y
  sudo aptitude full-upgrade -y
  sudo apt-get auto-remove -y
}

function install_aircrack {
  if [ ! `command -v aircrack-ng` ]; then
    wget https://launchpad.net/ubuntu/+archive/primary/+files/aircrack-ng_1.1-1.1build1_amd64.deb
    sudo dpkg -i aircrack-ng_1.1-1.1build1_amd64.deb
    rm aircrack-ng_1.1-1.1build1_amd64.deb
  fi
}

function main {
  # sync_favorite_repos
  sync_favorite_apps
  # install_aircrack
}

main &> /dev/null
echo Remember to google and setup ubuntu automated updates
