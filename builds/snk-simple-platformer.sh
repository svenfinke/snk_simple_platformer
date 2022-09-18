#!/bin/sh
echo -ne '\033c\033]0;Snk Simple Platformer\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/snk-simple-platformer.x86_64" "$@"
