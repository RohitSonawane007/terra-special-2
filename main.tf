module "ec2_webserver" {
  source         = "./ec2-modules"
  ami            = "ami-0fef201115eefe936"
  instance_type  = "t3.micro"
  name           = "server-1"
}

module "ec2-dbserver" {
  source         = "./ec2-modules"
  ami            = "ami-0b6d9d3d33ba97d99"
  instance_type  = "t3.micro"
  vpc_security_group_ids = [${aws_security_group.mysc.id}]
  name           = "server-2"
}

output "module-level-webserver-public-ip" {
	value = module.ec2_webserver.new-public-ip-test
}
output "module-level-dbserver-public-ip" {
	value = module.ec2-dbserver.new-public-ip-test
}
output "module-level-webserver-private-ip" {
	value = module.ec2_webserver.new-private-ip-test
}
output "module-level-dbserver-private-ip" {
	value = module.ec2-dbserver.new-private-ip-test
}
