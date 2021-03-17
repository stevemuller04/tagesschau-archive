#!/bin/bash

OUTFILE="out/links.txt"

# These are the URLs containing the article links that we wish to download
urls=(
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202103.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202102.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202101.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202012.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202011.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202010.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202009.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202008.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202007.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202006.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202005.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202004.html"
	"https://www.tagesschau.de/archiv/meldungsarchiv100~_date-202003.html"
)

# Make sure that the output directory exists
OUTDIR=$(dirname "$OUTDIR")
mkdir -p "$OUTDIR"

# Make sure that output file exists and is empty
> "$OUTFILE"

# Process each URL
for url in "${urls[@]}"
do
	echo "Downloading $url ..."

	# Download URL and extract article links.
	# Then convert each web link (HTML) to an API link (JSON) which
	# allows us to download the article content more easily.
	# Store all API links in $OUTFILE.
	curl -s "$url" | \
		grep -oP '(?<=^<li>\d\d:\d\d Uhr - <a href=")/[^"]+' | \
		awk '{ sub(/\.html/,".json"); print "https://tagesschau.de/api2" $0 }' \
		>> "$OUTFILE"
done

echo "Done."
