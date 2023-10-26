#!/bin/bash

if [ ! -f /usr/bin/ruby ]; then
   apt update
   apt install -y ruby-full ruby-bundler build-essential
fi
