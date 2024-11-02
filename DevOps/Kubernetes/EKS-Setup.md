
# Amazon EKS Kubernetes on AWS Setup

[Reference URL](https://k21academy.com/docker-kubernetes/amazon-eks-kubernetes-on-aws/)

## 1. Prerequisites Setup
1.1. **kubectl**  
1.2. **eksctl**  
1.3. **AWS CLI**

---

## 2. Create an EKS Cluster
2.1. Run the following command to create a cluster:
```bash
eksctl create cluster --name demo-cluster-1 --region us-east-1 --fargate
```

---

## 3. Configure kubectl to Connect to Your Cluster
3.1. Update the kubeconfig file for your cluster:
```bash
aws eks update-kubeconfig --name demo-cluster-1 --region us-east-1
```

---

## 4. Create Fargate Profile
4.1. Use the following command to create a Fargate profile:
```bash
eksctl create fargateprofile \
    --cluster demo-cluster-1 \
    --region us-east-1 \
    --name alb-sample-app \
    --namespace game-2048
```

---

## 5. Deploy the Deployment, Service, and Ingress
5.1. Apply the following YAML to deploy resources:
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml
```

---

## 6. Commands To Configure IAM OIDC Provider
6.1. Export cluster name:
```bash
export cluster_name=demo-cluster-1
```
6.2. Associate the IAM OIDC provider:
```bash
eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
```
Alternatively, you can run:
```bash
eksctl utils associate-iam-oidc-provider --cluster demo-cluster-1 --approve
```

---

## 7. Download IAM Policy
7.1. Run the following to download the IAM policy:
```bash
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
```

---

## 8. Create IAM Policy (AWSLoadBalancerControllerIAMPolicy) & Role - (AmazonEKSLoadBalancerControllerRole)

### 8.1. Create IAM Policy - AWSLoadBalancerControllerIAMPolicy
```bash
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```

### 8.2. Create IAM Role - AmazonEKSLoadBalancerControllerRole
```bash
eksctl create iamserviceaccount \
    --cluster=demo-cluster-1 \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --role-name AmazonEKSLoadBalancerControllerRole \
    --attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
    --approve
```

---

## 9. Helm Charts

### 9.1. Add Helm repo
```bash
helm repo add eks https://aws.github.io/eks-charts
```

### 9.2. Update the repo
```bash
helm repo update eks
```

### 9.3. Install Helm
```bash
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system \
    --set clusterName=demo-cluster-1 \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set region=us-east-1 \
    --set vpcId=<your-vpc-id>
```

---

## 10. Verify that the deployments are running
```bash
kubectl get deployment -n kube-system aws-load-balancer-controller
```

---

# AWS Auto Scaling Group

1. **Desired Capacity**: The initial or target number of instances to run.

2. **Minimum Size**: The minimum number of instances in the Auto Scaling Group.

3. **Maximum Size**: The maximum number of instances that the ASG can scale up to.