#!/usr/bin/python
import sys
import continuous_downloader as cdown

DownloadCommand = sys.argv[1]
try:
    ItemListFileName = sys.argv[2]
except:
    ItemListFileName = '.cd-download'

CD = cdown.ContinuousDownloader(DownloadCommand, ItemListFileName)
CD.download_continuously()
