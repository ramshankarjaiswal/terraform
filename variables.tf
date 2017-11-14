variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "user" {
  default = "ec2-user"
}

variable "servers" {
  default     = "1"
  description = "The number of servers to launch."
}

variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
  default     = "ramj"
}

variable "key_path" {
  description = "Path to the private key specified by key_name"
  default     = "~/.ssh/ramj.pem"
}
