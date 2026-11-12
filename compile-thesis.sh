#!/bin/sh
# Build from this script's directory, including when its path contains spaces.
set -eu
cd -- "$(dirname -- "$0")"
action=${1:-compile}
filename=${2:-thesis}
case "$action" in
  compile) exec latexmk -pdf "$filename.tex" ;;
  clean) exec latexmk -c "$filename.tex" ;;
  *) printf 'Usage: %s [compile|clean] [filename without .tex]\n' "$0" >&2; exit 2 ;;
esac
