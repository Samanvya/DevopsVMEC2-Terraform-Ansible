resource "null_resource" "Provision" {
  #static_ip_name = "${aws_lightsail_static_ip.devops.name}"
  #instance_name = "${aws_instance.devops.name}"
  connection {
    timeout = "5m"
    user = "ubuntu"
    host = "${aws_instance.devops.public_ip}"
    private_key = "${file("D:/Devops/.ssh/iac/id_rsa2")}"
    }
   provisioner "file" {
     source = "D:/Devops/.ssh/iac/"
     destination = "~/.ssh"
   }
   provisioner "file" {
     source = "../../ansible"
     destination = "~/"
   }
   provisioner "remote-exec" {
    inline = [
      "touch hello",
      "sudo apt update -y",
      "echo ************************apt update************* >> hello",
      #"sudo apt upgrade -y",
      #RUN apt install -y less curl git ssh
      #"sudo apt update -y && sudo apt-get upgrade -y && sudo apt-get install -y less curl ssh",
      #Python Pip
      "sudo apt-get install python3 python3-pip -y && sudo ln -s /usr/bin/python3 /usr/bin/python && sudo ln -s /usr/bin/pip3 /usr/bin/pip",
      #Ansible
      "pip3 install ansible --upgrade --user && export PATH=~/.local/bin:$PATH",
      "echo ************************INStalledANsible************* >> hello",
      "~/.local/bin/ansible-playbook -v -i 'localhost,' -c local ~/ansible/playbooks/devopsvm/site.yml",
      ]
      }
}