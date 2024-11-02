
# Taints and Tolerations in Kubernetes

---

## 1. What is Taint and Toleration?
Taints and Tolerations control which pods can be scheduled on which nodes.

### Key Points:
- **Taint** - Applied at the Node Level to restrict pod placement.
- **Toleration** - Applied at the Pod Level to allow pods to tolerate certain node taints.

---

## 2. Common Effects for Taints

### 2.1 NoSchedule
Prevents pods from being scheduled on the node unless they tolerate the taint.

### 2.2 PreferNoSchedule
The scheduler tries to avoid placing pods on this node, but if necessary, it will still schedule pods.

### 2.3 NoExecute
Existing pods that do not tolerate the taint are evicted, and new pods are not scheduled on the node.

---

## 3. Commands for Taint and Toleration

### 3.1 Apply Taint to a Node
```bash
kubectl taint nodes <node-name> <key>=<value>:<effect>
```
**Example:**
```bash
kubectl taint nodes node1 app=blue:NoSchedule
```

### 3.2 Remove Taint from a Node
To remove a taint from a node, use a hyphen (-) at the end of the taint specification:
```bash
kubectl taint nodes <node-name> <key>:<effect>-
```
**Example:**
```bash
kubectl taint nodes node1 app:NoSchedule-
```

### 3.3 List Taints on a Node
```bash
kubectl describe node <node-name>
```
**Example:**
```bash
kubectl describe node node1
```

### 3.4 Add Toleration to a Pod

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "app"
    operator: "Equal"
    value: "blue"
    effect: "NoSchedule"
```