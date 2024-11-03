# What is Artifactory? / What is JFrog Artifactory?

1. **Artifactory** is a binary repository manager developed by JFrog.
2. It is a tool used to store, manage, and distribute binaries, artifacts, and dependencies in software development processes.
3. **JFrog Artifactory 7.90.10** is the latest stable release.

## Key Features of Artifactory:
1. **Universal Artifact Management**: Supports a wide range of technologies and package types.
2. **Repository Types**:
   - **Local Repositories**: Stores locally created artifacts.
   - **Proxy Repositories** or **Remote Repositories**: Caches artifacts from remote sources.
   - **Virtual Repositories**: Aggregates local and proxy repositories under a single URL, simplifying access and management of artifacts.
3. **Integration with CI/CD Tools**: Seamlessly integrates with various CI/CD pipelines.
4. **Version Control for Binaries**: Manages different versions of binaries and artifacts.
5. **High Availability and Scalability**: Supports distributed environments and scaling.
6. **Build Information Integration**: Tracks and stores build metadata for better traceability.

## How to Configure JFrog Artifactory with Jenkins?

### Artifactory Side
1. Create **Deployer Credentials** (Username and Password).
2. Create a **Local Repository**.

### Jenkins Side
1. **Manage Jenkins** -> **Manage Plugins** -> Go to **Available** -> Install **Artifactory Plugins**.
2. **Manage Jenkins** -> **Configure System** (Configure Server) -> Find **JFrog** -> Click on **Add JFrog Platform Instances**.
3. **Instance ID**: Add any instance name (e.g., `JFrog`).
4. **JFrog Platform URL**: Add the JFrog URL.
5. Click on **Advanced Configuration**:
   - 5.1 Add **JFrog Artifactory URL** (e.g., `http://1.23.45.46:8082/artifactory`).
   - 5.2 Add **JFrog Distribution URL** (e.g., `http://1.23.45.46:8082/distribution`).
6. **Default Deployer Credentials**:
   - 6.1 Add **Username**.
   - 6.2 Add **Password**.
7. Click on **Save and Apply**.

### Jenkins Job Configuration
1. Select the desired **Jenkins job**.
2. Select **Configure**.
3. Select **Build Environment** -> Enable **Maven3-Artifactory Integration**.
4. **Artifactory Configuration**:
   - 4.1 **Artifactory Server**: e.g., `jfrog http://1.23.45.46:8082/artifactory`.
   - 4.2 Choose **Target Release Repository**.
   - 4.3 Choose **Target Snapshots Repository**.
5. Click on **Save and Apply**.