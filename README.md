# Customized Universal Installer 
This repository walks through the steps for installing a DC/OS cluter using universal installer in a environment where you cannot create a VPC. the default installation of DC/OS using universal installer works under the pretense that it would be able to create VPC's and everything within a VPC before actual DC/OS installation is initiated. This also means that a VPC is dedicated only for DC/OS installation. Often we run into team's that do not have privileges to create VPC and will need to work with existing VPC's & Subnets at minimum. This means that instead of installer randomly picking subnets we would need to control which sunets they fall under as well. This repo also assume that you are faimiliar with standard AWS terminology 

## Prequisites

WorkStation Pre-reqs
- Linux, macOS, or windows
- command-line shell terminal such as Bash or PowerShell
- verified Amazon Web Services (AWS) account and AWS IAM user profile with permissions
- Follow instructions from here https://docs.d2iq.com/mesosphere/dcos/2.0/installing/evaluation/aws/

VPC-Prereqs
- VPC with Internet Gateway attached to it.
- Atleast 2 or more Subnets which span over more than 1 Availability Zones's (1subnet/AZ, running 2 subnets in same AZ wont work)
- Tagging in place for subnets using which they would be picked ex NAME:dcos-installer-subnet
- Internet access to private subnets through either NAT-GATEWAY or NAT-INSTANCE running in a Public Subnet
- The IAM user should have privilieges to infrastrucure within VPC. 


## Installation


1. Add all of you parameters in to `terraform.tfvars` file in this repo and save the file. look at the comments for details 
2. Add the tag details of the subnet tags you choose to use in `main.tf` in the section line26-32. This will decide which subnets your ec2 instances will fall under
3. Configuration instance types of your servers, add region details or any other changes that you would like to nake to the `main.tf`
4. Load the ssh-key to the ssh-agent 
```bash
eval "$(ssh-agent -s)" && ssh-add <path-to-your-private-key-for-the-public-key-used-in-variables.tf>
```
5. Validate that all your files are sytntax error free, If there are errors they would pop up if not it would return the cursor 
```bash
terraform validate  
```
6. Install the cluster 
```bash 
terraform apply 
```


Notes/Gotacha's 

1. Before you begin make sure, you IAM user has right privileges, for a check try to run a few AWS commands to validate if the IAM user has the right access
2. Ensure you keep loading keys before you run terrafrom apply, without keys loaded to the ssh-agent installer wont be able to access the ec2 instances
3. Always vaildate the files after making changes to ensure you are not running build on files with errrors 
3. In case of errors make a judgement call on wether to destroy the cluster or re-apply configurations each has its perks and downsides 
4. Make sure you can access internet using the NAT-instances,
5. The AMI in-use seems to have issues with NIC card on the server when using offical CENTOS images 7.4 & 7.6. 7.7 does not exist yet.
6. It might be a better idea to bake your own custom AMI that has been configured for the installation 
