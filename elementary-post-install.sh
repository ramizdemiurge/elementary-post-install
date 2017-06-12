#Мой вариант.
clear

cd /tmp

echo "*** Enable add-apt-repository ***"
sudo apt-get install -y software-properties-common
echo

echo "*** Add repositories ***"

echo "Add repository for elementary Tweaks"
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks

echo "Add repository for Nvidia driver"
sudo add-apt-repository -y ppa:graphics-drivers/ppa

echo "Add repository for Java ***"
sudo add-apt-repository -y ppa:webupd8team/java

echo "Add repository for Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'

echo "Add repository for Virtualbox"
wget -q -O - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian/ xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'

echo "*** Update repositories ***"
sudo apt update
echo

echo "*** Install packages ***"
echo "Install elementary Tweaks"
sudo apt-get install -y elementary-tweaks

echo "Install Nvidia driver"
sudo apt-get install -y nvidia-381 nvidia-prime
sudo apt-get purge -y libcuda1-381

echo "Install Libre Office"
sudo apt-get install -y libreoffice-writer libreoffice-calc libreoffice-gtk libreoffice-l10n-ru libreoffice-style-sifr

echo "Install Java"
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true'
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true'
sudo apt-get install -y oracle-java8-installer

echo "Install Bleachbit"
sudo apt-get install -y bleachbit

echo "Install Google Chrome"
sudo apt-get install -y google-chrome-stable
sudo rm /etc/apt/sources.list.d/google.list

echo "Install Virtualbox"
sudo apt-get install -y virtualbox-5.1

echo "Install Gparted"
sudo apt-get install -y gparted

echo "Install Hack Font"
sudo apt-get install -y fonts-hack-ttf
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 10"

echo "Install Git"
sudo apt-get install -y git

echo "Install Preload"
sudo apt-get install -y preload

echo "Install zRam"
sudo apt-get install -y zram-config

echo "Install Virtualenv"
sudo apt-get install -y virtualenv

echo "Install ppa-purge"
sudo apt-get install -y ppa-purge

echo "Install unrar"
sudo apt-get install -y unrar

echo "Install Pidgin"
sudo apt-get install -y pidgin
sudo apt-get install -y pidgin-otr

echo "Install Redshift-gtk"
sudo apt install -y redshift-gtk

echo "Install ettercap"
sudo apt-get install -y ettercap

echo "Install gedit"
sudo apt-get install -y gedit

echo "Install lxtask"
sudo apt-get install -y lxtask

echo "Install FileZilla"
sudo apt-get install -y filezilla

echo "Install Lingot"
sudo apt-get install -y lingot

echo "Install Transmission-gtk"
sudo apt-get install -y transmission-gtk

echo "Install VeraCrypt"
sudo apt-get install -y veracrypt

echo "Install Discord"
wget https://discordapp.com/api/download?platform=linux&format=deb -O discord.deb
sudo apt install -y ./discord.deb

echo "Install Zsh"
wget https://www.dropbox.com/s/wga1nzubw3bbi8f/zsh-common.deb?raw=1 -O zsh-common.deb
sudo apt install -y ./zsh-common.deb
wget https://www.dropbox.com/s/2y2w3ic7jlub5ua/zsh.deb?raw=1 -O zsh.deb
sudo apt install -y ./zsh.deb
sudo -S chsh -s '/bin/zsh' "${USER}"

echo "Install Electrum"
wget https://www.dropbox.com/s/ul0n9zzmunzxv8a/python-electrum.deb?raw=1 -O python-electrum.deb
sudo apt install -y ./python-electrum.deb
wget https://www.dropbox.com/s/nstky5p2aulete9/electrum.deb?raw=1 -O electrum.deb
sudo apt install -y ./electrum.deb

echo "Install Dropbox"
git clone https://github.com/zant95/elementary-dropbox
bash elementary-dropbox/install.sh -n

echo "Install Paper-elementary iconpack"
git clone https://github.com/ramizdemiurge/paper-icon-theme
bash paper-icon-theme/easy_install.sh -n

echo "Install Wireshark"
sudo apt-get install -y wireshark-gtk
echo

echo "*** Uninstall packages ***"
sudo apt-get purge -y switchboard-plug-gcc-wacom  switchboard-plug-parental-controls
sudo apt-get purge -y python3-apport apport-symptoms
sudo apt-get purge -y language-pack-bg language-pack-bg-base language-pack-gnome-bg language-pack-gnome-bg-base language-pack-ca language-pack-ca-base language-pack-gnome-ca language-pack-gnome-ca-base language-pack-cs language-pack-cs-base language-pack-gnome-cs language-pack-gnome-cs-base language-pack-da language-pack-da-base language-pack-gnome-da language-pack-gnome-da-base language-pack-hu language-pack-hu-base language-pack-gnome-hu language-pack-gnome-hu-base language-pack-id language-pack-id-base language-pack-gnome-id language-pack-gnome-id-base language-pack-ja language-pack-ja-base language-pack-gnome-ja language-pack-gnome-ja-base language-pack-ko language-pack-ko-base language-pack-gnome-ko language-pack-gnome-ko-base language-pack-nb language-pack-nb-base language-pack-gnome-nb language-pack-gnome-nb-base language-pack-nl language-pack-nl-base language-pack-gnome-nl language-pack-gnome-nl-base language-pack-pl language-pack-pl-base language-pack-gnome-pl language-pack-gnome-pl-base language-pack-sv language-pack-sv-base language-pack-gnome-sv language-pack-gnome-sv-base language-pack-th language-pack-th-base language-pack-gnome-th language-pack-gnome-th-base language-pack-tr language-pack-tr-base language-pack-gnome-tr language-pack-gnome-tr-base language-pack-uk language-pack-uk-base language-pack-gnome-uk language-pack-gnome-uk-base language-pack-vi language-pack-vi-base language-pack-gnome-vi language-pack-gnome-vi-base language-pack-zh language-pack-zh-base language-pack-gnome-zh language-pack-gnome-zh-base language-pack-zh-hant language-pack-zh-hant-base language-pack-gnome-zh-hant language-pack-gnome-zh-hant-base
sudo apt-get purge -y wbulgarian wdanish wdutch wpolish wukrainian wnorwegian wcatalan
sudo apt-get autoremove -y
echo

echo "*** Upgrade packages ***"
sudo apt-get upgrade -y
echo


git clone https://github.com/png2378/telegram-icon-updater.git
cd telegram-icon-updater
bash setup.sh --install
cd /tmp

sudo update-grub

sudo reboot
