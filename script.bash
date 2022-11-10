#!/bin/bash

# mostly copied from: https://medium.com/@iraklis/running-hashcat-v4-0-0-in-amazons-aws-new-p3-16xlarge-instance-e8fab4541e9b
#
sudo apt-get update -yq
sudo apt-get install -yq build-essential linux-headers-$(uname -r) unzip p7zip-full linux-image-extra-virtual
sudo apt-get install -yq ocl-icd-libopencl1 opencl-headers clinfo
#sudo apt-get install -yq libhwloc-plugins libhwloc5 libltdl7 libpciaccess0 libpocl2 libpocl2-common ocl-icd-libopencl1 pocl-opencl-icd
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

### Install nVidia Drivers
wget http://us.download.nvidia.com/tesla/410.104/NVIDIA-Linux-x86_64-410.104.run
sudo /bin/bash NVIDIA-Linux-x86_64-410.104.run --ui=none --no-questions --silent -X
