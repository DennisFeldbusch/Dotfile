#!/usr/bin/env bash

sketchybar -m --set audioDevice label=$(echo "$(switchaudiosource -c -f human)")

