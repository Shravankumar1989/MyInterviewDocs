
# Helm Charts: A Package Manager for Your Kubernetes Cluster

Helm is a powerful tool that simplifies the deployment and management of Kubernetes applications by using charts. A Helm Chart is essentially a packaged set of Kubernetes resources that can be installed, configured, and managed easily.

---

## Helm Commands

### 1. Verify the Installation
To verify if Helm is installed and check its version, use:
```bash
helm version
```

### 2. Create Your First Helm Chart
To create a new Helm Chart:
```bash
helm create helloworld
```

### 3. Helm Chart Directory Structure
To view the file structure of your newly created chart:
```bash
tree helloworld
```

Example structure:
```
helloworld
├── charts
├── Chart.yaml
├── templates
│   ├── deployment.yaml
│   ├── _helpers.tpl
│   ├── hpa.yaml
│   ├── ingress.yaml
│   ├── NOTES.txt
│   ├── serviceaccount.yaml
│   ├── service.yaml
│   └── tests
│       └── test-connection.yaml
└── values.yaml
```

### 4. Install the Helm Chart
To install a Helm chart:
```bash
helm install <release-name> <chart-name>
helm install myhelloworld helloworld
```

### 5. Verify the Helm Installation
To list all Helm releases:
```bash
helm list -a
```

### 6. Adding Upstream Repositories
Example: Installing Redis from the Bitnami repository:
```bash
helm install redis bitnami/redis
```

#### Repository Management Commands
- **Add**: Add a chart repository
  ```bash
  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm search repo bitnami
  ```

- **List**: List all repositories
  ```bash
  helm repo list
  ```

- **Update**: Update local chart information
  ```bash
  helm repo update
  ```

- **Index**: Generate an index file
  ```bash
  helm repo index helloworld
  ```

- **Remove**: Remove a chart repository
  ```bash
  helm repo remove bitnami
  ```

### 7. Run Helm Template for Spring Boot
To generate the template files in the `templates` folder:
```bash
helm template helloworld
```

### 8. Lint Command - Find Issues in the Helm Chart
To lint and check for issues in a Helm chart:
```bash
helm lint helloworld
```

### 9. Debugging - Dry Run
To perform a dry run and debug Helm chart configurations:
```bash
helm install myhelloworld --debug --dry-run helloworld
```

### 10. Upgrade a Helm Release
To upgrade an existing Helm release:
```bash
helm upgrade <release-name>
helm upgrade myhelloworld
```

### 11. Helm History for Rollback
To view the history of a release:
```bash
helm history <release_name>
helm history myhelloworld
```

Example output:
```
REVISION    UPDATED                     STATUS          CHART           APP VERSION     DESCRIPTION
1           Mon Sep  4 10:00:00 2024    deployed        my-chart-1.0.0  1.0.0           Install complete
2           Tue Sep  5 12:00:00 2024    superseded      my-chart-1.1.0  1.1.0           Upgrade complete
3           Wed Sep  6 14:00:00 2024    deployed        my-chart-1.2.0  1.2.0           Upgrade complete
```

### 12. Rollback a Helm Release
To roll back a release to a previous version:
```bash
helm rollback myhelloworld 2
```

### 13. Delete a Helm Release
To delete a release:
```bash
helm delete <release_name>
helm delete myhelloworld
```

---

This guide covers the essential Helm commands to manage Kubernetes applications effectively using Helm Charts.