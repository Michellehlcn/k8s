provider "aws" {
    region = "ap-southeast-2"
    access_key = ""
    secret_key = ""
}
variable "subnet_prefix" {
  description ="cidr block for the subnet"
}
#1.create vpc
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}
#2.create Interent gateway


#4.create subnet
resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.prod-vpc.id 
  cidr_block = var.subnet_prefix[0].cidr_block
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = var.subnet_prefix[0].name
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.prod-vpc.id 
  cidr_block = var.subnet_prefix[1].cidr_block 
  availability_zone = "ap-southeat-1a"

  tags = {
    Name = var.subnet_prefix[1].name 
  }
}

#6. create Security Group to allow port 22, 80, 443
resource "aws_security_group" "allow_web" {
    name  = "allow_web_traffic"
    description = "Allow web inbound traffic"
    vpc_id = aws_vpc.prod-vpc.id 

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_web"
    }
    }
}
  
}

