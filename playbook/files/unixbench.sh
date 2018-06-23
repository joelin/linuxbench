#!/bin/bash

if [ $# -eq 0 ]; then
  echo "no path define"
  exit
elif [ ! -d $1 ]; then 
  mkdir -p $1
fi


unixbench >> $1/`hostname`_unixbench.log &
