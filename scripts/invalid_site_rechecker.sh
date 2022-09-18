#!/bin/bash
for f in $(awk -F " " '/url:/ {print $2}' _data/sites.yml)
do
  echo $f" Response code: "$(curl -o /dev/null -sw "%{response_code}" $f) | grep -v '200\|301\|302' &
done
