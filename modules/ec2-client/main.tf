
resource "aws_security_group" "dataeng_sg" {
  name        = "allow-ssh-and-outbound"
  description = "Allow SSH and Outbound"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound SSh"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.my_ip_for_ssh]
  }

  ingress {
    description     = "Inbound SSh"
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [var.vpc_default_sg_id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "mysql_client" {
  instance_type               = "t2.xlarge"
  associate_public_ip_address = true
  ami                         = data.aws_ami.amazon-linux-2.id
  vpc_security_group_ids      = [aws_security_group.dataeng_sg.id, var.vpc_default_sg_id]
  key_name                    = var.key_pair_name
  subnet_id                   = var.subnet_id
  user_data                   = <<USER_DATA
#!/bin/bash
yum install -y git
yum install -y mariadb
amazon-linux-extras install -y postgresql12
cd ~
git clone https://github.com/aws-samples/aws-database-migration-samples.git
USER_DATA

  tags = {
    Name = "DMSClient"
  }
}