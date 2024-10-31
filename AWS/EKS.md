
# AWS EKS Setup Guide

## 1. Prerequisites Setup
- **kubectl**
- **eksctl**
- **AWS CLI**

## 2. Create an EKS Cluster
```bash
eksctl create cluster --name demo-cluster-1 --region us-east-1 --fargate
```

## 3. Configure kubectl to Connect to Your Cluster
```bash
aws eks update-kubeconfig --name demo-cluster-1 --region us-east-1
```

## 4. Create Fargate Profile
```bash
eksctl create fargateprofile \
	    --cluster demo-cluster-1 \
	    --region us-east-1 \
	    --name alb-sample-app \
	    --namespace game-2048
```

## 5. Deploy the Deployment, Service, and Ingress
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml
```

## 6. Configure IAM OIDC Provider
```bash
export cluster_name=demo-cluster-1
eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
```
or
```bash
eksctl utils associate-iam-oidc-provider --cluster demo-cluster-1 --approve
```

## 7. Download IAM Policy
```bash
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
```

## 8. Create IAM Policy (AWSLoadBalancerControllerIAMPolicy)
```bash
aws iam create-policy \
    	--policy-name AWSLoadBalancerControllerIAMPolicy \
    	--policy-document file://iam_policy.json
```

## 9. Create IAM Role (AmazonEKSLoadBalancerControllerRole)
```bash
eksctl create iamserviceaccount \
		--cluster=demo-cluster-1 \
		--namespace=kube-system \
		--name=aws-load-balancer-controller \
		--role-name AmazonEKSLoadBalancerControllerRole \
		--attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
		--approve
```

## 10. Add Helm Repository
```bash
helm repo add eks https://aws.github.io/eks-charts
```

## 11. Update Helm Repository
```bash
helm repo update eks
```

## 12. Install AWS Load Balancer Controller using Helm
```bash
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system \
	  	--set clusterName=demo-cluster-1 \
	  	--set serviceAccount.create=false \
	  	--set serviceAccount.name=aws-load-balancer-controller \
	  	--set region=us-east-1 \
	  	--set vpcId=<your-vpc-id>
```

## 13. Verify that the Deployments are Running
```bash
kubectl get deployment -n kube-system aws-load-balancer-controller
```