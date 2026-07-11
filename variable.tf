variable "name" {}

variable "vpc_id" {}

variable "subnets" {
    type=list(string)}

variable "container_image" {}

variable "container_port" {
    default = 80
}

variable "desired_count" {
    default = 2
}
variable "cpu" {
    default = "256"
}

variable "memory" {
    default = "512"
}