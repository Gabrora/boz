#!/bin/bash
# Update
sudo yum -y update
sudo bash -c "echo 'blacklist nouveau' > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo 'options nouveau modeset=0' >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
# Install Prerequisites
sudo yum -y group install "Development Tools"
sudo yum -y install kernel-devel-$(uname -r) kernel-headers-$(uname -r)
sudo yum -y install epel-release
sudo yum-config-manager --add-repo http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo
sudo yum clean expire-cache
# Install Nvidia driver & enable it
sudo yum -y install nvidia-driver-latest-dkms
sudo yum -y install cuda
sudo yum -y install cuda-drivers
sudo setenforce 0
sudo systemctl enable nvidia-persistenced
# Install Hashcat
sudo yum -y install hashcat
