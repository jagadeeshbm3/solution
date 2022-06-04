#!/bin/bash

RANDOM=$$
num=0
for i in `seq 10`
do
echo $num, $RANDOM >> inputFile
((num = num + 1))
chmod 777 inputFile
done
