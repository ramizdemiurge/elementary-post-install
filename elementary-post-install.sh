clear

cd /tmp

echo "*** Enable add-apt-repository ***"
sudo apt-get install -y software-properties-common
echo

echo "*** Add repositories ***"
echo "Switch to daily elementary repository"
sudo sed -i 's/stable/daily/g' /etc/apt/sources.list.d/elementary.list
echo "Add AppCenter repository"
wget -qO - http://packages.elementary.io/key.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.elementary.io/appcenter xenial main" >> /etc/apt/sources.list.d/appcenter.list'
echo "Add repository for elementary Tweaks"
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
echo "Add repository for Nvidia driver"
sudo add-apt-repository -y ppa:graphics-drivers/ppa
echo "Add repository for Quodlibet"
sudo add-apt-repository -y ppa:lazka/ppa
echo "Add repository for Timeshift"
sudo add-apt-repository -y ppa:teejee2008/ppa
echo "Add repository for Java ***"
sudo add-apt-repository -y ppa:webupd8team/java
echo "Add repository for Sublime Text 3"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
echo "Add repository for Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
echo "Add repository for Virtualbox"
wget -q -O - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian/ xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'
echo "Enable partner repository"
sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
echo

echo "*** Update repositories ***"
sudo apt update
echo

echo "*** Install packages ***"
echo "Install elementary Tweaks"
sudo apt-get install -y elementary-tweaks
echo "Install Nvidia driver"
sudo apt-get install -y nvidia-381 nvidia-prime
sudo apt-get purge -y libcuda1-381
echo "Install Quodlibet"
sudo apt-get install -y quodlibet
echo "Install Libre Office"
sudo apt-get install -y libreoffice-writer libreoffice-calc libreoffice-gtk libreoffice-l10n-ru libreoffice-style-sifr
echo "Install Timeshift"
sudo apt-get install -y timeshift
echo "Install Java"
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true'
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true'
sudo apt-get install -y oracle-java8-installer
echo "Install Sublime Text 3"
sudo apt-get install -y sublime-text-installer
echo "Install Bleachbit"
sudo apt-get install -y bleachbit
echo "Install Google Chrome"
sudo apt-get install -y google-chrome-stable
sudo rm /etc/apt/sources.list.d/google.list
echo "Install Virtualbox"
sudo apt-get install -y virtualbox-5.1
echo "Install Puddletag"
sudo apt-get install -y puddletag
echo "Install Deluge"
sudo apt-get install -y deluge
echo "Install Gparted"
sudo apt-get install -y gparted
echo "Install Gnome system monitor"
sudo apt-get install -y gnome-system-monitor
echo "Install Hack Font"
sudo apt-get install -y fonts-hack-ttf
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 10"
echo "Install Git"
sudo apt-get install -y git
echo "Install Yadm"
sudo apt-get install -y yadm
echo "Install Mysql"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-client mysql-server
echo "Install Adb and Fastboot"
sudo apt-get install -y adb fastboot
echo "Install Virtualenv"
sudo apt-get install -y virtualenv
echo "Install Preload"
sudo apt-get install -y preload
echo "Install ppa-purge"
sudo apt-get install -y ppa-purge
echo "Install unrar"
sudo apt-get install -y unrar
echo "Install Eddy"
sudo apt-get install -y com.github.donadigo.eddy --no-install-recommends
echo "Install Steam"
sudo debconf-set-selections <<< 'steam steam/question select "I AGREE"'
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb 
sudo apt install -y ./steam.deb
echo "Install bomi"
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AABCPTkQBglJ3k7ryURWCsCBa/bomi.deb?raw=1 -O bomi.deb
sudo apt install -y ./bomi.deb --no-install-recommends
echo "Install custom icon theme"
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AABXhrHOztoAG10khWUSQ-ASa/elementary-djaler.deb?raw=1 -O elementary-djaler.deb
sudo apt install -y ./elementary-djaler.deb
gsettings set org.gnome.desktop.interface icon-theme elementary-djaler
echo "Install Zsh"
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AADloVS30EwzfB_AWrnjN81pa/zsh-common.deb?raw=1 -O zsh-common.deb
sudo apt install -y ./zsh-common.deb
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AABpsomgJRYKJLYvUMDgCNgAa/zsh.deb?raw=1 -O zsh.deb
sudo apt install -y ./zsh.deb
sudo -S chsh -s '/bin/zsh' "${USER}"
echo "Install Electrum"
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AAAH39Okv49rQuiGdi_MuK5Ia/python-electrum.deb?raw=1 -O python-electrum.deb
sudo apt install -y ./python-electrum.deb
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AAAUxsVVTi662ua4gDtCcwHZa/electrum.deb?raw=1 -O electrum.deb
sudo apt install -y ./electrum.deb
echo "Install Discord"
wget https://discordapp.com/api/download?platform=linux&format=deb -O discord.deb
sudo apt install -y ./discord.deb
echo "Install Slack"
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AAAzLx3p3upL3r7Qpt3icw2xa/slack.deb?raw=1 -O slack.deb
sudo apt install -y ./slack.deb
echo "Install Dropbox"
git clone https://github.com/zant95/elementary-dropbox
bash elementary-dropbox/install.sh -n
echo

echo "*** Uninstall packages ***"
sudo apt-get purge -y wingpanel-indicator-notifications wingpanel-indicator-bluetooth
sudo apt-get purge -y switchboard-plug-gcc-wacom switchboard-plug-printers switchboard-plug-sharing switchboard-plug-online-accounts switchboard-plug-parental-controls switchboard-plug-locale switchboard-plug-gcc-color switchboard-plug-bluetooth
sudo apt-get purge -y capnet-assist libscratchcore0 appcenter pantheon-calculator libmaya-calendar0 epiphany-browser-data libnoise-core0 simple-scan audience snap-photobooth evolution-data-server
sudo apt-get purge -y python3-apport apport-symptoms
sudo apt-get purge -y language-pack-bg language-pack-bg-base language-pack-gnome-bg language-pack-gnome-bg-base language-pack-ca language-pack-ca-base language-pack-gnome-ca language-pack-gnome-ca-base language-pack-cs language-pack-cs-base language-pack-gnome-cs language-pack-gnome-cs-base language-pack-da language-pack-da-base language-pack-gnome-da language-pack-gnome-da-base language-pack-hu language-pack-hu-base language-pack-gnome-hu language-pack-gnome-hu-base language-pack-id language-pack-id-base language-pack-gnome-id language-pack-gnome-id-base language-pack-ja language-pack-ja-base language-pack-gnome-ja language-pack-gnome-ja-base language-pack-ko language-pack-ko-base language-pack-gnome-ko language-pack-gnome-ko-base language-pack-nb language-pack-nb-base language-pack-gnome-nb language-pack-gnome-nb-base language-pack-nl language-pack-nl-base language-pack-gnome-nl language-pack-gnome-nl-base language-pack-pl language-pack-pl-base language-pack-gnome-pl language-pack-gnome-pl-base language-pack-sv language-pack-sv-base language-pack-gnome-sv language-pack-gnome-sv-base language-pack-th language-pack-th-base language-pack-gnome-th language-pack-gnome-th-base language-pack-tr language-pack-tr-base language-pack-gnome-tr language-pack-gnome-tr-base language-pack-uk language-pack-uk-base language-pack-gnome-uk language-pack-gnome-uk-base language-pack-vi language-pack-vi-base language-pack-gnome-vi language-pack-gnome-vi-base language-pack-zh language-pack-zh-base language-pack-gnome-zh language-pack-gnome-zh-base language-pack-zh-hant language-pack-zh-hant-base language-pack-gnome-zh-hant language-pack-gnome-zh-hant-base
sudo apt-get purge -y wbulgarian wdanish wdutch wpolish wukrainian wnorwegian wcatalan
sudo apt-get purge -y mpv
sudo apt-get purge -y fonts-noto-cjk
sudo apt-get autoremove -y
echo

echo "*** Upgrade packages ***"
sudo apt-get upgrade -y
echo

git clone https://github.com/png2378/telegram-icon-updater.git
cd telegram-icon-updater
bash setup.sh --install
cd /tmp

mkdir ~/.templates
rm -rf ~/Documents
rm -rf ~/Pictures
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Downloads
rm -rf ~/Music
rm -rf ~/Videos
rm -rf ~/.config/epiphany
rm -rf ~/.local/share/scratch-text-editor

sudo rm /usr/share/contractor/print.contract
sudo rm /usr/share/contractor/gnome-bluetooth.contract
sudo sh -c 'echo "[Contractor Entry]" > /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Name=Открыть от имени суперпользователя" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Icon=pantheon-files" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "MimeType=inode;" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Exec=gksudo pantheon-files %U" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Gettext-Domain=pantheon-files" >> /usr/share/contractor/folder-openasroot.contract'

yadm clone https://github.com/Djaler/dotfiles.git
yadm reset --hard origin/master
yadm remote set-url origin git@github.com:Djaler/dotfiles.git

gsettings set apps.light-locker lock-on-suspend false
gsettings set apps.light-locker lock-after-screensaver 0

gsettings set org.pantheon.desktop.wingpanel.indicators.power show-percentage true
gsettings set org.pantheon.desktop.slingshot show-category-filter false
gsettings set org.pantheon.terminal.settings unsafe-paste-alert false
gsettings set org.pantheon.files.preferences single-click false
gsettings set net.launchpad.screenshot folder-dir '/home/djaler'

gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle','terminate:ctrl_alt_bksp']"


sudo sh -c 'echo "/dev/sdb1			/media					btrfs	defaults		0	0" >> /etc/fstab'
sudo sh -c 'echo "tmpfs				/tmp					tmpfs	rw,nosuid,nodev		0	0" >> /etc/fstab'

ln -s /media/Dropbox ~/Dropbox
ln -s /media/Downloads ~/Downloads
ln -s /media/Videos ~/Videos
ln -s ~/Dropbox/Music ~/Music
ln -s ~/Dropbox/Stuff ~/Stuff
ln -s ~/Dropbox/Projects ~/Projects
ln -s /media/Steam ~/.local/share/Steam
ln -s /media/.dropbox ~/.dropbox
ln -s /media/.Trash-1000 ~/.Trash

sudo sh -c 'echo "LANG=ru_RU.UTF-8" > /etc/default/locale'

sudo sed -i 's/quiet splash//g' /etc/default/grub
sudo update-grub

sudo reboot
