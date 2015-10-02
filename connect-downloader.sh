#!/bin/bash

ID="${1##*\/}"
rm -rf $ID
rm -f $ID.flv $ID.zip

URL=$1/output/$ID.zip?download=zip
wget $URL -O $ID.zip

TMP=$ID/tmp
mkdir -p $TMP
unzip -d $TMP $ID.zip

VOIP=($(ls $TMP/cameraVoip*.flv | sort --version-sort -f))
SCREENSHARE=($(ls $TMP/screenshare*.flv | sort --version-sort -f))

for i in "${!VOIP[@]}"; do
    FILENAME=$(printf "%0*d" 4 $i)
    ffmpeg -i "${VOIP[$i]}" -i "${SCREENSHARE[$i]}" -vcodec copy -acodec copy $ID/$FILENAME.flv
done

ffmpeg -f concat -i <(for f in $ID/*.flv; do echo "file '$PWD/$f'"; done) -c copy $ID.flv

rm -rf $ID
rm -f $ID.zip
