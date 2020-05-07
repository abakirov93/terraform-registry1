terraform { 
required_version = "0.11.14" 
backend "s3" { 
bucket = "app-module-class" 
key = "path/to/my/key" 
region = "us-east-2" 
} 
} 
 