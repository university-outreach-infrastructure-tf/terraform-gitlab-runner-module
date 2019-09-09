#!/bin/bash

# Update system
sudo yum update -y && \

# Install htop and docker
sudo yum install -y htop docker && \

# Install Gitlab CI Multi Runner
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash && \
sudo yum install gitlab-runner -y

# Enable Services at startup
sudo chkconfig docker on
sudo chkconfig gitlab-runner on

# Add gitlab-runner config
mkdir -p /etc/gitlab-runner
cat > /etc/gitlab-runner/config.toml <<- EOM
concurrent     = ${GITLAB_CONCURRENT_JOB}
check_interval = ${GITLAB_CHECK_INTERVAL}
EOM

# Register gitlab runner
sudo gitlab-runner register --non-interactive \
      --env "DOCKER_AUTH_CONFIG={\"auths\":{\"${DOCKER_REGISTRY_URL}\":{\"auth\":\"${DOCKER_REGISTRY_AUTH}\"}}}" \
      --env "DOCKER_DRIVER=overlay2" \
      --url "${GITLAB_RUNNER_URL}" \
      --registration-token "${GITLAB_RUNNER_TOKEN}" \
      --executor "docker" \
      --tag-list "${GITLAB_RUNNER_TAGS}" \
      --run-untagged="true" \
      --description "docker-runner" \
      --docker-image "${GITLAB_RUNNER_DOCKER_IMAGE}" \
      --docker-volumes /var/run/docker.sock:/var/run/docker.sock

# Start services
service docker start
service gitlab-runner start

# Docker system cleanup every 24 hrs to free up space on
echo "0 2 * * * /usr/bin/docker system prune -a -f --filter "until=24h"" >>  /etc/cron.d/docker_cleanup