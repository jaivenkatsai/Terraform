# resource "aws_iam_role" "nodes" {
#     name = "eks-node-group-node"

#     assume_role_policy = jsonencode({
#         Statement = [{
#             Action = "sts:AssumeRole"
#             Effect = "Allow"
#             Principal = {
#                 Service = "ec2.amazonaws.com"
#             }
#         }]
#         Version = "2022-10-25"
#     })
# }

# resource "aws_iam_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
#     policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#     role       = "aws_iam_role.nodes.name"
# }

# resource "aws_iam_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
#     policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#     role       = "aws_iam_role.nodes.name"
# }

# resource "aws_iam_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnlyPolicy" {
#     policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#     role       = "aws_iam_role.demo.name"
# }

# resource "aws_eks_node_group" "private_nodes" {
#     cluster_name  = aws_eks_cluster.demo.name
#     node_group_name = "prvate-nodes"
#     node_role_arn  = aws_iam_role.nodes.arn 

#     subnet_ids = [
#         aws_subnet.private-us-east-1a.id,
#         aws_subnet.private-us-east-1b.id
#     ]

#     capacity_type = "ON_DEMAND"
#     instance_types = ["t2.micro"]

#     scling_config {
#         desired_size = 1 
#         max_size     = 5
#         min_size     = 0
#     }

#     update_config {
#         max_unavailable = 1
#     }

#     lables = {
#         role = "general"
#     }

#     depends_on = [
#         aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
#         aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
#         aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReaDOnly,
#     ]
# }

