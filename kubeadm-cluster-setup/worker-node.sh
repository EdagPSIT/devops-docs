#!/bin/bash

# Update and Upgrade Ubuntu
sudo apt update
sudo apt upgrade -y

# Disable Swap (all nodes)
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Add Kernel Parameters (all nodes)
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter

# Configure the critical kernel parameters for Kubernetes using the following
sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

# reload the changes
sudo sysctl --system

# Install Containerd Runtime (all nodes)
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

# Enable the Docker repository
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package list and install containerd
sudo apt update
sudo apt install -y containerd.io

# Configure containerd to start using systemd as cgroup
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

# Restart and enable the containerd service
sudo systemctl restart containerd
sudo systemctl enable containerd

# Add Apt Repository for Kubernetes (all nodes)
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/kubernetes-xenial.gpg
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

# Install Kubectl, Kubeadm, and Kubelet (all nodes)
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


echo "worker node setup configuration completed successfully."
