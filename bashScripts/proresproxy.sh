#!/usr/bin/env bash

# Usage notes
# ===========
#
# proxy_watermark.png needs to be in the same directory as the script
# download from here: http://whoismatt.com/images/2016/7-july/adobe_proxy_logo.png
#
# on OSX, both pv and ffmpeg will need to be installed via homebrew

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

inputfile=$1
nakedname="${inputfile%.*}"
ext="${inputfile##*.}"
outputfile="Proxies/${nakedname}-proxy.${ext}" 

echo "outputfile = $outputfile"

mkdir -p Proxies

# find input resolution
# =====================

# input aspects:
#   cine 4K = 4096:2160 (1.9:1 = 1.896) - proxy at 1024:540
#   UHD(4K) = 3840:2160 (16:9 = 1.777) - proxy at 720p
#   1080p = 1920:1080 (16:9 = 1.777) - proxy at 720p
#   720p = 1280:720 (16:9 = 1.777)
#
# proxy aspects:
#    1024x540 = 1.9:1
#    1280x720 = 16:9
#    1536x790 = ???  (1.944)


eval $(ffprobe -v error -of flat=s=_ -select_streams v:0 -show_entries stream=height,width $inputfile)
inputres=${streams_stream_0_width}:${streams_stream_0_height}

#TODO: make this 1024:540 if source is C4K
outputres="1280:720"

echo "inputres = $inputres"
echo "outputres = $outputres"

# EXPLANATION
# ===========
#
#   pv = pipeview, shows progress and estimated time
#
#   -v warning  turn down verbosity to only warnings
#
#   -profile:v N
#     where N = 0 -> proxy  1 -> lt  2 -> std  3 -> hq
#
#   -i logo.png = a SECOND input file, with an overlay image
#   -filter_complex "overlay=W-w-5:H-h-5/2" = make an overlay, position 5px from bottom-right
#

pv $inputfile | ffmpeg \
  -loglevel warning \
  -i pipe:0 \
  -i $scriptdir/proxy_watermark.png \
  -filter_complex "[0:v]scale=$outputres, overlay=W-w-5:H-h-5/2" \
  -codec:a copy \
  -codec:v prores \
  -profile:v 0 \
  $outputfile

