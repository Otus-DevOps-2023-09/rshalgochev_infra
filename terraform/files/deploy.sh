#!/bin/bash
set -e
BASE_DIR=/opt
APP_HOME=/opt/reddit

# Check puma.service is exist
if [ ! -f /etc/systemd/system/puma.service ]; then
  sudo mv /tmp/puma.service /etc/systemd/system/puma.service
  sudo systemctl daemon-reload
  sudo systemctl enable puma
fi

until sudo apt-get update 2>&1;
do
  sleep 1
done

until sudo apt-get install -y git 2>&1;
do
  sleep 1
done

if [ ! -d $APP_HOME ]; then
  sudo mkdir -p $APP_HOME
fi
sudo chown -R $USER:$USER $APP_HOME
git clone -b monolith https://github.com/express42/reddit.git $BASE_DIR/reddit

cd $APP_HOME
bundle install

sudo systemctl start puma
