#!/bin/sh
cat tmp | awk 'function log2(x){if(x<=1) return pow;else pow--;return(log2(x/2));}{pow=32;print $1,log2($2)}' >> xx
cat xx | while read ip mask
do
  echo ${ip}/${mask} >> ip.txt
done
