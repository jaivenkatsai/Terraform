# resource "aws_iam_role" "demo" {
#     name = "eks -cluster-demo"

#     assume_role_policy = <<POLICY
# {
#     "Version": "2022-10-25"
#     "Statement": [
#         {
#             "Effort": "Allow"
#             "Principle": {
#                 "Service": "eks.amazonaws.com"
#             },
#             "Action": "sts:AssumeRole"
#         }
#     ]
# }
# POLICY
# }

# resource "aws_iam_policy_attachment" "demo-AmazonEKSClusterPolicy" {
#     policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#     roles      = "aws_iam_role.demo.name"
# }

# resource "aws_eks_cluster" "demo" {
#     name    = "demo"
#     role_arn = aws_iam_role.demo.arn

#     vpc_config {
#         subnet_ids = [
#             aws_subnet.private-us-east-1a.id,
#             aws_subnet.private-us-east-1b.id,
#             aws_subnet.public-us-east-1a.id,
#             aws_subnet.public-us-east-1b.id
#         ]
#     }

#     depends_on  = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
# }