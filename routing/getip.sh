#!/bin/sh

function log2(x)
{
  pow=32;
  if [ x le 1]:

  fi
}

FILE=china-ip
grep 'apnic|CN|ipv4|' $FILE | cut -f 4,5 -d'|'|sed -e 's/|/ /g' | while read ip cnt
do
  echo $ip:$cnt
  mask=$(cat << EOF | bc | tail -1
  pow=32;
  function log2(x) 
  {
    if (x<=1) return (pow);
    pow--;
    return(log2(x/2));
  }
  log2($cnt)
  EOF
)

echo $ip/$mask >>ip.txt
done'
