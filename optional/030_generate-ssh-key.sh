#!/bin/bash

echo "======================================================================"
echo "generate ssh key"
echo "======================================================================"

CURRENT_TIME=$(date "+%Y%m%d-%H%M%S")

# generate ssh key
if [[ $(ls ~/.ssh/id_rsa*) ]]; then
  mkdir -p ~/.ssh/key-backup-$CURRENT_TIME
  mv ~/.ssh/id_rsa* ~/.ssh/key-backup-$CURRENT_TIME
fi
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""
