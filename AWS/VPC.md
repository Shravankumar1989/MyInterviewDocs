# Steps to Create AWS VPC and Associated Components

## 1. How to Create a VPC

1. Create a VPC.
2. Assign CIDR:
   - Example: `12.0.0.0/16` - provides over 65,000 IP addresses.

## 2. How to Create an Internet Gateway

1. Create an Internet Gateway and name it.
2. Attach the created VPC to the Internet Gateway.

## 3. How to Create Subnets

### Subnet 1
1. Select the created VPC.
2. Add a Subnet Name.
3. Select an Availability Zone.
4. Enter IPv4 CIDR of the VPC (e.g., `12.0.0.0/16`).
5. Define IPv4 Subnet CIDR Block:
   - Example: `12.0.1.0/24` - provides 256 IP addresses.

### Subnet 2
1. Select the created VPC.
2. Add a Subnet Name.
3. Select an Availability Zone.
4. Enter IPv4 CIDR of the VPC (e.g., `12.0.0.0/16`).
5. Define IPv4 Subnet CIDR Block:
   - Example: `12.0.2.0/24` - provides 256 IP addresses.

## 4. How to Create a Route Table

1. Create a Route Table and name it.
2. Select the created VPC.
3. Associate the Subnet(s) with the Route Table.
4. Add a route for the Internet Gateway.

   **Example Route:**
   - **Destination**: `0.0.0.0/0`
   - **Target**: Select the created Internet Gateway.
