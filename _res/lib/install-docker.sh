#!/bin/sh

echo '\n==> removing docker...'
sudo apt-get remove docker docker-engine docker.io containerd runc

echo '\n==> install prerequisites...'
sudo apt-get update && \
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo '\n==> gpg apt-key add...'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo '\n==> add-apt-repository...'
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"

echo '\n==> installing docker-ce'
sudo apt-get update && \
sudo apt-get install docker-ce

echo '\n==> adding docker to the user group...'
sudo usermod -aG docker $USER

echo '\n==> starting docker...'
sudo service docker start

echo '\n==> enable docker...'
sudo systemctl enable docker

echo '\n==> systemctl status'
sudo systemctl status docker

echo '\n==> done.'
