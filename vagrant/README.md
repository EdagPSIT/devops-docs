# Repository to create developement, learning environment with Vagrant.

#### References: 
- https://github.com/techiescamp/vagrant-kubeadm-kubernetes


### 1. Vagrant Installation prequisite.  
   - You should have installed VirtualBox, VMWare or Hyper-V(only for windows).  
   - The vagrant works with 'Docker' provider as well, so make sure you are installed docker on your host machine. 


### memory swap
to check
```
free -h
```
- It can be observed that swap memory is disabled when we build vm using vagrant
to disabale/off swap - temp off
```
sudo swapoff -a
```
