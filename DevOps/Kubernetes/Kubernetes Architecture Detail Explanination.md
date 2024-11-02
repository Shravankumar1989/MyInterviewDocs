# Kubernetes Overview

[LinkedIn Profile of Imran Khan](https://www.linkedin.com/in/imran-khan-8520b457/)

## What is Kubernetes?
Kubernetes is an open-source container orchestration tool for deploying, scaling, and managing automated applications.

---

## Kubernetes Architecture

1. **KubeCtl**
2. **API Server**
3. **Controller Manager**
4. **ETCD**
5. **Kube-Scheduler**
6. **Node**
    - **Kubelet**
    - **kube-proxy**
    - **Pod**
    - **Container Runtime Engine**

---

### Note:
- Points 2, 3, 4, 5 represent the **Master Node**
- Point 6 represents the **Worker Node**

---

## Component Descriptions

1. **KubeCtl**  
   Kubectl is the default interface tool between the user and the Kubernetes cluster.

2. **API Server**  
   The API Server is the component through which users interact with the control plane.

3. **Controller Manager**  
   Responsible for managing all controllers in the cluster, such as:
   - Replication Controller
   - Node Controller
   - Endpoint Controller
   - Token Controller

4. **ETCD**  
   ETCD is a key-value store that stores all cluster data.

5. **Kube-Scheduler**  
   Kube-Scheduler is a control plane process that assigns Pods to Nodes.

6. **Node**  
   A Node is a worker machine in a Kubernetes cluster.

    - **Kubelet**: The Kubernetes agent that manages the node, ensuring all pods are running and healthy.

    - **Kube-proxy**: Manages all network traffic on the node.

    - **Container Runtime Engine**: Responsible for running containers on the cluster.