terraform {
  required_providers {
    aws =  {
    source = "hashicorp/aws"
    version = ">= 2.7.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_backend_bucket" {
      bucket = "terraform-state-pmyeb6w2daxzx3mw82yhq9hnjspuxnloc57g16sbc122u"
}

resource "aws_instance" "server" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.server_iam_role_instance_profile.name
}

resource "aws_eip" "server_eip" {
      vpc = true
      instance = aws_instance.server.id
}

resource "aws_iam_user" "server_iam" {
      name = "server_iam"
}

resource "aws_iam_user_policy_attachment" "server_iam_policy_attachment0" {
      user = aws_iam_user.server_iam.name
      policy_arn = aws_iam_policy.server_iam_policy0.arn
}

resource "aws_iam_policy" "server_iam_policy0" {
      name = "server_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.server_iam_policy_document.json
}

resource "aws_iam_access_key" "server_iam_access_key" {
      user = aws_iam_user.server_iam.name
}

resource "aws_instance" "server-a" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.server-a_iam_role_instance_profile.name
}

resource "aws_eip" "server-a_eip" {
      vpc = true
      instance = aws_instance.server-a.id
}

resource "aws_iam_user" "server-a_iam" {
      name = "server-a_iam"
}

resource "aws_iam_user_policy_attachment" "server-a_iam_policy_attachment0" {
      user = aws_iam_user.server-a_iam.name
      policy_arn = aws_iam_policy.server-a_iam_policy0.arn
}

resource "aws_iam_policy" "server-a_iam_policy0" {
      name = "server-a_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.server-a_iam_policy_document.json
}

resource "aws_iam_access_key" "server-a_iam_access_key" {
      user = aws_iam_user.server-a_iam.name
}

resource "aws_instance" "server-b" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.server-b_iam_role_instance_profile.name
}

resource "aws_eip" "server-b_eip" {
      vpc = true
      instance = aws_instance.server-b.id
}

resource "aws_iam_user" "server-b_iam" {
      name = "server-b_iam"
}

resource "aws_iam_user_policy_attachment" "server-b_iam_policy_attachment0" {
      user = aws_iam_user.server-b_iam.name
      policy_arn = aws_iam_policy.server-b_iam_policy0.arn
}

resource "aws_iam_policy" "server-b_iam_policy0" {
      name = "server-b_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.server-b_iam_policy_document.json
}

resource "aws_iam_access_key" "server-b_iam_access_key" {
      user = aws_iam_user.server-b_iam.name
}

resource "aws_instance" "server-c" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.server-c_iam_role_instance_profile.name
}

resource "aws_eip" "server-c_eip" {
      vpc = true
      instance = aws_instance.server-c.id
}

resource "aws_iam_user" "server-c_iam" {
      name = "server-c_iam"
}

resource "aws_iam_user_policy_attachment" "server-c_iam_policy_attachment0" {
      user = aws_iam_user.server-c_iam.name
      policy_arn = aws_iam_policy.server-c_iam_policy0.arn
}

resource "aws_iam_policy" "server-c_iam_policy0" {
      name = "server-c_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.server-c_iam_policy_document.json
}

resource "aws_iam_access_key" "server-c_iam_access_key" {
      user = aws_iam_user.server-c_iam.name
}

resource "aws_iam_instance_profile" "server_iam_role_instance_profile" {
      name = "server_iam_role_instance_profile"
      role = aws_iam_role.server_iam_role.name
}

resource "aws_iam_instance_profile" "server-a_iam_role_instance_profile" {
      name = "server-a_iam_role_instance_profile"
      role = aws_iam_role.server-a_iam_role.name
}

resource "aws_iam_instance_profile" "server-b_iam_role_instance_profile" {
      name = "server-b_iam_role_instance_profile"
      role = aws_iam_role.server-b_iam_role.name
}

resource "aws_iam_instance_profile" "server-c_iam_role_instance_profile" {
      name = "server-c_iam_role_instance_profile"
      role = aws_iam_role.server-c_iam_role.name
}

resource "aws_iam_role" "server_iam_role" {
      name = "server_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role" "server-a_iam_role" {
      name = "server-a_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role" "server-b_iam_role" {
      name = "server-b_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role" "server-c_iam_role" {
      name = "server-c_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_subnet" "devxp_vpc_subnet_public0" {
      vpc_id = aws_vpc.devxp_vpc.id
      cidr_block = "10.0.0.0/25"
      map_public_ip_on_launch = true
      availability_zone = "us-west-2a"
}

resource "aws_subnet" "devxp_vpc_subnet_public1" {
      vpc_id = aws_vpc.devxp_vpc.id
      cidr_block = "10.0.128.0/25"
      map_public_ip_on_launch = true
      availability_zone = "us-west-2b"
}

resource "aws_internet_gateway" "devxp_vpc_internetgateway" {
      vpc_id = aws_vpc.devxp_vpc.id
}

resource "aws_route_table" "devxp_vpc_routetable_pub" {
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.devxp_vpc_internetgateway.id
      }
      vpc_id = aws_vpc.devxp_vpc.id
}

resource "aws_route" "devxp_vpc_internet_route" {
      route_table_id = aws_route_table.devxp_vpc_routetable_pub.id
      destination_cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.devxp_vpc_internetgateway.id
}

resource "aws_route_table_association" "devxp_vpc_subnet_public_assoc" {
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      route_table_id = aws_route_table.devxp_vpc_routetable_pub.id
}

resource "aws_vpc" "devxp_vpc" {
      cidr_block = "10.0.0.0/16"
      enable_dns_support = true
      enable_dns_hostnames = true
}

resource "aws_security_group" "devxp_security_group" {
      vpc_id = aws_vpc.devxp_vpc.id
      name = "devxp_security_group"
      ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
}

data "aws_iam_policy_document" "server_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.server.arn]
      }
}

data "aws_ami" "amazon_latest" {
      most_recent = true
      owners = ["585441382316"]
      filter {
        name = "name"
        values = ["*AmazonLinux*"]
      }
      filter {
        name = "virtualization-type"
        values = ["hvm"]
      }
}

data "aws_iam_policy_document" "server-a_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.server-a.arn]
      }
}

data "aws_iam_policy_document" "server-b_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.server-b.arn]
      }
}

data "aws_iam_policy_document" "server-c_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.server-c.arn]
      }
}



