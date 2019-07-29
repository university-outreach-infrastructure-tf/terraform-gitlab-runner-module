# gitlab-runner-module

This module assumes following resources are already available:
1. VPC
2. Public Subnet
3. Private Subnet
4. Route table, Route, Route Table Association for public subnet
5. Internet gateway for public subnet
6. Gitlab Instance
7. Gitlab Runner Token

and it performs following actions:
1. Create 2 Gitlab Runners
2. Register Runners with Gitlab using Gitlab URL and Token

Usage:
```
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
}
```

## INPUT VALUES

| Input                                | Description                                                                                                                                           | Type    | Default                  | Required |
| -------------------------------------| ------------------------------------------------------------------------------------------------------------------------------------------------------| --------|--------------------------|----------|
| namespace                            | Namespace, which could be your organization name or abbreviation"                                                                                     | `string`| ""                       | yes      |
| stage                                | Stage, e.g. 'prod', 'staging', 'dev'                                                                                                                  | `string`| ""                       | yes      |
| name                                 | Solution name, e.g. 'app' or 'jenkins'                                                                                                                | `string`| ""                       | yes      |
| attributes                           | Additional attributes                                                                                                                                 | `list`  | `<list>`                 | no       |           
| delimiter                            | Delimiter to be used between namespace, environment, stage, name and attributes                                                                       | `string`| "-"                      | no       |
| security_group_id                    | ID of Security group for gitlab runner instances                                                                                                      | `string`| ""                       | yes      |
| vpc_id                               | VPC ID                                                                                                                                                | `string`| ""                       | yes      |
| ssh_key_name                         | Key Pair to be used for gitlab-runner ec2 instance                                                                                                    | `string`| ""                       | yes      |
| gitlab_runner_url                    | URL for Runner setup                                                                                                                                  | `string`| ""                       | yes      |
| gitlab_runner_token                  | Gitlab Runner registration token                                                                                                                      | `string`| ""                       | yes      |
| gitlab_runner_tags                   | Gitlab Runner tag list (comma separated)                                                                                                              | `string`| ""                       | yes      |
| gitlab_runner_docker_image           | Gitlab Runner default docker image.                                                                                                                   | `string`| `alpine:3.9`             | no       |
| gitlab_concurrent_job                | Number of Gitlab CI concurrent job to run                                                                                                             | `string`| `"4"`                    | no       |
| gitlab_check_interval                | Gitlab CI check interval value                                                                                                                        | `string`| `"0"`                    | no       |
| gitlab_rct_low_free_space            | Gitlab Runner Cleanup Tool - LOW_FREE_SPACE (When trigger the cache and image removal)"                                                               | `string`| `"1G"`                   | no       |
| gitlab_rct_expected_free_space       | Gitlab Runner Cleanup Tool - EXPECTED_FREE_SPACE (How much the free space to cleanup)                                                                 | `string`| `"2G"`                   | no       |
| gitlab_rct_low_free_files_count      | Gitlab Runner Cleanup Tool - LOW_FREE_FILES_COUNT (When the number of free files (i-nodes) runs below this value trigger the cache and image removal) | `number`| `"131072"`               | no       |
| gitlab_rct_expected_free_files_count | Gitlab Runner Cleanup Tool - EXPECTED_FREE_FILES_COUNT (How many free files (i-nodes) to cleanup)"                                                    | `string`| `"262144"`               | no       |
| gitlab_rct_default_ttl               | Gitlab Runner Cleanup Tool - DEFAULT_TTL (Minimum time to preserve a newly downloaded images or created caches)"                                      | `string`| `"1m"`                   | no       |
| gitlab_rct_use_df                    | Gitlab Runner Cleanup Tool - USE_DF (Use a command line df tool to check disk space)                                                                  | `string`| `"1"`                    | no       |
| amazon_linux_ami                     | AMI for AWS EC2 instance resources.                                                                                                                   | `string`| `"ami-0ff8a91507f77f867"`| no       |

## OUTPUT VALUE NAMES

| Name                              | Description                                   | 
| ----------------------------------| ----------------------------------------------| 
| instance_public_ip                | List of Gitlab Runner Instance   Public IP    | 