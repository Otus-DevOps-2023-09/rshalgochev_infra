#!/bin/bash

installed=$(ruby -v 2>/dev/null | awk '{print $1}')

if [ $installed != 'ruby' ]; then
   apt update
   apt install -y ruby-full ruby-bundler build-essential
fi
