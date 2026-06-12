#!/usr/bin/env bash
# Create a zip archive of the project excluding venv, .git, caches, and large artifacts.
# Run this from the project root.

set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

OUTFILE="../AI-Driven-Customer.zip"

echo "Creating zip at $OUTFILE (excludes venv, .git, __pycache__, .streamlit, and binary artifacts)"

zip -r "$OUTFILE" . \
  -x "venv/*" \
  -x ".git/*" \
  -x "__pycache__/*" \
  -x "*.pyc" \
  -x ".DS_Store" \
  -x ".streamlit/*" \
  -x "venv/*" \
  -x "data/*.parquet" \
  -x "data/*.pkl" \
  -x "data/*.sqlite" 

echo "Done. Zip created: $OUTFILE"
