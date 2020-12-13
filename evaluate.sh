#!/bin/bash
for record in data/*.qrs
do
    cd /home/ziva/Desktop/OBBS_1/data;
    echo "Evaluating $(basename ${record%.*}) ..."
    bxb -r $(basename ${record%.*}) -f 0 -a atr qrs -l eval-l1.txt eval-l2.txt
done

sumstats eval-l1.txt eval-l2.txt > finalResults.txt
