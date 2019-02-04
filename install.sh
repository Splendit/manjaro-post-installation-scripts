#!/bin/bash

# run mandatory scripts
for f in ./mandatory/*.sh; do
  $SHELL $f
done

# run optional scripts
for f in $(cat optional.conf); do
  $SHELL ./optional/$f
done

# run personal scripts
for f in ./personal/*.sh; do
  $SHELL $f
done
