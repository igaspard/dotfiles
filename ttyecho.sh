#!/bin/bash

function get_dev() {
  DEVS=( /dev/tty.usbserial-A506ZJWF /dev/ttyUSB0 /dev/ttyUSB1 )
  for d in ${DEVS[@]};
  do
    if [[ -e $d ]]; then
      DEV=$d
      return
    fi
  done
  
}

function ttyecho() {
  get_dev
  if [[ -z $DEV ]]; then
    echo "tty is not exist"
    exit 1
  fi
  if [[ -z $1 ]]; then
    echo "CMD is empty!!!"
    exit 1
  fi
  echo $1 >$DEV
}

