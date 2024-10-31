| **AWS Service**                | **Azure Equivalent**                          | **Description**                                                   |
|--------------------------------|-----------------------------------------------|-------------------------------------------------------------------|
| VPC (Virtual Private Cloud)    | Azure Virtual Network (VNet)                 | A private network to deploy resources in Azure.                   |
| Subnet (Private, Public)       | Subnet in VNet                               | Divides a VNet into private or public network segments.           |
| Internet Gateway               | Azure Internet Gateway (built-in)            | Provides internet access to resources in a VNet with public IPs.  |
| Route Table                    | Route Table                                  | Controls routing of traffic within a VNet.                        |
| Bastion Host                   | Azure Bastion                                | Provides secure RDP/SSH access to VMs without public IPs.         |
| NAT Instances                  | Azure NAT Gateway / Load Balancer (Outbound Rules) | Manages outbound internet traffic from private subnets.   |
| NAT Gateway                    | Azure NAT Gateway                            | Provides outbound internet access for VMs in private subnets.     |
| NACL (Network ACL)             | NSG (Network Security Group)                 | Controls inbound/outbound traffic; NSG is stateful.               |
| Security Group                 | NSG (Network Security Group)                 | Acts as a firewall to control traffic at the resource level.      |
| VPC Peering                    | VNet Peering                                 | Connects two VNets for communication.                             |
| VPC Endpoints                  | Service Endpoints / Private Endpoints        | Enables private access to Azure services over a VNet.             |
| Transit Gateway                | Azure Virtual WAN                            | Provides connectivity between multiple VNets and on-prem networks.|
| Route 53                       | Azure DNS / Azure Traffic Manager            | Provides DNS services and traffic routing across regions.         |
| ELB (Elastic Load Balancer)    | Azure Load Balancer                          | Distributes traffic across multiple virtual machines.             |
| ALB (Application Load Balancer)| Azure Application Gateway                   | Layer 7 load balancer with HTTP/HTTPS routing capabilities.       |
| NLB (Network Load Balancer)    | Azure Standard Load Balancer                | Layer 4 load balancer for TCP/UDP traffic.                        |
| GLB (Gateway Load Balancer)    | Azure Gateway Load Balancer                 | Manages and routes traffic through third-party virtual appliances.|
| WAF (Web Application Firewall) | Azure WAF (on Application Gateway / Front Door) | Protects applications from web vulnerabilities.               |
| Auto Scaling Group             | Azure Virtual Machine Scale Sets (VMSS)     | Automatically scales the number of VMs based on demand.           |