terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.region
  profile = "default"
}

resource "aws_security_group" "devops" {
  name        = "devops"
  description = "Security Group da Atividade 13"

  # --- INGRESS ---

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # --- EGRESS (INTERNET LIBERADA) ---

  egress {
    description = "Liberar todo o trafego de saida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops"
  }
}


resource "aws_instance" "cliente" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops.id]

  tags = {
    Name  = "cliente"
    grupo = "cliente"
  }
}


resource "aws_instance" "banco" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops.id]

  tags = {
    Name  = "banco"
    grupo = "bancodedados"
  }
}

