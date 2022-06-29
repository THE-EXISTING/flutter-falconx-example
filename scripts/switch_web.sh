#!/bin/bash

set -e

if [[ ! -d ./web_extension ]] && [[ -d ./_web ]] && [[ -d ./web ]]; then
  if [[ ! -d ./web_extension ]] && [[ -d ./_web ]] && [[ -d ./web ]]; then
    echo "switching to 'web' "
    mv ./web ./web_extension
    mv ./_web ./web
  else
    echo "'web_extension' already exists or '_web'/'web' does not exist"
    exit 1
  fi   

elif [[ ! -d ./_web ]] && [[ -d ./web_extension ]] && [[ -d ./web ]] ; then
  if [[ ! -d ./_web ]] && [[ -d ./web_extension ]] && [[ -d ./web ]]; then
    echo "switching to 'web_extension' "
    mv ./web ./_web
    mv ./web_extension ./web
  else
    echo "'_web' already exists or 'web_extension'/'web' does not exist"
    exit 1
  fi   

else
  echo "invalid arguments:"
  echo " Usage: $0 web  or  $0 tvos"
  exit 1
fi