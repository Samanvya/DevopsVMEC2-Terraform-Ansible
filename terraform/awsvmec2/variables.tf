variable "region" {}
variable "vmname" {}
variable "staticip" {}
variable "keypairname" {}
variable "instance_type" {}
variable "az" {
    type = "map"
    default = {
        "ap-southeast-1" = "ap-southeast-1a"
        "ap-southeast-2" = "ap-southeast-2a"
        "ap-south-1" = "ap-south-1a"
        }
}
variable "ami" {
    type = "map"
    default = {
        "ap-southeast-1" = "ami-0bb35a5dad5658286"
        "ap-southeast-2" = "ami-06705195ce845509c"
        "ap-south-1" = "ami-04125d804acca5692"
        "us-east-1" = "ami-026c8acd92718196b"
        }
}