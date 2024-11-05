
What is Helm Charts?  
Package manager for your kuberntes cluster

## HelmCharts Commands

1. **Verify the Installation**  
   ```sh
   helm version
   ```

2. **Create your first Helm Chart**  
   ```sh
   helm create helloworld
   ```

3. **Directory structure of `helloworld`**  
   ```sh
   tree helloworld
   ```
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

4. **Install the Helm Chart using command**  
   ```sh
   helm install <release-name> <chart-name>
   helm install myhelloworld helloworld
   ```

5. **Verify the helm install command**  
   ```sh
   helm list -a
   ```

6. **Helm: Adding upstream repositories**  
   ```sh
   helm install redis bitnami/redis
   ```
   
   ### 5.1 How to ADD upstream Helm chart repository
   - **Add** chart repository  
     ```sh
     helm repo add bitnami https://charts.bitnami.com/bitnami
     helm search repo bitnami
     ```

   - **List** chart repositories  
     ```sh
     helm repo list
     ```

   - **Update** the chart information locally  
     ```sh
     helm repo update
     ```

   - **Index**: Generate the index file  
     ```sh
     helm repo index helloworld
     ```

   - **Remove** chart repository  
     ```sh
     helm repo remove bitnami
     ```

7. **Run Helm template for Springboot**  
   ```sh
   helm template helloworld
   ```
   This will display all the templates in the `template` folder.

8. **Lint command to find issues in Helm chart**  
   ```sh
   helm lint helloworld
   ```

9. **Helm --debug --dry-run**  
   Use this command to find issues with Helm chart configuration without actual deployment.  
   ```sh
   helm install myhelloworld --debug --dry-run helloworld
   ```

10. **Helm Upgrade**  
    ```sh
    helm upgrade <release-name>
    helm upgrade myhelloworld
    ```

11. **Helm history for roll-back**  
    ```sh
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

12. **Rollback Helm Release**  
    ```sh
    helm rollback myhelloworld 2
    ```

13. **Delete the Helm Release**  
    ```sh
    helm delete <release_name>
    helm delete myhelloworld
    ```