#!/bin/bash
# scripts/post-process-release-notes.sh

set -e

# Obtener el tag actual
TAG="${GORELEASER_CURRENT_TAG:-$(git describe --tags --abbrev=0)}"

echo "Processing release notes for $TAG..."

# Verificar si la release existe en GitHub
if ! gh release view "$TAG" >/dev/null 2>&1; then
    echo "Release $TAG not found on GitHub, skipping update"
    exit 0
fi

# Obtener las release notes actuales de GitHub
echo "Fetching current release notes from GitHub..."
CURRENT_NOTES=$(gh release view "$TAG" --json body --jq .body)

if [ -z "$CURRENT_NOTES" ] || [ "$CURRENT_NOTES" = "null" ]; then
    echo "No release notes found for $TAG"
    exit 0
fi

# Crear archivo temporal para procesar las notas
TEMP_FILE=$(mktemp)
echo "$CURRENT_NOTES" > "$TEMP_FILE"

echo "Processing release notes content..."

if grep -q "## Changelog (Internal Only)" "$TEMP_FILE"; then
    echo "\"Changelog (Internal Only)\" already present, no update needed."
    rm -f "$TEMP_FILE" "${TEMP_FILE}.bak"
    exit 0
fi

# Hacer los reemplazos usando sed (versión compatible con macOS)
sed -i.bak "s/## Changelog/## Changelog (Internal Only)/" "$TEMP_FILE"

# Obtener el contenido procesado
PROCESSED_NOTES=$(cat "$TEMP_FILE")

# Actualizar las release notes en GitHub
echo "Updating release notes on GitHub..."
gh release edit "$TAG" --notes "$PROCESSED_NOTES"

# Limpiar archivos temporales
rm -f "$TEMP_FILE" "${TEMP_FILE}.bak"

echo "Release notes updated successfully on GitHub!"

# # Obtener la última release
# RELEASE_NOTES_FILE="dist/CHANGELOG.md"

# # Verificar que el archivo existe
# if [ ! -f "$RELEASE_NOTES_FILE" ]; then
    # echo "Release notes file not found: $RELEASE_NOTES_FILE"
    # exit 1
# fi

# # Hacer los reemplazos
# # "perl -i -pe 's/^## Changelog$/## Changelog (Internal only)/'" "$RELEASE_NOTES_FILE"

# sed -i.bak "s/## Changelog/## Changelog (Internal Only)/" "$RELEASE_NOTES_FILE"

# # Remover archivo de backup
# rm -f "${RELEASE_NOTES_FILE}.bak"

# echo "Release notes processed successfully!"

