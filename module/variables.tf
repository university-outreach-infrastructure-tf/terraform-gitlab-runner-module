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

variable "gitlab_runner_count" {
  type        = number
  description = "The number of runners to create."
  default     = 2
}

variable "root_ebs_size" {
  type        = number
  description = "Size of EBS volume attached to gitab runner"
  default     = 32
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
  default     = ""
}

variable "gitlab_runner_docker_image" {
  type        = string
  description = "Gitlab Runner default docker image."
  default     = "alpine:3.9"
}

variable "gitlab_runner_docker_registry_url" {
  type        = string
  description = "URL to your private docker registry."
  default     = ""
}

variable "gitlab_runner_docker_registry_auth" {
  type        = string
  description = "Base64 encoded basic authentication credentials."
  default     = ""
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

variable "amazon_linux_ami" {
  type        = string
  description = "AMI for AWS EC2 instance resources."
  default     = "ami-0ff8a91507f77f867" # Amazon Linux AMI
}