#!/bin/bash

#$ -M 
#$ -m abe
#$ -q debug
#$ -N RunQC_D

# Define output directory
declare od=.
#make output folder

if [ -d $od/bbmap ]; then
    echo "directory exists"
else
    mkdir $od/bbmap
fi

echo "SKIPPING Removing phix adaptors and sequencing artifacts using BBMAP"

if [ -d $od/bbmap ]; then
    echo "directory exists"
else
    mkdir $od/bbmap
fi

echo "SKIPPING Removing phix adaptors and sequencing artifacts using BBMAP"

for g in $od/sickle/*1.trimclean.sickleclean.fq ; do
    o=${g#$od/sickle/}
    base=${o%_1.trim*}

    cp $od/sickle/${base}_1.trimclean.sickleclean.fq $od/bbmap/${base}_1.trimclean.sickleclean.spikeclean.fq
    cp $od/sickle/${base}_2.trimclean.sickleclean.fq $od/bbmap/${base}_2.trimclean.sickleclean.spikeclean.fq
    cp $od/sickle/${base}.unpaired.trimclean.sickleclean.fq $od/bbmap/${base}.unpaired.trimclean.sickleclean.spikeclean.fq
done
