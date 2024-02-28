# Repository to setup k8s cluster using kubeadm

https://devopscube.com/setup-kubernetes-cluster-kubeadm/


#### step 1: run the master-node.sh script on master-node
'./master-node.sh'

#### Step 2: Run following commands on master node
'mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config'

#### Step 3: Check the join command to add worker nodes on cluster
'kubeadm token create --print-join-command'
