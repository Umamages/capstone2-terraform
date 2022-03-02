variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-2c"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "capstone2"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "my-jenkins-security-group"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-automated-ec2"
}

variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-0892d3c7ee96c0bf7"
}
