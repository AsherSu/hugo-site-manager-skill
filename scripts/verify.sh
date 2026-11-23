#!/usr/bin/env sh
set -eu

if ! command -v hugo >/dev/null 2>&1; then
  echo "Hugo is not available on PATH. Install Hugo before running verification." >&2
  exit 1
fi

echo "Using $(hugo version)"
echo "Running: hugo --gc --minify"
hugo --gc --minify

if [ ! -f "public/index.html" ]; then
  echo "Hugo build completed without generating public/index.html." >&2
  exit 1
fi

echo "Hugo verification completed successfully."
