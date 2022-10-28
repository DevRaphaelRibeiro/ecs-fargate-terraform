# provider variable
variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-west-2"
}

/*# keys to the castle variable
variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}*/

# vpc variable
variable "vpc_cidr" {
  description = "CIDR block for main"
  type        = string
  default     = "10.6.0.0/16"
}

# availability zones variable
variable "availability_zones" {
  type    = string
  default = "us-west-2a"
}

variable "app_count" {
  type = number
  default = 1
}

variable "app_name" {
  type        = string
  default = "application"
}

variable "app_name2" {
  type        = string
  default = "application2"
}

variable "app_environment" {
  type        = string
  description = "Application Environment"
  default = "ecs"
} 

variable "name" {
  description = "Name of resources (vpc, db instance, ...)"
  default     = "test-cyrildgn"
}


variable "engine_version" {
  default = "13.2"
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "username" {
  default = "postgres"
}

variable "password" {
  default = "postgrespwd"
}
