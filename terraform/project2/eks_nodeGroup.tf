resource "aws_eks_node_group" "eks_node_group"{
	
	cluster_name = aws_eks_cluster.my_eks.name
	
	node_group_name = "workers"
	
	node_role_arn = aws_iam_role.node_role.arn
	
	subnet_ids = module.my_vpc.private_subnets
	
	scaling_config {
		
	desired_size = 2
	
	max_size = 3
	
	min_size = 1

	}

	instance_types = ["t3.micro"]
	  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_policy]
}

