#!/bin/bash

#$ -M 
#$ -m abe
#$ -q debug
#$ -N RunQC_E

#make output folder
declare od=.

if [ -d $od/bbmap ]; then
    echo "directory exists"
else
    mkdir $od/bbmap
fi

echo "SKIPPING Removing host contamination and generating stats using BBMAP"

for g in $od/bbmap/*1.trimclean*.fq; do
    base=${g%_1.trim*}
    cp ${g} ${base}_1.trimclean.sickleclean.spikeclean.hostclean.fq
    cp ${base}_2.trimclean.sickleclean.spikeclean.fq ${base}_2.trimclean.sickleclean.spikeclean.hostclean.fq
    cp ${base}.unpaired.trimclean.sickleclean.spikeclean.fq ${base}.unpaired.trimclean.sickleclean.spikeclean.hostclean.fq

    echo "SKIPPING HOST CONTAMINATION SEQUENCE REMOVAL" >> $od/bbmap/$(basename ${base}.stats.txt)
done
