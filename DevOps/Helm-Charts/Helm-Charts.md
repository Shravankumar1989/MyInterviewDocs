
# Helm Charts Guide

## What is Helm?
Helm is a package manager for your Kubernetes cluster, allowing you to define, install, and upgrade even the most complex Kubernetes applications.

## Helm Commands

### 1. Verify the Installation
To check if Helm is installed, use:
```sh
helm version
```

### 2. Create Your First Helm Chart
To create a new Helm chart:
```sh
helm create helloworld
```

### 3. View the Helm Chart Directory Structure
Use the command:
```sh
tree helloworld
```
Example output structure:
```
helloworld
├── charts
├── Chart.yaml
├── templates
│  ├── deployment.yaml
│  ├── _helpers.tpl
│  ├── hpa.yaml
│  ├── ingress.yaml
│  ├── NOTES.txt
│  ├── serviceaccount.yaml
│  ├── service.yaml
│  └── tests
│      └── test-connection.yaml
└── values.yaml
```

### 4. Install the Helm Chart
To install a Helm chart:
```sh
helm install <release-name> <chart-name>
```
Example:
```sh
helm install myhelloworld helloworld
```

### 5. Verify the Helm Installation
To list all Helm releases:
```sh
helm list -a
```

### 6. Helm: Adding Upstream Repositories
To install from an upstream repository, use:
```sh
helm install redis bitnami/redis
```

#### 6.1 Managing Helm Chart Repositories
- **Add** a chart repository:
  ```sh
  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm search repo bitnami
  ```

- **List** chart repositories:
  ```sh
  helm repo list
  ```

- **Update** the chart information locally:
  ```sh
  helm repo update
  ```

- **Index** for generating the index file:
  ```sh
  helm repo index helloworld
  ```

- **Remove** a chart repository:
  ```sh
  helm repo remove bitnami
  ```

### 7. Run Helm Template for Springboot
To render templates without deploying:
```sh
helm template helloworld
```

### 8. Lint Command - Find Issues in a Helm Chart
To lint a Helm chart for errors:
```sh
helm lint helloworld
```

### 9. Debugging with --debug --dry-run
To debug a Helm chart without deploying:
```sh
helm install myhelloworld --debug --dry-run helloworld
```

### 10. Upgrading a Helm Release
To upgrade an existing Helm release:
```sh
helm upgrade <release-name>
```
Example:
```sh
helm upgrade myhelloworld
```

### 11. Viewing Helm Release History
To see the history of a Helm release:
```sh
helm history <release_name>
```
Example:
```sh
helm history myhelloworld
```
Example output:
```
REVISION    UPDATED                     STATUS          CHART           APP VERSION     DESCRIPTION
1           Mon Sep  4 10:00:00 2024    deployed        my-chart-1.0.0  1.0.0           Install complete
2           Tue Sep  5 12:00:00 2024    superseded      my-chart-1.1.0  1.1.0           Upgrade complete
3           Wed Sep  6 14:00:00 2024    deployed        my-chart-1.2.0  1.2.0           Upgrade complete
```

### 12. Rollback Helm Release
To rollback to a specific revision:
```sh
helm rollback <release_name> <revision>
```
Example:
```sh
helm rollback myhelloworld 2
```

### 13. Delete the Helm Release
To delete a Helm release:
```sh
helm delete <release_name>
```
Example:
```sh
helm delete myhelloworld
```