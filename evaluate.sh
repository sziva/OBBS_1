#!/bin/bash
for record in data/*.qrs
do
    cd /home/ziva/Desktop/OBBS_1/data;
    echo "Evaluating $(basename ${record%.*}) ..."
    bxb -r $(basename ${record%.*}) -f 0 -a atr qrs -L eval-L1.txt eval-L2.txt
done