///////////////// VARIABLES-VALUES /////////////////
//
// This file does not capable of parsing value so stick to true values 
//
////////////////////////////////////////////
#Name of the DC/OS cluster that would to provision 
cluster_name = "nonprod-torq-avatar"
#Version of DC/OS cluster to be built ex "1.13.6"
dcos_version = "2.0.1"
# Public-Key of the of the jumpserver, this key would be used to provision ALL the servers in the build. 
ssh_public_key ="<contents of the public_key to be used for installer/JumpServer>"
#The total number of Masters desired to be built (Always have an ODD number 1 or 3 or 5 here)
num_masters = "1"
#The total number of private agents desired to be built
num_private_agents = "3"
#The total number of public agents desired to be built
num_public_agents = "0"
#DC/OS license to be used by the installer for cluster 
dcos_license_key_contents = "<license_key_contents>"
#DC/OS type either open-source or enterprise
dcos_type = "ee"
#The ID of the VPC you would like to use ex- "vpc-03b4ad232a7aae9b23"
vpc_id = "<vpc-id>"
#This value sets the 
aws_associate_public_ip_address = "false"
#Admins ip's configure access to the cluster you can use single IP for ex: "<IP>/32" or a cidr block []"10.0.0.0/8","5.0.0.0./16"]
admin_ips = ["<CIDR-RANGE-OF-ADMINS-NETWORK>"]
#Tags that would like to put on the resources
tags = {
  "Name" = "new-cluster-build-2.0"
  "env" = "non-prod"
  "contact" = "operations@example.com"
  "managed" = "true"
  "managedby" = "terraform"
}
////////////////////////////////////////////
/////////////// END VARIABLES //////////////
////////////////////////////////////////////