#!/bin/bash
apt-get update
apt-get instll -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
bundle install
puma -d
