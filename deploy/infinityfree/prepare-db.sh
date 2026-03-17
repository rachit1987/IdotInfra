#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./prepare-db.sh YOUR_INFINITYFREE_URL"
  echo ""
  echo "Examples:"
  echo "  ./prepare-db.sh idotinfra.infinityfreeapp.com"
  echo "  ./prepare-db.sh idotinfra.com"
  echo ""
  echo "This creates db-import-ready.sql with all URLs replaced."
  exit 1
fi

NEW_URL="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR/../../db-export.sql"
OUTPUT="$SCRIPT_DIR/db-import-ready.sql"

if [ ! -f "$SOURCE" ]; then
  echo "ERROR: db-export.sql not found at $SOURCE"
  exit 1
fi

echo "Replacing http://localhost:8082 -> http://$NEW_URL ..."
sed "s|http://localhost:8082|http://$NEW_URL|g" "$SOURCE" > "$OUTPUT"

REPLACEMENTS=$(grep -c "$NEW_URL" "$OUTPUT" || true)
echo "Done. $REPLACEMENTS replacements made."
echo "Output: $OUTPUT"
echo ""
echo "Next: Import $OUTPUT into phpMyAdmin on InfinityFree."
