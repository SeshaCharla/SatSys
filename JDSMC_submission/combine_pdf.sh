#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Combining main paper and rebuttal into a single PDF..."

PAPER_PDF="../SCR_SatSys.pdf"
REBUTTAL_PDF="../rebuttal/v2/rebuttal.pdf"
OUTPUT_PDF="SCR_SatSysDetect_paper_rebuttal.pdf"

# Verify input files exist
if [ ! -f "$PAPER_PDF" ]; then
    echo "Error: Main paper PDF not found at $PAPER_PDF"
    exit 1
fi

if [ ! -f "$REBUTTAL_PDF" ]; then
    echo "Error: Rebuttal PDF not found at $REBUTTAL_PDF"
    exit 1
fi

# Combine PDFs
pdfunite "$PAPER_PDF" "$REBUTTAL_PDF" "$OUTPUT_PDF"

echo "Success! Combined PDF generated: $OUTPUT_PDF"
