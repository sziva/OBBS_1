#!/bin/bash
for record in data/*.qrs
do
    cd /home/ziva/Desktop/OBBS_1/data;
    echo "Evaluating $(basename ${record%.*}) ..."
    bxb -r $(basename ${record%.*}) -a atr qrs
done