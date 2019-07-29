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
  key_name                             = var.key_name
  gitlab_runner_name                   = var.gitlab_runner_name
  gitlab_runner_url                    = var.gitlab_runner_url
  gitlab_runner_token                  = var.gitlab_runner_token
  gitlab_runner_tags                   = var.gitlab_runner_tags
  gitlab_runner_docker_image           = var.gitlab_runner_docker_image
  gitlab_concurrent_job                = var.gitlab_concurrent_job
  gitlab_check_interval                = var.gitlab_check_interval
  gitlab_rct_low_free_space            = var.gitlab_rct_low_free_space
  gitlab_rct_expected_free_space       = var.gitlab_rct_expected_free_space
  gitlab_rct_low_free_files_count      = var.gitlab_rct_low_free_files_count
  gitlab_rct_expected_free_files_count = var.gitlab_rct_expected_free_files_count
  gitlab_rct_default_ttl               = var.gitlab_rct_default_ttl
  gitlab_rct_use_df                    = var.gitlab_rct_use_df
}