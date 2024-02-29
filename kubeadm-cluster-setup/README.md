# Repository to setup k8s cluster using kubeadm
https://devopscube.com/setup-kubernetes-cluster-kubeadm/
##### The repository for creating a cluster using kubeadm on cloud providers such as `AZURE`, `AWS` or on any `VM's`.
I will only provide steps for AWS, the same steps can be followed for other providers.

#### Step 1: Log in to your aws account and run 3 EC2 instances. As per the kubeadm documentation, you need master node with atleast 2cpu's and 2GB of RAM.

#### Step 2: Connect to your master node using ssh.5

#### Step 3: clone this repository in EC2 master node. and run master-node.sh script.
```
./master-node.sh
```
- Here you need to pay attention to running logs and provide inputs as per the requirements.
- - At the end of successful running, you will see a message `master node setup succesfuly`

#### Step 4: After successful running of .sh script, run following commands on master node
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

#### Step 5: To build the communication between the pods, we need to setup the network. Here we are setting `calico` network by running following command.
```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
```

#### Step 6: After master-node setup, connect to worker node EC2 instance. You can add/join multiple worker-node to single master in a cluster.

#### Step 7: Clone this repository and run worker-node.sh script in the terminal.
```
./worker-node.sh
```
- Here you need to pay attention to running logs and provide inputs as per the requirements.
- At the end of successful running, you will see a message `worker node setup succesfuly`

#### Step 8: To join the cluster, we need joining string. Check the join command to add worker nodes on cluster. Run this command on master node
```
kubeadm token create --print-join-command
```

#### Step 9: Now you can check kubenetes nodes by
```
kubectl get nodes
```

