data "aws_security_group" "selected" {
  id = var.security_group_id
}

data "aws_subnet_ids" "public_selected" {
  vpc_id = var.vpc_id
  tags   = {
    Type = "Public"
  }
}

data "aws_subnet" "public_selected" {
  count = length(data.aws_subnet_ids.public_selected.ids)
  id    = tolist(data.aws_subnet_ids.public_selected.ids)[count.index]
}

data "template_file" "user_data" {
  template = "${file("${path.module}/templates/gitlab_runner_user_data.sh")}"
  vars = {
    GITLAB_RUNNER_NAME                    = "${var.gitlab_runner_name}"
    GITLAB_RUNNER_URL                     = "${var.gitlab_runner_url}"
    GITLAB_RUNNER_TOKEN                   = "${var.gitlab_runner_token}"
    GITLAB_RUNNER_TAGS                    = "${var.gitlab_runner_tags}"
    GITLAB_RUNNER_DOCKER_IMAGE            = "${var.gitlab_runner_docker_image}"
    GITLAB_CONCURRENT_JOB                 = "${var.gitlab_concurrent_job}"
    GITLAB_CHECK_INTERVAL                 = "${var.gitlab_check_interval}"
    GITLAB_RCT_LOW_FREE_SPACE             = "${var.gitlab_rct_low_free_space}"
    GITLAB_RCT_EXPECTED_FREE_SPACE        = "${var.gitlab_rct_expected_free_space}"
    GITLAB_RCT_LOW_FREE_FILES_COUNT       = "${var.gitlab_rct_low_free_files_count}"
    GITLAB_RCT_EXPECTED_FREE_FILES_COUNT  = "${var.gitlab_rct_expected_free_files_count}"
    GITLAB_RCT_DEFAULT_TTL                = "${var.gitlab_rct_default_ttl}"
    GITLAB_RCT_USE_DF                     = "${var.gitlab_rct_use_df}"
  }
}