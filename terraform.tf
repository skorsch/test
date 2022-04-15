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
      bucket = "terraform-state-213t2jisxrcndmma33zjy1cy6qnpyvnogkmd2joup2ciy"
}

resource "aws_instance" "Instance-wnaw" {
      ami = data.aws_ami.ubuntu_latest.id
      instance_type = "t2.micro"
      lifecycle {
        ignore_changes = [ami]
      }
}

resource "aws_iam_user" "Instance-wnaw_iam" {
      name = "Instance-wnaw_iam"
}

resource "aws_iam_user_policy_attachment" "Instance-wnaw_iam_policy_attachment0" {
      user = aws_iam_user.Instance-wnaw_iam.name
      policy_arn = aws_iam_policy.Instance-wnaw_iam_policy0.arn
}

resource "aws_iam_policy" "Instance-wnaw_iam_policy0" {
      name = "Instance-wnaw_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Instance-wnaw_iam_policy_document.json
}

resource "aws_iam_access_key" "Instance-wnaw_iam_access_key" {
      user = aws_iam_user.Instance-wnaw_iam.name
}

data "aws_iam_policy_document" "Instance-wnaw_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.Instance-wnaw.arn]
      }
}

data "aws_ami" "ubuntu_latest" {
      most_recent = true
      owners = ["099720109477"]
      filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64*"]
      }
      filter {
        name = "virtualization-type"
        values = ["hvm"]
      }
}



