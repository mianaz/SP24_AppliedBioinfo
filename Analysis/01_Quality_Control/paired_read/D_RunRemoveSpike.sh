#!/bin/bash

#$ -M  
#$ -m abe
#$ -q long
#$ -N RunQC_D

conda activate ngs
#module load bio/2.0

# define output directory
declare od=.
#make output folder

if [ -d $od/bbmap ]; then
    echo "directory exists"
else
    mkdir $od/bbmap
fi

echo "Removing phix adaptors and sequencing artifacts using BBMAP"


for f in $od/sickle/*1.trimclean.sickleclean.fq ; do
    name=${f#$od/sickle/}
    base=${name%_1.trimclean*}

    #bbduk for paired
    bbduk.sh \
    threads=16 \
    in=$od/sickle/${base}_1.trimclean.sickleclean.fq \
    in2=$od/sickle/${base}_2.trimclean.sickleclean.fq \
    k=31 \
    ref=../References/phix_adapters.fa \
    out1=$od/bbmap/${base}_1.trimclean.sickleclean.spikeclean.fq \
    out2=$od/bbmap/${base}_2.trimclean.sickleclean.spikeclean.fq \
    minlength=60 \
    2>&1 > /dev/null | awk '{print "PHIX REMOVAL PAIRED "$0}' | tee -a $od/bbmap/${base}.stats.txt

    #bbduk for unpaired
    bbduk.sh \
    threads=16 \
    in=$od/sickle/${base}.unpaired.trimclean.sickleclean.fq \
    k=31 \
    #ref=../References/phix_adapters.fa
    out=$od/bbmap/${base}.unpaired.trimclean.sickleclean.spikeclean.fq \
    minlength=60 \
    2>&1 > /dev/null | awk '{print "PHIX REMOVAL UNPAIRED "$0}' | tee -a $od/bbmap/${base}.stats.txt

done

echo "DONE Removing phix adaptors and sequencing artifacts using BBMAP!"

