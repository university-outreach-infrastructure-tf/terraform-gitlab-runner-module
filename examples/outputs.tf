output "instance_public_ip"{
  value = module.gitlab_runner.*.instance_public_ip
}