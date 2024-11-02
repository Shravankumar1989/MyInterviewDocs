# kubeadm Setup on Ubuntu 24.04

## 1 - Both Master & Worker Node

1. **Install Docker, the container runtime**  
    ```bash
    sudo apt-get install -y docker.io
    ```

2. **Install kubelet, kubeadm, and kubectl**  
    ```bash
    sudo apt-get install -y kubelet kubeadm kubectl
    ```

3. **Prevent automatic updates/removals of Kubernetes packages**  
    ```bash
    sudo apt-mark hold kubelet kubeadm kubectl
    ```

4. **Install the kube-apiserver snap package**  
    ```bash
    sudo snap install kube-apiserver
    ```

---

## 2 - Master

1. **Initialize the Kubernetes master node**  
    ```bash
    sudo kubeadm init --pod-network-cidr=10.244.0.0/16
    ```

2. **Apply the Flannel CNI network overlay**  
    ```bash
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    ```

---

## 3 - Worker Node

1. **Join a worker node to the Kubernetes cluster**  
   _(Replace the placeholders with actual values)_  
    ```bash
    sudo kubeadm join <master-node-ip>:<master-node-port> --token <token> --discovery-token-ca-cert-hash <hash>
    ```

---

## 4 - Verify the Cluster

1. **List all nodes in the cluster**  
    ```bash
    kubectl get nodes
    ```

2. **List all pods in all namespaces**  
    ```bash
    kubectl get pods --all-namespaces
    ```