#!/bin/bash
apt-get update
until apt-get install -y ruby-full ruby-bundler build-essential 2>&1;
do
  sleep 1
done
