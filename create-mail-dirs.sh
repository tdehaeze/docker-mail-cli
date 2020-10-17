#!/bin/bash

accounts="$@"

mkdir mail
cd mail

# Iterate the string variable using for loop
for account in $accounts; do
    echo "Creating directories for account $account"
    mkdir "$account"
    mkdir "$account/Inbox"
    mkdir "$account/Send"
    mkdir "$account/Trash"
    mkdir "$account/Drafts"
    mkdir "$account/Archive"
done
