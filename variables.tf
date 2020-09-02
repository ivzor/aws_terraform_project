variable "access_key" {
  description = "AWS IAM user access key ID, needs to be created by user using AWS Console and give admin access"
}

variable "secret_key" {
  description = "AWS IAM user access key Secret (provided by AWS)"
}

variable "region" {
  description = "AWS region (can be us-east-1)"
}
