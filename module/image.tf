data "aws_ami" "image" {
  most_recent = true
  owners      = ["${var.image_owner}"]      #["137112412989"] # Canonical #this is for Ubuntu 99720109477
}
