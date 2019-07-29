provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module gitlab_runner {
  source                               = "../module/"
  vpc_id                               = var.vpc_id
  security_group_id                    = var.security_group_id
  namespace                            = "eg"
  name                                 = "app"
  stage                                = "test"
  attributes                           = ["xyz"]
  ssh_key_name                         = var.ssh_key_name
  gitlab_runner_url                    = var.gitlab_runner_url
  gitlab_runner_token                  = var.gitlab_runner_token
  gitlab_runner_tags                   = var.gitlab_runner_tags
  gitlab_runner_docker_image           = var.gitlab_runner_docker_image
}