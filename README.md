# tagesschau.de – Article downloader

This small utility written in Bash downloads all news articles from the past year in text format.
It accesses the official tagesschau.de API to access the article archive.

## How to run

```bash
./run-all.sh
```

or execute the individual steps

```bash
./0-setup.sh
./1-fetch-monthly-links.sh
./2-download-articles.sh
./3-extract-text.sh
```
