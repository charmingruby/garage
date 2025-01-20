variable "aws_region" {
  description = "AWS region where the Network resources will be deployed, e.g., 'eu-central-1' for the Europe (Frankfurt) region"
  type        = string
  default     = "eu-central-1"
}

variable "environment" {
  description = "Deployment environment name, such as 'dev', 'test', 'prod'. This categorizes the Network resources by their usage stage"
  type        = string
  default     = "dev"
}

variable "service_name" {
  description = "The name of the service the bastion host is associated with, used for naming and tagging resources in AWS"
  type        = string
  default     = "express-todo-api"
}

variable "allowed_ip" {
  description = "IP address/CIDR block allowed to SSH into the bastion host. Use caution to restrict access to known IPs for security"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the bastion host, such as 't2.micro'. This determines the hardware of the host"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair used to access the bastion host. Ensure the key exists in AWS EC2 before deployment"
  type        = string
}