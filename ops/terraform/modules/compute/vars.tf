variable "namespaced_department_name" {
  type        = string
  description = "The department name to namespace the resources"
}

variable "environment" {
  type        = string
  description = "The environment to namespace the resources"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy the resources"
}

variable "allowed_ip" {
  type        = string
  description = "The IP address to allow SSH access from"
}
