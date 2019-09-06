resource "aws_instance" "gitlab_runner" {
  count                   = var.gitlab_runner_count
  ami                     = var.amazon_linux_ami
  instance_type           = "t2.large"
  subnet_id               = data.aws_subnet.public_selected[count.index].id
  vpc_security_group_ids  = flatten([data.aws_security_group.selected.id])
  user_data               = data.template_file.user_data.rendered
  key_name                = var.ssh_key_name
  volume_tags             = { "Name" = format("%s-gitlab-runner-ebs-%s", module.gitlab_runner_label.name, count.index), "Environment" = module.gitlab_runner_label.stage}
  tags                    = { "Name" = format("%s-gitlab-runner-%s", module.gitlab_runner_label.name, count.index), "Environment" = module.gitlab_runner_label.stage}
  root_block_device {
    volume_type            = "gp2"
    volume_size            = var.root_ebs_size
    delete_on_termination  = true
  }
}