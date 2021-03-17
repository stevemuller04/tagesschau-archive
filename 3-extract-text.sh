#!/bin/bash

INDIR="out/articles"
OUTDIR="out/text"

# Make sure that the output directory exists
mkdir -p "$OUTDIR"

for infile in "$INDIR"/*.json; do
	# Derive output file name from input file name
	outfile=$(basename "$infile" .json)
	outfile="$OUTDIR/$outfile.txt"
	echo "Extracting text from $infile ..."

	# Extract text from input file (JSON) and remove HTML tags
	jq -r '.content[] | select(.type == "text").value' "$infile" | sed -e 's/<[^>]*>//g' > $outfile
done

echo "Done."
