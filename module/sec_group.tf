  #########security group added in key_pair.tf file#########
  
  
  # resource "aws_security_group" "asg-sec-group" {
  # name        = "asg-sec-group"
  # description = "Allow TLS inbound traffic"
  # }
  # ingress {  #inbound
  #   description = "TLS from VPC"
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  #   ingress {  #inbound
  #       description = "TLS from VPC"
  #       from_port   = 22
  #       to_port     = 22
  #       protocol    = "tcp"
  #       cidr_blocks = ["0.0.0.0/0"]
  #   }

  # egress {  #outbound
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # tags = {
  #   Name = "allow_tls"
  # }
  
