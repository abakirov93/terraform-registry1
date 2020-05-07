module "ohio" {       #module
source = "./module"                 #there is two modules one of them is creating and for other is meaning google it
region = "us-east-2" 
image_owner = "137112412989" 
desired_capacity = 1 
max_size = 1 
min_size = 1
} 

# module "wordpress-virginia" {            
# source = "./module"         
# region = "us-east-1" 
# } 

# module "wordpress-london" { 
# source = "./module" 
# region = "eu-west-2"
# image_owner = "137112412989" 
# desired_capacity = 1 
# max_size = 1 
# min_size = 1 
# }  

# module "wordpress-oregon" { 
# source = "./module" 
# region = "us-west-2"
# image_owner = "137112412989" 
# desired_capacity = 1 
# max_size = 1 
# min_size = 1 
# }  

# module "wordpress-irland" {     #you can add more regions
# source = "./module" 
# region = "eu-west-1" 
# image_owner = "137112412989" 
# desired_capacity = 1 
# max_size = 1 
# min_size = 1 
# }  

