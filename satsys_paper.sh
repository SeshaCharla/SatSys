#!/bin/bash
# Script to compress only the source files required to build the extended abstract.
# Output: satsys_paper.zip

PROJ_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT="satsys_paper.zip"

cd "$PROJ_DIR" || exit 1

# Remove old archive if it exists
rm -f "$OUTPUT"

cp SCR_SatSys.tex root.tex

zip -r "$OUTPUT" \
    root.tex \
    ifacconf.cls \
    leftindex.sty \
    ltx_core/ltx_pkgs.tex \
    ltx_core/new_cmds.tex \
    ltx_core/lst_style.tex \
    secs/0-extended_abstract.tex

# Rename SCR_SatSys.tex to root.tex inside the archive
rm root.tex

echo ""
echo "Created $OUTPUT ($(du -h "$OUTPUT" | cut -f1))"
