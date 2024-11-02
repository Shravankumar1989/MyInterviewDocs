
# Node Selector

---

## 1. Add a Label to a Node
To label a node, use the following command:
```bash
kubectl label nodes <node-name> <key>=<value>
```
Example:
```bash
kubectl label nodes node1 size=large
```

---

## 2. View Labels on Nodes
To display labels on all nodes, use:
```bash
kubectl get nodes --show-labels
```

---

## 3. Pod with Node Selector Example

Below is an example of a Pod configuration that uses a Node Selector to schedule the Pod on a node labeled with `size=large`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: nginx
    image: nginx
  nodeSelector:
    size: large
```