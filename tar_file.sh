#!/bin/bash

if [ -d $1 ];then
  cd ${HOME}/$1
  else
  echo please enter directory.
  echo sh $0 directory
  exit 0
  fi
  

gzip *
  
