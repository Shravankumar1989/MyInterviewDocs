# Jenkins Overview

## What is Jenkins?
1. Jenkins is an open-source automation server widely used for continuous integration (CI) and continuous delivery (CD) in software development.
2. It runs on port 8080.
3. Latest Version: 2.462.1.

## Key Features of Jenkins:
1. **Continuous Integration (CI)**
2. **Continuous Delivery (CD)**
3. **Plugins**
4. **Pipelines**
5. **User Interface**
6. **Notifications**

## Typical Use Cases:
1. **Automated Builds**: Jenkins automatically builds the project when changes are detected in the version control system.
2. **Automated Testing**: Jenkins runs automated tests every time new code is committed, ensuring that the code is stable and functional.
3. **Automated Deployments**: Jenkins can deploy the application to different environments (e.g., development, staging, production) automatically, based on the build and test results.
4. **Monitoring and Reporting**: Jenkins provides real-time monitoring and reports on the status of builds, tests, and deployments.

---

# Prerequisites for Installing Jenkins

1. **Java Development Kit (JDK)**
2. **Operating System**
3. **Hardware Requirements**
4. **Web Browser**
5. **Network Requirements**

---

# Manage Jenkins

1. **Configure System** (Configure Server): Configure global Jenkins settings, including paths for tools, locations for configurations, and general system settings.
2. **Global Tool Configuration** (Configure Tool): Configure locations and installers for tools like JDK, Maven, Git, etc.
3. **Manage Plugins** (Add, Install, Update, Remove Plugins): Manage plugins to extend Jenkins functionality.
4. **Manage Nodes and Clouds** (Manage Master and Slave Node): Manage Jenkins nodes (agents) and cloud settings.
5. **Configure Global Security**: Secure Jenkins with global security settings, including authentication, authorization, and access control.
6. **Credentials** (Manage Credentials): Manage credentials for secure access to various systems and tools.
7. **Credential Providers**: Configure credential providers and types.
8. **Manage Users**: Manage user accounts, roles, permissions, and user groups.

---

# Types of Jobs in Jenkins

1. **Freestyle Project**
   - Description: Basic, flexible type of job for simple automation tasks or straightforward CI/CD pipelines.
   - Use Cases: Basic build jobs, executing shell scripts, triggering other projects.

2. **Pipeline**
   - Description: Defines the build process as code using a DSL (Groovy). Supports complex workflows.
   - Use Cases: CI/CD pipelines, complex automation workflows, multi-branch pipelines.

3. **Multiconfiguration Project (Matrix Project)**
   - Description: Runs the same set of build steps in different configurations.
   - Use Cases: Cross-platform builds, testing in multiple environments.

4. **Folder**
   - Description: Organizes jobs into a hierarchy for better management.
   - Use Cases: Grouping jobs by team, project, or application.

5. **Multibranch Pipeline**
   - Description: Automatically creates Pipeline jobs for each branch in the version control system.
   - Use Cases: Managing builds across multiple branches.

6. **Organization Folder**

---

# Types of Triggers in Jenkins

1. **Build Periodically**
   - Description: Runs jobs based on a cron-like schedule, regardless of code changes.
   - Example: `H/5 * * * *` (every five minutes).

2. **pollSCM**
   - Description: Checks for code changes based on a cron-like schedule. Only triggers if changes are found.
   - Example: `H/5 * * * *` (every five minutes).

3. **Webhook**
   - Description: Triggers the Jenkins pipeline when code changes are pushed to the repository.
   - **Process**:
     - **Jenkins Side**:
       1. Select Jenkins job
       2. Configure -> Build Triggers -> GitHub hook trigger for GITScm polling
     - **GitHub Side**:
       1. Go to repository Settings -> Webhooks -> Add webhook
       2. Payload URL: `http://<Jenkins-URL>/github-webhook/`
       3. Content Type: `application/json`
       4. Event: `Just the push event`
       5. Active checkbox -> Add webhook

---

# How to Configure Worker or Slave in Jenkins

- URL: [CoachDevOps Jenkins Build Agent Setup](https://www.coachdevops.com/2022/08/jenkins-build-agent-setup-using-docker.html)
- YouTube Reference: [Jenkins Build Agent Setup Video](https://www.youtube.com/watch?v=kHJGYTcLNj0)

---

# Jenkins Pipeline Step-by-Step

1. Developer makes a code commit to GitHub.
2. Git webhook triggers a Jenkins pipeline.
3. **Checkout Code**: Jenkins pulls the latest code.
4. **Build**: Run `mvn clean install` using Maven.
5. **Unit Testing**: Run `mvn test` for unit tests.
6. **Static Code Analysis**: Use SonarQube for code analysis.
7. **Quality Gate Check**: Ensure SonarQube standards are met.
8. **Artifact Upload**: Store artifacts in JFrog Artifactory.
9. **Docker Image**: Build Docker image.
10. **Security Scan**: Scan Docker image for vulnerabilities.
11. **Push to AWS ECS**: Upload the image to AWS ECS.
12. **Update Kubernetes Manifest**: Push the updated image to GitHub.
13. **Deploy with ArgoCD**: ArgoCD deploys the new image to Kubernetes.

---

# Default Folders/Paths

## Jenkins
- **Linux**: `/var/lib/jenkins/`
- **Windows**: `C:\Program Files (x86)\Jenkins` or `C:\ProgramData\Jenkins`
- **Environment Variable**: `JENKINS_HOME`

## Java
- **Linux**: `/usr/lib/jvm/` (e.g., `/usr/lib/jvm/java-<version>-openjdk-amd64/`)
- **Windows**: `C:\Program Files\Java\` (64-bit) or `C:\Program Files (x86)\Java\` (32-bit)
- **Environment Variable**: `JAVA_HOME`

---

# Jenkins Backup Methods

1. **ThinBackup Plugin**: Automates the backup process.
2. **Manual Backup**: Use the following command:
   ```bash
   tar -cvzf jenkins_backup.tar.gz /var/lib/jenkins/