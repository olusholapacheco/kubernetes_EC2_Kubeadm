variable "aws_region" {
  description = "The AWS region to deploy the infrastructure in"
  type        = string
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "The type of instance to deploy"
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "The AMI ID to use for the instances"
  type        = string
  default     = "ami-0e8d228ad90af673b"
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for the instances"
  type        = string
  default     = "kubernetes-kubeadm-key"
}

variable "cidr_blocks" {
  description = "The list of CIDR blocks to allow access to the instances"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "bucket_name" {
  type = string
  default = "kubernetes-kubeadm-bucket"
}