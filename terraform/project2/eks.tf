resource "aws_eks_cluster" "my_eks"{
	name = var.cluster_name
	role_arn = aws_iam_role.eks_cluster.arn

  	vpc_config {

    	subnet_ids = module.my_vpc.private_subnets

	endpoint_private_access = true

	endpoint_public_access = true
  	}

  depends_on = [aws_iam_role_policy_attachment.cluster_policy]
}

