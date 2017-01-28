cd /tmp

echo "*** Enable add-apt-repository ***"
sudo apt-get install -y software-properties-common > /dev/null 2>&1
echo

echo "*** Add repositories ***"
echo "Add repository for elementary Tweaks"
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks > /dev/null 2>&1
echo "Add repository for Nvidia driver"
sudo add-apt-repository -y ppa:graphics-drivers/ppa > /dev/null 2>&1
echo "Add repository for Quodlibet"
sudo add-apt-repository -y ppa:lazka/ppa > /dev/null 2>&1
echo "Add repository for Timeshift"
sudo add-apt-repository -y ppa:teejee2008/ppa > /dev/null 2>&1
echo "Add repository for Java ***"
sudo add-apt-repository -y ppa:webupd8team/java > /dev/null 2>&1
echo "Add repository for Sublime Text 3"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 > /dev/null 2>&1
echo "Add repository for Libre Office"
sudo add-apt-repository -y ppa:libreoffice/ppa > /dev/null 2>&1
echo "Add repository for Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - > /dev/null 2>&1
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
echo "Add repository for Virtualbox"
wget -q -O - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add - > /dev/null 2>&1
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian/ xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'
echo

echo "*** Update repositories ***"
apt update > /dev/null 2>&1
echo

echo "*** Install packages ***"
echo "Install elementary Tweaks"
sudo apt-get install -y elementary-tweaks > /dev/null 2>&1
#echo "*** Install Nvidia driver ***"
#sudo apt-get install -y nvidia-367 nvidia-prime > /dev/null 2>&1
echo "Install Quodlibet"
sudo apt-get install -y quodlibet > /dev/null 2>&1
echo "Install Libre Office"
sudo apt-get install -y libreoffice-writer libreoffice-calc libreoffice-gtk2 libreoffice-l10n-ru libreoffice-style-sifr > /dev/null 2>&1
echo "Install Timeshift"
sudo apt-get install -y timeshift > /dev/null 2>&1
echo "Install Java"
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true'
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true'
sudo apt-get install -y oracle-java8-installer > /dev/null 2>&1
echo "Install Sublime Text 3"
sudo apt-get install -y sublime-text-installer > /dev/null 2>&1
echo "Install Bleachbit"
sudo apt-get install -y bleachbit > /dev/null 2>&1
echo "Install Google Chrome"
sudo apt-get install -y google-chrome-stable > /dev/null 2>&1
echo "Install Virtualbox"
sudo apt-get install -y virtualbox-5.1 > /dev/null 2>&1
echo "Install Puddletag"
sudo apt-get install -y puddletag > /dev/null 2>&1
echo "Install Gparted"
sudo apt-get install -y gparted > /dev/null 2>&1
echo "Install Gnome system monitor"
sudo apt-get install -y gnome-system-monitor > /dev/null 2>&1
echo "Install Gnome screenshot"
sudo apt-get install -y gnome-screenshot > /dev/null 2>&1
echo "Install Hack Font"
sudo apt-get install -y fonts-hack-ttf > /dev/null 2>&1
echo "Install Gdebi"
sudo apt-get install -y gdebi > /dev/null 2>&1
echo "Install Git"
sudo apt-get install -y git > /dev/null 2>&1
echo "Install Yadm"
sudo apt-get install -y yadm > /dev/null 2>&1
echo "Install mysql"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-client mysql-server > /dev/null 2>&1
echo "Install Adb and Fastboot"
sudo apt-get install -y adb fastboot > /dev/null 2>&1
echo "Install Virtualenv"
sudo apt-get install -y virtualenv > /dev/null 2>&1
echo "Install Preload"
sudo apt-get install -y preload > /dev/null 2>&1
echo "Install Maven"
sudo apt-get install -y maven > /dev/null 2>&1
echo "Install Steam"
sudo debconf-set-selections <<< 'steam steam/question select "I AGREE"'
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb  > /dev/null 2>&1
sudo apt install ./steam.deb -y > /dev/null 2>&1
echo "Install bomi"
wget https://www.dropbox.com/s/idz12x78hvlxu2q/bomi.deb?raw=1 -O bomi.deb> /dev/null 2>&1
sudo apt install ./bomi.deb -y > /dev/null 2>&1
echo "Install custom icon theme"
wget https://www.dropbox.com/s/vtovnhz8a0simgd/elementary-djaler.deb?raw=1 -O elementary-djaler.deb > /dev/null 2>&1
sudo apt install ./elementary-djaler.deb -y > /dev/null 2>&1
gsettings set org.gnome.desktop.interface icon-theme elementary-djaler
echo "Install Transmission"
wget https://www.dropbox.com/s/geamb02ngdx8uqe/transmission.deb?raw=1 -O transmission.deb > /dev/null 2>&1
sudo apt install ./transmission.deb -y > /dev/null 2>&1
echo "Install Zsh"
wget https://www.dropbox.com/s/9zb4ttn8tez3vn3/zsh-common_5.3-1_all.deb?raw=1 -O zsh-common.deb > /dev/null 2>&1
sudo apt install ./zsh-common.deb -y > /dev/null 2>&1
wget https://www.dropbox.com/s/qplfrzquplvkdid/zsh_5.3-1_amd64.deb?raw=1 -O zsh.deb > /dev/null 2>&1
sudo apt install ./zsh.deb -y > /dev/null 2>&1
sudo -S chsh -s '/bin/zsh' "${USER}"
echo "Install Dropbox"
git clone https://github.com/zant95/elementary-dropbox > /dev/null 2>&1
bash elementary-dropbox/install.sh -n > /dev/null 2>&1
echo

echo "*** Uninstall packages ***"
sudo apt-get purge -y wingpanel-indicator-bluetooth wingpanel-indicator-notifications > /dev/null 2>&1
sudo apt-get purge -y capnet-assist > /dev/null 2>&1
sudo apt-get purge -y scratch-text-editor libscratchcore0 > /dev/null 2>&1
sudo apt-get purge -y appcenter > /dev/null 2>&1
sudo apt-get purge -y pantheon-calculator > /dev/null 2>&1
sudo apt-get purge -y maya-calendar maya-calendar-plugin-caldav maya-calendar-plugin-google libmaya-calendar0 > /dev/null 2>&1
sudo apt-get purge -y epiphany-browser epiphany-browser-data > /dev/null 2>&1
sudo apt-get purge -y noise libnoise-core0 > /dev/null 2>&1
sudo apt-get purge -y apport apport-gtk python3-apport apport-symptoms elementary-os-prerelease apport-hooks-elementary elementaryos-report-problem-dockitem > /dev/null 2>&1
sudo apt-get purge -y screenshot-tool > /dev/null 2>&1
sudo apt-get purge -y simple-scan > /dev/null 2>&1
sudo apt-get purge -y audience > /dev/null 2>&1
sudo apt-get purge -y language-pack-bg language-pack-bg-base language-pack-gnome-bg language-pack-gnome-bg-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-ca language-pack-ca-base language-pack-gnome-ca language-pack-gnome-ca-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-cs language-pack-cs-base language-pack-gnome-cs language-pack-gnome-cs-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-da language-pack-da-base language-pack-gnome-da language-pack-gnome-da-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-hu language-pack-hu-base language-pack-gnome-hu language-pack-gnome-hu-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-id language-pack-id-base language-pack-gnome-id language-pack-gnome-id-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-ja language-pack-ja-base language-pack-gnome-ja language-pack-gnome-ja-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-ko language-pack-ko-base language-pack-gnome-ko language-pack-gnome-ko-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-nb language-pack-nb-base language-pack-gnome-nb language-pack-gnome-nb-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-nl language-pack-nl-base language-pack-gnome-nl language-pack-gnome-nl-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-pl language-pack-pl-base language-pack-gnome-pl language-pack-gnome-pl-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-sv language-pack-sv-base language-pack-gnome-sv language-pack-gnome-sv-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-th language-pack-th-base language-pack-gnome-th language-pack-gnome-th-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-tr language-pack-tr-base language-pack-gnome-tr language-pack-gnome-tr-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-uk language-pack-uk-base language-pack-gnome-uk language-pack-gnome-uk-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-vi language-pack-vi-base language-pack-gnome-vi language-pack-gnome-vi-base > /dev/null 2>&1
sudo apt-get purge -y language-pack-zh language-pack-zh-base language-pack-gnome-zh language-pack-gnome-zh-base > /dev/null 2>&1
sudo apt-get purge -y wbulgarian wdanish wdutch wpolish wukrainian  > /dev/null 2>&1
echo

git clone https://github.com/png2378/telegram-icon-updater.git > /dev/null 2>&1
cd telegram-icon-updater
bash setup.sh --install
cd /tmp

yadm clone https://github.com/Djaler/dotfiles.git > /dev/null 2>&1
yadm reset --hard origin/master > /dev/null 2>&1

sudo sh -c 'echo "#!/bin/sh" > /etc/grub.d/50_set-zero-timeout'
sudo sh -c 'echo "set timeout=0" >> /etc/grub.d/50_set-zero-timeout'

gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle','terminate:ctrl_alt_bksp']"