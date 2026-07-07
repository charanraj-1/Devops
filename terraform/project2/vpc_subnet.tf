module "my_vpc"{

	source = "terraform-aws-modules/vpc/aws"

	version = "5.1"
	
	name = "eks_vpc"
	
	cidr = "10.0.0.0/16"
	
	azs =["us-east-1a", "us-east-1b"]
	/*If user gives public_subnets:
    Create Internet Gateway
    Create Public Route Table
    Associate Public Subnets

	If user gives private_subnets:
    Create NAT Gateway (if enabled)
    Create Private Route Table
    Associate Private Subnets*/

	
	public_subnets = ["10.0.1.0/24","10.0.2.0/24"]

	private_subnets = ["10.0.3.0/24","10.0.4.0/24"]

	enable_nat_gateway = true
	
	single_nat_gateway = true

	enable_dns_hostnames = true
	
	enable_dns_support   = true
	
	public_subnet_tags = {
	  "kubernetes.io/role/elb" = "1"
	"kubernetes.io/cluster/${var.cluster_name}" = "shared"
	}

	private_subnet_tags = {
	"kubernetes.io/role/internal-elb" = "1"
	"kubernetes.io/cluster/${var.cluster_name}" = "shared"
	}
}
