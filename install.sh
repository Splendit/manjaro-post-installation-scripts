#!/bin/bash

PRE_INSTALL_DONE=.preinstalldone

# prepare log directory
mkdir -p ./.log/{pre-install,mandatory,optional,personal}


if [[ ! -e $PRE_INSTALL_DONE ]]; then
  # run pre-install scripts
  cd pre-install
  for f in *.sh; do
    bash $f | tee -a ../.log/pre-install/$f.log
    echo "Done."
  done
  cd ..

  touch $PRE_INSTALL_DONE
  echo "PLEASE REBOOT YOUR COMPUTER AND EXECUTE THIS SCRIPT AGAIN AFTERWARDS!"
  exit
else
  rm $PRE_INSTALL_DONE

  # run mandatory scripts
  cd mandatory
  for f in *.sh; do
    bash $f | tee -a ../.log/mandatory/$f.log
    echo "Done."
  done
  cd ..

  # run optional scripts
  for f in $(cat optional.conf); do
    bash ./optional/$f | tee -a ./.log/optional/$f.log
    echo "Done."
  done

  # run personal scripts
  if [[ -e personal ]]; then
    cd personal
    for f in *.sh; do
      bash $f | tee -a ../.log/personal/$f.log
      echo "Done."
    done
    cd ..
  fi

  echo 'YOU ARE DONE!'
  echo 'PLEASE REBOOT YOUR COMPUTER AGAIN!'
fi
