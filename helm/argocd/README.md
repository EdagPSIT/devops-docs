## Argocd Installation on k8s cluster using bitnami helm charts

Welcome to the guide on installing ArgoCD on a Kubernetes cluster using Bitnami Helm charts. ArgoCD is a powerful continuous delivery tool for Kubernetes, enabling automated deployment and management of applications. By following the steps outlined below, you'll have ArgoCD up and running in no time.

#### Step-by-Step Installation Guide
##### Step 1: Helm3 Installation
Helm is the package manager for Kubernetes, allowing you to easily manage applications and resources. Follow these commands to install Helm3 on your Linux server:
Head over to helm intallation page at [here](https://helm.sh/docs/intro/install/)

```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```
###### Step 2: Adding Bitnami repo
Bitnami offers a variety of Helm charts for popular applications, including ArgoCD. Add the Bitnami repository to your Helm configuration:
```
helm repo add bitnami https://charts.bitnami.com/bitnami
```
###### Step 3: Install ArgoCD Chart
Create a namespace for ArgoCD and install the ArgoCD chart:
>In Kubernetes, namespaces provides a mechanism for isolating groups of resources within a single cluster. Names of resources need to be unique within a namespace, but not across namespaces. Namespace-based scoping is applicable only for namespaced objects (e.g. Deployments, Services, etc) and not for cluster-wide objects (e.g. StorageClass, Nodes, PersistentVolumes, etc).
```
kubectl create namespace argocd
helm install my-release bitnami/argo-cd -n argocd
```
All bitnami charts available can be found [here](https://github.com/bitnami/charts/tree/main/bitnami)

###### Step 4: Service Type Load Balancer
Change the ArgoCD server service type to LoadBalancer to expose it externally:
```
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
###### Step 5: Port Forwarding
Alternatively, use port forwarding to access the ArgoCD UI without exposing the service:
```
kubectl port-forward svc/argocd-argo-cd-server -n argocd 8080:443
```

###### Step 6: Login Using The CLI
Retrieve the auto-generated initial password for the `admin` account and login to the ArgoCD UI:
```
echo "Password: $(kubectl -n argocd get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"
```
You're now ready to use ArgoCD for continuous delivery on your Kubernetes cluster. Enjoy deploying and managing your applications with ease!
