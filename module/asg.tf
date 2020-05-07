data "template_file" "init" { 
template = "${file("${path.module}/wordpress.sh")}" 
} 
 
resource "aws_launch_template" "example" { 
name_prefix = "example" 
image_id = "${data.aws_ami.image.id}"
key_name = "${aws_key_pair.us-east-1-key.key_name}"
instance_type = "c5.large" 
tags = {                        #i was expecting name on instances but it did not give a name!!
    Name = "App-Module"         # auto scaling tag for instance name: i need to find and add 
  }
user_data = "${base64encode(data.template_file.init.rendered)}" 
vpc_security_group_ids = ["${aws_security_group.asg-sec-group.id}"] 
} 
resource "aws_autoscaling_group" "example" { 
availability_zones = [ 
"${var.region}a", 
"${var.region}b", 
"${var.region}c", 
] 
desired_capacity = 1 
max_size = "${var.max_size}"        # max_size = 1
min_size = "${var.min_size}"        # min_size = 1
mixed_instances_policy { 
launch_template { 
launch_template_specification { 
launch_template_id = "${aws_launch_template.example.id}" 
} 
override { 
instance_type = "c4.large" 
weighted_capacity = "3" 
} 
override { 
instance_type = "c3.large" 
weighted_capacity = "2" 
} 
} 
} 
} 



#### below is saparate part #####

# resource "aws_launch_template" "example" { 
# name_prefix = "example" 
# image_id = "${data.aws_ami.image.id}" 
# # security_groups = ["${aws_security_group.asg-sec-group.name}"]
# instance_type = "c5.large"
# tags = {
#     Name = "App-Module"
#   }
# }
# ## # user_data       = "${file("task_user_data.sh")}"
# ## # availability_zone = "us-west-2a"

# resource "aws_autoscaling_group" "example" { 
# availability_zones = [
#     "${var.region}a" ,
#     "${var.region}b" ,
#     "${var.region}c"
# ] 
# desired_capacity = 1 
# max_size = 1 
# min_size = 1 
# mixed_instances_policy { 
# launch_template { 
# launch_template_specification { 
# launch_template_id = "${aws_launch_template.example.id}" 
# } 
# override { 
# instance_type = "c4.large" 
# weighted_capacity = "3" 
# } 
# override { 
# instance_type = "c3.large" 
# weighted_capacity = "2" 
# } 
# } 
# } 
# } 

###### above is saparate part ######

# resource "aws_launch_template" "example" { 
# name_prefix = "example" 
# image_id = "${data.aws_ami.image.id}" 
# instance_type = "c5.large" 
# } 

# resource "aws_autoscaling_group" "example" { 
# availability_zones = ["us-east-1a"] 
# desired_capacity = 1 
# max_size = 1 
# min_size = 1
# mixed_instances_policy { 
# launch_template { 
# launch_template_specification { 
# launch_template_id = "${aws_launch_template.example.id}" 
# } 

# override { 
# instance_type = "c4.large" 
# weighted_capacity = "3" 
# } 

# override {                              #module is creating a code sharing with others 
# instance_type = "c3.large" 
# weighted_capacity = "2" 
# } 
# } 
# } 
# }
################# above is different part #############

# resource "aws_launch_configuration" "as_conf" {   #part1 run saparately 
# name = "web_config" 
# image_id = "${data.aws_ami.image.id}" 
# instance_type = "t2.micro" 
# user_data = "${file("wordpress.sh")}" 
# spot_price = "0.1" 
# } 

################# above is different part #############

# # resource "aws_launch_configuration" "as_conf" { 
# # name = "web_config" 
# # image_id = "${data.aws_ami.image.id}" 
# # instance_type = "t2.micro" 
# # user_data = "${file("wordpress.sh")}" 
# # } 
################# above is different part #############

# # resource "aws_launch_configuration" "as_conf" {     
# #   name          = "web_config"
# #   image_id      = "${data.aws_ami.image.id}"
# #   instance_type = "t2.micro"
# # }
################# above is different part #############


# resource "aws_autoscaling_group" "bar" {
#   name                 = "terraform-asg-example"
#   launch_configuration = "${aws_launch_configuration.as_conf.name}" #it neads at least subnets or AZs
#                                                                     # launch Config is not editable but you can edit auto-scaling 
#   availability_zones = [
#     "${var.region}a",
#     "${var.region}b",
#     "${var.region}c",
#   ]

#   min_size = 1
#   max_size = 2      #you can increase or decrease number of instances

#   lifecycle {                               #create new/v2 and then delete old/v1 one. 
#     create_before_destroy = true
#   }                                         # Metadate: different types sources
# }
