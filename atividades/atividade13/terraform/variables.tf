variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nome da chave SSH criada na AWS"
  type        = string
}

variable "ami_ubuntu" {
  description = "AMI do Ubuntu Server"
  type        = string
  default     = "ami-0ecb62995f68bb549"
}
