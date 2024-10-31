1. Prerequisites Setup
	* kubectl 
	* eksctl
	* AWS CLI

2. Create an EKS Cluster
	* eksctl create cluster --name demo-cluster-1 --region us-east-1 --fargate

3. Configure kubectl to Connect to Your Cluster
	* aws eks update-kubeconfig --name demo-cluster-1 --region us-east-1

4. Create Fargate profile
 	* eksctl create fargateprofile \
	    --cluster demo-cluster-1 \
	    --region us-east-1 \
	    --name alb-sample-app \
	    --namespace game-2048

5. Deploy the deployment, service and Ingress
	* kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml

6. Commands To Configure IAM OIDC Provider
	* export cluster_name=demo-cluster-1
	* eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve

	or 

	* eksctl utils associate-iam-oidc-provider --cluster demo-cluster-1 --approve

7. Download IAM policy
	* curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json

8. Create IAM Policy - (AWSLoadBalancerControllerIAMPolicy)
	* aws iam create-policy \
    	--policy-name AWSLoadBalancerControllerIAMPolicy \
    	--policy-document file://iam_policy.json

9. Create IAM Role - (AmazonEKSLoadBalancerControllerRole)
	* eksctl create iamserviceaccount \
		--cluster=demo-cluster-1 \
		--namespace=kube-system \
		--name=aws-load-balancer-controller \
		--role-name AmazonEKSLoadBalancerControllerRole \
		--attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
		--approve

10. Add helm repo
	* helm repo add eks https://aws.github.io/eks-charts

11. Update the repo
	* helm repo update eks

12. Install helm
	* helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system \
	  	--set clusterName=demo-cluster-1 \
	  	--set serviceAccount.create=false \
	  	--set serviceAccount.name=aws-load-balancer-controller \
	  	--set region=us-east-1 \
	  	--set vpcId=<your-vpc-id>

13. Verify that the deployments are running. 
	* kubectl get deployment -n kube-system aws-load-balancer-controller