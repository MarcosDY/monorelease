#!/bin/bash
# scripts/post-process-release-notes.sh

set -e

# Obtener la última release
RELEASE_NOTES_FILE="dist/CHANGELOG.md"

# Verificar que el archivo existe
if [ ! -f "$RELEASE_NOTES_FILE" ]; then
    echo "Release notes file not found: $RELEASE_NOTES_FILE"
    exit 1
fi

# Hacer los reemplazos
# "perl -i -pe 's/^## Changelog$/## Changelog (Internal only)/'" "$RELEASE_NOTES_FILE"

sed -i.bak "s/## Changelog/## Changelog (Internal Only)/" "$RELEASE_NOTES_FILE"

# Remover archivo de backup
rm -f "${RELEASE_NOTES_FILE}.bak"

echo "Release notes processed successfully!"

