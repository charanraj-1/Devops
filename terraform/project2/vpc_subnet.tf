module "my_vpc"{

	source = "terraform-aws-modules/vpc/aws"

	version = "5.1"
	
	name = "eks_vpc"
	
	cidr = "10.0.0.0/16"
	
	azs =["us-east-1a", "us-east-1b"]
	
	public_subnets = ["10.0.0.1/24","10.0.0.2/24"]

	private_subnets = ["10.0.0.3/24","10.0.0.4/24"]

	enable_nat_gateway = true
	
	single_nat_gateway = true
}
