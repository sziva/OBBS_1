#!/bin/bash
for record in data/*.qrs
do
    echo $record
    echo "Evaluating record ..."
    bxb -r $(basename ${record%.*}) -a atr qrs
done