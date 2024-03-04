### Prerequisite to install kubeadm
1. 2 GB or more of RAM per machine
2. 2 CPUs or more.
3. Full network connectivity between all machines in the cluster (public or private network is fine).
4. Unique hostname, MAC address, and product_uuid for every node. See here for more details.
5. Certain ports are open on your machines
   [Control-plane](![image](https://github.com/EdagPSIT/devops-docs/assets/134361096/a24927f9-7292-4db0-942d-c5bd2611886d)
   [Worker-node](![image](https://github.com/EdagPSIT/devops-docs/assets/134361096/e68c5418-2b6f-4c6f-883a-46e76e5ef355)
   Default ports for service configuration - 30000 - 32267
7. Swap configuration The default behavior of a kubelet was to fail to start if swap memory was detected on a node.
   ```
   free -h
   ```
