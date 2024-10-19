#!/bin/bash

#START=74528017
#START=`ls -1 scraper | tail -1`
#START=`find scraper/7* -type f -size -110k -size +100k | sort -n | head -1 | awk -F/ '{print $2}'`
START=`grep -s -l error404 scraper/* | sort -n | head -1 | awk -F/ '{print $2}'`
STOP=$((START+100))
#START=73563772
#STOP=73563800

if [ $STOP -gt 73529000 ]; then
  echo "DONE! $STOP - pls exit"
  exit
fi

#for i in `seq 74526217 74535164`; do
for i in `seq $START $STOP`; do
#for i in `seq 75006801 75006801`; do
  curl -b cookies -s "http://www.toreba.net/replay/detail/$i" | dos2unix > scraper/$i
  TES=`grep "video_title" scraper/$i | grep "Got "`
  echo "$i"
  echo "$i" >> scraper-res.txt
  if [ ! -z "$TES" ]; then
    PRIZE=`sed 's#.*Got \(.[^<]*\)</div>.*#\1#' <<< $TES`
    UPLOAD=`grep "uploadtime_replay" scraper/$i | sed 's#.*\&nbsp;\(.[^<]*\)</span>.*#\1#'`
#    echo "i=$i"
#    echo "PRIZE=$PRIZE"
#    echo "UPLOAD=$UPLOAD"
    echo "$i|$PRIZE|$UPLOAD" >> scraper-res.txt
  fi
done
