
# Kubernetes Pod and Service Configuration

---

## Pod Definition

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app  # Name of the Pod
  labels:
    app: frontend  # Label used for service discovery (commonly matched by a Service's selector)
    environment: production  # Additional label to describe the environment (can also be used for service selection or organization)
spec:
  containers:
    - name: nginx  # Name of the container inside the Pod
      image: nginx  # Image used for this container (nginx in this case)
      resources:
        limits:
          memory: "128Mi"  # Maximum memory the container can use
          cpu: "500m"      # Maximum CPU the container can use (500 millicores = 0.5 CPU)
        requests:
          memory: "64Mi"   # Guaranteed memory the container will have reserved
          cpu: "250m"      # Guaranteed CPU the container will have reserved (250 millicores = 0.25 CPU)
```

---

## Service Definition

```yaml
apiVersion: v1
kind: Service
metadata:
  name: frontend-service  # Name of the service to expose the pod
spec:
  selector:
    app: frontend  # This label must match the label in the Pod definition (app: frontend)
  ports:
    - protocol: TCP  # Protocol for communication, typically TCP for web services
      port: 80       # The port on which the service will be exposed
      targetPort: 80 # The port on the container (in the Pod) where traffic will be directed
  type: ClusterIP     # The type of service. ClusterIP exposes the service internally within the cluster
```