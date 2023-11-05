#!/bin/bash
apt-get update
until apt-get install -y mongodb 2>&1;
do
  sleep 1
done
