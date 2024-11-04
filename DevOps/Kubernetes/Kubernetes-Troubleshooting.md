# Troubleshooting Kubernetes ImagePullBackOff and CrashLoopBackOff Errors

---

## ImagePullBackOff or ErrImagePull

### 1. What Causes ImagePullBackOff?
1.1 **Incorrect Image Name or Tag**  
1.2 **Missing Image in the Registry**  
1.3 **Registry Requires Authentication**

### 2. How to Debug or Troubleshoot ImagePullBackOff?

- **2.1 Inspect Pod Status**
    ```bash
    kubectl describe pod <pod-name> -n <namespace>
    ```

- **2.2 Check the Pod Logs (If Applicable)**
    ```bash
    kubectl logs <pod-name> -n <namespace>
    ```

- **2.3 Verify Image Name, Tag, and Registry**
    ```bash
    kubectl get deployment <deployment-name> -o yaml
    ```

- **2.4 Test Image Pull Manually from Nodes**
    ```bash
    docker pull <image-name>
    ```

- **2.5 Validate ImagePullPolicy**
    ```bash
    kubectl get pod <pod-name> -o yaml | grep imagePullPolicy
    ```

- **2.6 Use kubectl exec to Debug the Node Environment**
    ```bash
    kubectl exec -it <pod-name> -- /bin/bash
    ```

- **2.7 Check CPU, Memory, and Load Average**
    - **2.7.1 Install the Metrics Server**
        ```bash
        kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
        ```
    - **2.7.2 Using kubectl top**
        ```bash
        kubectl top pod <pod-name> --namespace <namespace>
        ```
    - **2.7.3 Check memory usage:**
        ```bash
        free -h
        ```
    - **2.7.4 Check CPU usage:**
        ```bash
        top
        ```
    - **2.7.5 Check CPU load averages**
        ```bash
        uptime
        ```
    - **2.7.6 Use ps to check processes**
        ```bash
        ps aux --sort=-%mem | head
        ```
    - **2.7.7 Use htop for an Enhanced View (if installed)**
        ```bash
        htop
        ```

---

## CrashLoopBackOff

### 1. What Causes CrashLoopBackOff?
A **CrashLoopBackOff** occurs when a pod starts, crashes, and Kubernetes repeatedly attempts to restart it but fails to run successfully.

Common causes include:
1.1 **Misconfigured Startup ENTRYPOINT or CMD**  
1.2 **Missing Configuration or Environment Variables**  
1.3 **Insufficient Resources (Memory or CPU)**  
1.4 **Crash Due to OOMKilled (Out of Memory)**  
1.5 **Unhealthy Readiness or Liveness Probes**

### 2. How to Debug or Troubleshoot CrashLoopBackOff?

- **2.1 Check the Pod Logs (If Applicable)**
    ```bash
    kubectl logs <pod-name> -n <namespace>
    kubectl logs <pod-name> --namespace <namespace> --previous
    ```

- **2.2 Describe the Pod**
    ```bash
    kubectl describe pod <pod-name> --namespace <namespace>
    ```

- **2.3 Inspect Pod Events**
    ```bash
    kubectl get events --namespace <namespace>
    ```

- **2.4 Review Liveness and Readiness Probes**

- **2.5 Check Resource Limits**
    ```bash
    kubectl top pod <pod-name> --namespace <namespace>
    ```

- **2.6 Use Debugging**
    ```bash
    kubectl exec -it <pod-name> --namespace <namespace> -- /bin/sh
    ```

- **2.7 Check CPU, Memory, and Load Average**
    - **2.7.1 Install the Metrics Server**
        ```bash
        kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
        ```
    - **2.7.2 Using kubectl top**
        ```bash
        kubectl top pod <pod-name> --namespace <namespace>
        ```
    - **2.7.3 Check memory usage:**
        ```bash
        free -h
        ```
    - **2.7.4 Check CPU usage:**
        ```bash
        top
        ```
    - **2.7.5 Check CPU load averages**
        ```bash
        uptime
        ```
    - **2.7.6 Use ps to check processes**
        ```bash
        ps aux --sort=-%mem | head
        ```
    - **2.7.7 Use htop for an Enhanced View (if installed)**
        ```bash
        htop
        ```


# Kubernetes Deployment Rollout History and Rollback

Assuming you have a deployment named `my-app` and want to view its rollout history, use the following command:

```sh
kubectl rollout history deployment/my-app
```

This command might display an output similar to:

```
REVISION  CHANGE-CAUSE
1         Initial deploy
2         kubectl set image deployment/my-app my-app=nginx:1.16
3         kubectl set image deployment/my-app my-app=nginx:1.17
```

To view the details of a specific revision, such as revision 2, you can use:

```sh
kubectl rollout history deployment/my-app --revision=2
```

If necessary, you can roll back to a specific revision, for instance, to revision 2, with the following command:

```sh
kubectl rollout undo deployment/my-app --to-revision=2
```