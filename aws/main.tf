//connect with aws provider
provider "aws" {
  region = "eu-west-1"
}

//create a security group
# resource "aws_security_group" "bastion_security_group" {
#   name   = "bastion_security_group"
#   vpc_id = module.aws_vpc.vpc_id

#   ingress {
#     from_port = 22
#     to_port   = 22
#     protocol  = "ssh"
#   }
# }

module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "vpc_test"

  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]
}

//create an ec2 instance as bastion host
# module "bastion" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "2.0.0"

#   name                        = "bastion"
#   vpc_security_group_ids      = ["${module.aws_vpc.default_security_group_id}"]
#   subnet_id                   = module.aws_vpc.public_subnets[0]
#   associate_public_ip_address = true //Elastic IP
# }
