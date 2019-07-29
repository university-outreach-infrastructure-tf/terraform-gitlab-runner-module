variable "security_group_id" {
  type        = string
  description = "Security-group-id"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "VPC-id"
  default     = ""
}

variable "ssh_key_name" {
  type        = string
  description = "Key pair for ec2 instance"
  default     = ""
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
  default     = ""
}

variable "attributes" {
  type        = list
  description = "Additional attributes (e.g. 1)"
  default     = []
}

variable "delimiter" {
  type        = string
  description = "Delimiter to be used between namespace, environment, stage, name and attributes"
  default     = "-"
}

variable "name" {
  type        = string
  description = "A prefix to add to project resources"
  default     = ""
}

variable "gitlab_runner_url" {
  type        = string
  description = "Gitlab CI coordinator URL."
  default     = ""
}

variable "gitlab_runner_token" {
  type        = string
  description = "Gitlab Runner registration token."
  default     = ""
}

variable "gitlab_runner_tags" {
  type        = string
  description = "Gitlab Runner tag list (comma separated)."
  default     = "specific,docker"
}

variable "gitlab_runner_docker_image" {
  type        = string
  description = "Gitlab Runner default docker image."
  default     = "alpin:3.9"
}
variable "gitlab_concurrent_job" {
  type        = string
  description = "Number of Gitlab CI concurrent job to run."
  default     = "4"
}
variable "gitlab_check_interval" {
  type        = string
  description = "Gitlab CI check interval value."
  default     = "0"
}

variable "gitlab_rct_low_free_space" {
  type        = string
  description = "Gitlab Runner Cleanup Tool - LOW_FREE_SPACE (When trigger the cache and image removal)"
  default     = "1G"
}
variable "gitlab_rct_expected_free_space" {
  type        = string
  description = "Gitlab Runner Cleanup Tool - EXPECTED_FREE_SPACE (How much the free space to cleanup)"
  default     = "2G"
}
variable "gitlab_rct_low_free_files_count" {
  type        = string
  description = "Gitlab Runner Cleanup Tool - LOW_FREE_FILES_COUNT (When the number of free files (i-nodes) runs below this value trigger the cache and image removal)"
  default     = "131072"
}
variable "gitlab_rct_expected_free_files_count" {
  type        = string
  description = "Gitlab Runner Cleanup Tool - EXPECTED_FREE_FILES_COUNT (How many free files (i-nodes) to cleanup)"
  default     = "262144"
}
variable "gitlab_rct_default_ttl" {
  type        = string
  description = "Gitlab Runner Cleanup Tool - DEFAULT_TTL (Minimum time to preserve a newly downloaded images or created caches)"
  default     = "1m"
}
variable "gitlab_rct_use_df" {
  type        = string
  description = "Gitlab Runner Cleanup Tool - USE_DF (Use a command line df tool to check disk space)"
  default     = "1"
}

variable "amazon_linux_ami" {
  type        = string
  description = "AMI for AWS EC2 instance resources."
  default     = "ami-0ff8a91507f77f867" # Amazon Linux AMI
}