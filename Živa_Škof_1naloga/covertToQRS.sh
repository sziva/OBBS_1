#!/bin/bash
for record in data/*.asc
do
    cd /home/ziva/Desktop/OBBS_1/data;
    echo "Converting $(basename ${record%.*}) to QRS ..."
    wrann -r $(basename ${record%.*}) -a qrs < $(basename $record);
done