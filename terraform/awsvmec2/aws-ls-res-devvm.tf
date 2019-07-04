resource "aws_instance" "devops" {
  availability_zone = "${lookup(var.az, var.region)}"
  ami               = "${lookup(var.ami, var.region)}"
  instance_type     = "${var.instance_type}"
  key_name          = "${var.keypairname}"
}