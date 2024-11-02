# Types of Node Affinity

## 1.1 RequiredDuringSchedulingIgnoredDuringExecution:
This is the "hard" affinity rule. Pods will only be scheduled on nodes that meet the specified affinity requirements.  
If no nodes meet the conditions, the pod remains unscheduled (i.e., it stays in the Pending state).

---

## 1.2 PreferredDuringSchedulingIgnoredDuringExecution:
This is the "soft" affinity rule. Kubernetes will try to place the pod on a node that meets the conditions,  
but if no such node is available, the pod will still be scheduled on other nodes.