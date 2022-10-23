
#!/bin/bash
sudo apt-get update -yq
sudo apt-get install -yq build-essential linux-headers-$(uname -r) unzip p7zip-full linux-image-extra-virtual
sudo apt-get install -yq python3-pip
pip3 install psutil

sudo touch /etc/modprobe.d/blacklist-nouveau.conf
sudo bash -c "echo 'blacklist nouveau' >> /etc/modprobe.d/blacklist-nouveau.conf"
sudo bash -c "echo 'blacklist lbm-nouveau' >> /etc/modprobe.d/blacklist-nouveau.conf"
sudo bash -c "echo 'options nouveau modeset=0' >> /etc/modprobe.d/blacklist-nouveau.conf"
sudo bash -c "echo 'alias nouveau off' >> /etc/modprobe.d/blacklist-nouveau.conf"
sudo bash -c "echo 'alias lbm-nouveau off' >> /etc/modprobe.d/blacklist-nouveau.conf"

sudo touch /etc/modprobe.d/nouveau-kms.conf
sudo bash -c "echo 'options nouveau modeset=0' >>  /etc/modprobe.d/nouveau-kms.conf"
sudo update-initramfs -u
sudo reboot
