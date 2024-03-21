#!/bin/bash

#$ -M 
#$ -m abe
#$ -q long
#$ -N RunQC_E

conda activate ngs
#module load bio/2.0

# Define output directory
declare od=.
#make output folder

if [ -d $od/bbmap ]; then
    echo "directory exists"
else
    mkdir $od/bbmap
fi

echo "Removing host contamination and generating stats using BBMAP"

for g in $od/bbmap/*_1.trimclean.sickleclean.spikeclean.fq; do
    bbwrap.sh \
    threads=16 \
    minid=0.95 \
    maxindel=3 \
    bwr=0.16 \
    bw=12 \
    quickmatch \
    fast \
    minhits=2 \
    qtrim=rl \
    trimq=20 \
    minlength=60 \
    in=$g,${g%_1*}.unpaired.trimclean.sickleclean.spikeclean.fq \
    in2=${g%_1*}_2.trimclean.sickleclean.spikeclean.fq,NULL \
    outu1=${g%_1*}_1.trimclean.sickleclean.spikeclean.hostclean.fq \
    outu2=${g%_1*}_2.trimclean.sickleclean.spikeclean.hostclean.fq \
    outu=${g%_1*}.unpaired.trimclean.sickleclean.spikeclean.hostclean.fq \
    path=../References/human/ 2>&1 >/dev/null | \
    awk '{print "HOST CONTAMINATION SEQUENCES "$0}' | \
    tee -a ${g%_1.*}.stats.txt

done

echo "DONE Removing host contamination and generating stats using BBMAP!"
