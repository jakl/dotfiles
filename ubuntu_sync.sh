function sync_favorite_repos {
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo add-apt-repository -y ppa:ubuntu-wine/ppa
}

function sync_favorite_apps {
  sudo apt-get install -y aptitude git chromium-browser vim-gnome pavucontrol curl irssi nmap mumble g++ ssh python-software-properties nodejs npm
  sudo npm install -g coffee-script

  #Remove unused ones too
  sudo apt-get purge -y libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-emailmerge libreoffice-gnome libreoffice-gtk libreoffice-help-en-us libreoffice-impress impresslibreoffice-math libreoffice-style-human libreoffice-style-tango libreoffice-writer thunderbird firefox
}

function install_aircrack {
  command -v aircrack-ng || sudo dpkg -i <(curl https://launchpad.net/ubuntu/+archive/primary/+files/aircrack-ng_1.1-1.1build1_amd64.deb)
}

function main {
  sync_favorite_repos
  sync_favorite_apps
  install_aircrack
}

main &> /dev/null
echo Remember to google and setup ubuntu automated updates
