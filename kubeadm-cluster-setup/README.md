# Setting Up a Kubernetes Cluster Using Kubeadm
https://devopscube.com/setup-kubernetes-cluster-kubeadm/

This repository provides comprehensive scripts and instructions for effortlessly setting up a Kubernetes cluster using Kubeadm on various cloud providers such as Azure, AWS, or any virtual machines (VMs). Whether you're a beginner exploring Kubernetes or an experienced user looking for a streamlined setup process, this repository offers a reliable solution tailored to your needs.

##### Key Features:

**Cloud Provider Agnostic:**
The provided scripts and guides are designed to work seamlessly across different cloud providers, ensuring flexibility and compatibility with your preferred infrastructure.

**Simplified Setup Process:**
With step-by-step instructions and ready-to-use scripts, setting up a Kubernetes cluster becomes a breeze. Gone are the days of tedious manual configurations – simply follow the guide and let the scripts handle the heavy lifting.

**Scalable Architecture:**
Whether you're starting with a single-node cluster or scaling up to a multi-node production environment, this repository accommodates your growth trajectory. Easily add or remove nodes as needed, all while maintaining cluster integrity and performance.

**Automated Network Configuration:**
Say goodbye to networking headaches. The included scripts automate the setup of essential networking components, such as the Calico network plugin, ensuring smooth communication between pods and seamless cluster operation.

##### How to Use:
**Provision EC2 Instances:**
Log in to your cloud provider account (e.g., AWS) and create the necessary EC2 instances. Follow the provided guidelines for resource requirements to ensure optimal cluster performance.

**Execute Setup Scripts:**
Connect to the master node and execute the master-node.sh script to initialize the master node. Then, proceed to set up the worker nodes using the worker-node.sh script. Sit back and relax as the scripts handle the intricate setup process for you.

**Join Nodes to the Cluster:**
Obtain the join command from the master node and run it on each worker node to join them to the cluster. This step ensures seamless communication and coordination across all nodes within the Kubernetes cluster.

**Verification and Validation:**
Once the setup is complete, verify the status of the Kubernetes nodes using the kubectl get nodes command. This ensures that all nodes are successfully integrated into the cluster and ready to handle your containerized workloads.

#### Step 1: Provision EC2 Instances on AWS
Log in to your AWS account and create three EC2 instances. According to the Kubeadm documentation, the master node requires at least 2 CPUs and 2GB of RAM.

#### Step 2: Connect to the Master Node
Connect to your master node using SSH.

#### Step 3: Set Up Master Node
Clone this repository onto the EC2 master node and run the master-node.sh script:
```
./master-node.sh
```
Pay attention to the running logs and provide inputs as required. Upon successful execution, you'll see the message "Master node setup successful".

#### Step 4: Configure Kubectl on Master Node
After successfully running the script, execute the following commands on the master node:
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

#### Step 5: Set Up Network Communication
To establish communication between pods, set up the `Calico` network by running the following command:
```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
```
##### Calico Network
> Calico is a robust networking solution tailored for Kubernetes environments, offering efficient pod communication, enhanced security through network policies, scalability, and seamless integration with Kubernetes. In this repository, we leverage Calico to establish a reliable networking infrastructure for our Kubernetes cluster. With Calico, we ensure optimized pod-to-pod communication, enforce network security policies, and scale our cluster effectively to meet evolving workload demands. Its open-source nature and active community support further enhance its reliability and adaptability, making it an indispensable component of our Kubernetes deployment strategy.

#### Step 6: Provision Worker Nodes
After setting up the master node, connect to a worker node EC2 instance. You can add multiple worker nodes to a single master in a cluster.

#### Step 7: Set Up Worker Nodes
Clone this repository onto the worker node and run the worker-node.sh script in the terminal:
```
./worker-node.sh
```
Pay attention to the running logs and provide inputs as required. Upon successful execution, you'll see the message "Worker node setup successful".

#### Step 8: Join Worker Nodes to the Cluster
To join the cluster, obtain the joining string by running the following command on the master node:
```
kubeadm token create --print-join-command
```
Copy the join command string and run it on each worker node to join them to the cluster.

#### Step 9: Verify Kubernetes Nodes
Finally, verify the Kubernetes nodes by running:
```
kubectl get nodes
```

Now your Kubernetes cluster is set up and ready for use.

