#!/bin/bash

for i in `seq 1 1000000`; do
  ./scraper.sh
  sleep 480
done
