#!/bin/bash

APPSERVER=`yc compute instance list | grep reddit-app | awk '{print $10}'`
DBSERVER=`yc compute instance list | grep reddit-db | awk '{print $10}'`

cat<<EOF
{
  "app": {
    "hosts": [
      "$APPSERVER"],
    "vars": {
      "var1": "foo",
      "var2": "bar"
    }
  },
  "db": {
    "hosts": [
      "$DBSERVER"],
    "vars": {
      "var1": "foobar",
      "var2": "barfoo"
    }
  }
}
EOF
