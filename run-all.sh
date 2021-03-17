#!/bin/bash

echo "Step 0 - Install dependencies"
./0-setup.sh

echo "Step 1 - Fetch links"
./1-fetch-monthly-links.sh

echo "Step 2 - Download articles"
./2-download-articles.sh

echo "Step 3 - Extract text"
./3-extract-text.sh

echo "Done"
