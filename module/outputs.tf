output "instance_public_ip"{
  value = aws_instance.gitlab_runner.*.public_ip
}