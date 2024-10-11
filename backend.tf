terraform {
  backend "s3" {
    bucket         = "kubernetes-kubeadm-bucket"
    key            = "kubernetes-kubeadm-bucket-key/terraform.tfstate"
    region         = "eu-west-2"
    #dynamodb_table = "terraform-lock"
  }
}