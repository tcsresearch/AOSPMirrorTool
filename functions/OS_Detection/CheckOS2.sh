#!/usr/bin/env bash

FoundOS=$(cat /etc/*release | grep ^NAME | tr -d 'NAME="') #$ echo $OS # Ubuntu
export FoundOS
