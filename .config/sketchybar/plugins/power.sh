#!/usr/bin/env bash

sketchybar -m --set powerIndicator label=$(echo "$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)%")
