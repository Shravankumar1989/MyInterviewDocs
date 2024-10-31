
# AWS ECS Overview

## What is AWS ECS?
1. AWS Elastic Container Service (ECS) is a fully managed container orchestration service provided by Amazon Web Services (AWS).
2. ECS allows you to run, stop, and manage Docker containers on a cluster of EC2 instances or with AWS Fargate, which is a serverless compute engine for containers.

## Process of AWS ECS

### Step 1 - Create Cluster
1. **Click on Create Cluster**
   - **Cluster name:** Enter the cluster name, e.g., `MyCluster`.
   - **Default NameSpace (optional):** Enter the NameSpace, e.g., `MyCluster`.

2. **Infrastructure:**
   - **AWS Fargate (Serverless)**
   - **AWS EC2 instances**

   Select one, but in this case, **AWS Fargate** is chosen.

3. **Click on Create**.

---

### Step 2 - Task Definition
1. **Click on Task Definition** or **Create Task Definition**.
   - **Task Definition Family:** Enter the Task Definition Family, e.g., `MyTaskDefinition`.

2. **Infrastructure Requirements:**
   - **Launch Type:** 
     - AWS Fargate
     - Amazon EC2 Instances

3. **OS, Architecture, Network Mode:**
   - **Operating System/Architecture:** 
     - Example: Linux/X86_64
   - **Network Mode:** AWSVPC
   - **Task Size:**
     - **CPU:** Example - 1 vCPU
     - **Memory:** Example - 3 GB

4. **Task Role:** Choose a role.

5. **Task Execution Role:** 
   - Example: ecsTaskExecutionRole

6. **Container:**
   - **Name:** Example - `nginxc`
   - **Image URL:** Example - `nginx:latest` from Docker.io.
   - **Essential Container:** Example - Yes.
   - **Port Mapping:** 
     - **Container Port:** Example - 80
     - **Protocol:** Example - TCP
     - **Port Name:** Enter a port name.
     - **App Protocol:** Example - http.

7. **Resource Allocation:**
   - **CPU:** Example - 1 vCPU
   - **GPU:** Example - 1 GPU
   - **Memory Hard Limit:** Example - 1 GB
   - **Memory Soft Limit:** Example - 1 GB

8. **Storage:**
   - **Amount:** Example - 21 GB

9. **Click on Create**.

---

### Step 3 - Configure the Cluster
1. **Click on Cluster** - Example: `MyCluster`.
2. **Create Service.**
3. **Choose Launch Type:** Example - Fargate.