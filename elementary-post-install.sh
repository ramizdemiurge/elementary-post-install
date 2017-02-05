clear

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
sudo apt update > /dev/null 2>&1
echo

echo "*** Install packages ***"
echo "Install elementary Tweaks"
sudo apt-get install -y elementary-tweaks > /dev/null 2>&1
echo "*** Install Nvidia driver ***"
sudo apt-get install -y nvidia-378 nvidia-prime > /dev/null 2>&1
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
echo "Install Deluge"
sudo apt-get install -y deluge > /dev/null 2>&1
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
echo "Install Mysql"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-client mysql-server > /dev/null 2>&1
echo "Install Maven"
sudo apt-get install -y maven > /dev/null 2>&1
echo "Install Adb and Fastboot"
sudo apt-get install -y adb fastboot > /dev/null 2>&1
echo "Install Virtualenv"
sudo apt-get install -y virtualenv > /dev/null 2>&1
echo "Install Preload"
sudo apt-get install -y preload > /dev/null 2>&1
echo "Install ppa-purge"
sudo apt-get install -y ppa-purge > /dev/null 2>&1
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
echo "Install Zsh"
wget https://www.dropbox.com/s/9zb4ttn8tez3vn3/zsh-common_5.3-1_all.deb?raw=1 -O zsh-common.deb > /dev/null 2>&1
sudo apt install ./zsh-common.deb -y > /dev/null 2>&1
wget https://www.dropbox.com/s/qplfrzquplvkdid/zsh_5.3-1_amd64.deb?raw=1 -O zsh.deb > /dev/null 2>&1
sudo apt install ./zsh.deb -y > /dev/null 2>&1
sudo -S chsh -s '/bin/zsh' "${USER}"
echo "Install Electrum"
wget https://www.dropbox.com/s/yd7od0pqf8olcuo/python-electrum_2.7.9-1_all.deb?raw=1 -O python-electrum.deb > /dev/null 2>&1
sudo apt install ./python-electrum.deb -y > /dev/null 2>&1
wget https://www.dropbox.com/s/gvmgcrn72qnf04n/electrum_2.7.9-1_all.deb?raw=1 -O electrum.deb > /dev/null 2>&1
sudo apt install ./electrum.deb -y > /dev/null 2>&1
echo "Install Dropbox"
git clone https://github.com/zant95/elementary-dropbox > /dev/null 2>&1
bash elementary-dropbox/install.sh -n > /dev/null 2>&1
echo

echo "*** Uninstall packages ***"
sudo apt-get purge -y wingpanel-indicator-bluetooth wingpanel-indicator-notifications > /dev/null 2>&1
sudo apt-get purge -y capnet-assist libscratchcore0 appcenter pantheon-calculator libmaya-calendar0 epiphany-browser-data libnoise-core0 simple-scan screenshot-tool audience snap-photobooth > /dev/null 2>&1
sudo apt-get purge -y python3-apport apport-symptoms > /dev/null 2>&1
sudo apt-get purge -y language-pack-bg language-pack-bg-base language-pack-gnome-bg language-pack-gnome-bg-base language-pack-ca language-pack-ca-base language-pack-gnome-ca language-pack-gnome-ca-base language-pack-cs language-pack-cs-base language-pack-gnome-cs language-pack-gnome-cs-base language-pack-da language-pack-da-base language-pack-gnome-da language-pack-gnome-da-base language-pack-hu language-pack-hu-base language-pack-gnome-hu language-pack-gnome-hu-base language-pack-id language-pack-id-base language-pack-gnome-id language-pack-gnome-id-base language-pack-ja language-pack-ja-base language-pack-gnome-ja language-pack-gnome-ja-base language-pack-ko language-pack-ko-base language-pack-gnome-ko language-pack-gnome-ko-base language-pack-nb language-pack-nb-base language-pack-gnome-nb language-pack-gnome-nb-base language-pack-nl language-pack-nl-base language-pack-gnome-nl language-pack-gnome-nl-base language-pack-pl language-pack-pl-base language-pack-gnome-pl language-pack-gnome-pl-base language-pack-sv language-pack-sv-base language-pack-gnome-sv language-pack-gnome-sv-base language-pack-th language-pack-th-base language-pack-gnome-th language-pack-gnome-th-base language-pack-tr language-pack-tr-base language-pack-gnome-tr language-pack-gnome-tr-base language-pack-uk language-pack-uk-base language-pack-gnome-uk language-pack-gnome-uk-base language-pack-vi language-pack-vi-base language-pack-gnome-vi language-pack-gnome-vi-base language-pack-zh language-pack-zh-base language-pack-gnome-zh language-pack-gnome-zh-base language-pack-zh-hant language-pack-zh-hant-base language-pack-gnome-zh-hant language-pack-gnome-zh-hant-base > /dev/null 2>&1
sudo apt-get purge -y wbulgarian wdanish wdutch wpolish wukrainian wnorwegian > /dev/null 2>&1
sudo apt-get purge -y fonts-noto-cjk > /dev/null 2>&1
sudo apt-get purge -y gnome-orca > /dev/null 2>&1
sudo apt-get purge -y mpv > /dev/null 2>&1
sudo apt-get purge -y evolution-data-server zeitgeist-core > /dev/null 2>&1
sudo apt-get autoremove -y > /dev/null 2>&1
echo

echo "*** Upgrade packages ***"
sudo apt-get upgrade -y > /dev/null 2>&1
echo

git clone https://github.com/png2378/telegram-icon-updater.git > /dev/null 2>&1
cd telegram-icon-updater
bash setup.sh --install
cd /tmp

mkdir ~/.templates
rm -rf ~/Documents
rm -rf ~/Pictures
rm -rf ~/Public
rm -rf ~/Templates

sudo rm /usr/share/contractor/gnome-bluetooth.contract
sudo rm /usr/share/contractor/print.contract
sudo sh -c 'echo "[Contractor Entry]" > /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Name=Открыть от имени суперпользователя" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Icon=pantheon-files" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "MimeType=inode;" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Exec=gksudo pantheon-files %U" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Gettext-Domain=pantheon-files" >> /usr/share/contractor/folder-openasroot.contract'

yadm clone https://github.com/Djaler/dotfiles.git > /dev/null 2>&1
yadm reset --hard origin/master > /dev/null 2>&1

gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle','terminate:ctrl_alt_bksp']"

sudo sh -c 'echo "/dev/sdb1			/media					ext4	defaults		0	2" >> /etc/fstab'
sudo sh -c 'echo "/media/Dropbox			/home/djaler/Dropbox			none	bind			0	0" >> /etc/fstab'
sudo sh -c 'echo "/media/Downloads		/home/djaler/Downloads			none	bind			0	0" >> /etc/fstab'
sudo sh -c 'echo "/media/Videos			/home/djaler/Videos			none	bind			0	0" >> /etc/fstab'
sudo sh -c 'echo "/media/Dropbox/Music		/home/djaler/Music			none	bind			0	0" >> /etc/fstab'
sudo sh -c 'echo "/media/Dropbox/Projects		/home/djaler/Projects			none	bind			0	0" >> /etc/fstab'
sudo sh -c 'echo "/media/Dropbox/Stuff		/home/djaler/Stuff			none	bind			0	0" >> /etc/fstab'
sudo sh -c 'echo "tmpfs				/home/djaler/.cache/google-chrome	tmpfs	defaults		0	0" >> /etc/fstab'
sudo sh -c 'echo "tmpfs				/tmp					tmpfs	rw,nosuid,nodev		0	0" >> /etc/fstab'

sudo sh -c 'echo "LANG=ru_RU.UTF-8" > /etc/default/locale'

sudo reboot