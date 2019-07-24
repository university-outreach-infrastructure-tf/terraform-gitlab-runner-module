resource "aws_instance" "gitlab_runner" {
  ami                     = "${var.amazon_linux_ami}"
  instance_type           = "${var.gitlab_runner_aws_instance_type}"
  subnet_id               = "${aws_subnet.public.0.id}"
  vpc_security_group_ids  = ["${split(",",aws_security_group.external_ssh.id)}"]
  user_data               = "${data.template_file.user_data.rendered}"
  key_name                = "${var.key_name}"

  tags = "${merge(var.tags, map(
    "Name", "${var.name}-gitlab-runner",
    "Environment", var.environment
  ))}"
}