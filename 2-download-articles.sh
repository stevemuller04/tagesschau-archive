#!/bin/bash

INFILE="out/links.txt"
OUTDIR="out/articles"

# Make sure that the output directory exists
mkdir -p "$OUTDIR"

while read url; do
	file="$OUTDIR/${url##*/}"
	echo "Downloading $url to $file ..."
	if ! curl -s -L --output "$file" "$url"; then
		echo "Failed!"
	fi
done < "$INFILE"

echo "Done."
