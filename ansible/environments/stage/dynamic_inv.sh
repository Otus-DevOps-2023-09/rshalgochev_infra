#!/bin/bash

APPSERVER=`cd ../../../terraform/stage && terraform output | grep app | awk '{print $3}' | sed 's/\"//g'`
DBSERVER=`cd ../../../terraform/stage && terraform output | grep db | awk '{print $3}' | sed 's/\"//g'`

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
