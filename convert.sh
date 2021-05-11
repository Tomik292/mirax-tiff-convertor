#!/bin/bash
FILE=$1

DIR_WITH_TIFF=/tiff

DIRNAME=`dirname "$FILE"`
BASENAME=`basename "$FILE"`
FILENAME=${BASENAME%.mrxs}

echo "---Converting  $BASENAME to $FILENAME.tiff---"
python3 extract_label.py $FILE
vips tiffsave $FILE $FILENAME.tiff --tile --pyramid --compression jpeg --Q 45 --tile-width 512 --tile-height 512 --bigtiff
mv $FILENAME.tiff $DIR_WITH_TIFF/$FILENAME.tiff
mv $FILENAME-label.png $DIR_WITH_TIFF/$FILENAME-label.png

