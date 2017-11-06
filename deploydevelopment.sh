#!/bin/bash
touch /etc/environment
echo -n "Enter the Salt Secret Password: "
read -s saltsecrets
echo
export SALTSECRETS=$saltsecrets
salt-call --local state.apply saltenv=development
