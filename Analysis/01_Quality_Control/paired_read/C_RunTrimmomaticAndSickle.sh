#!/bin/bash

#$ -M  
#$ -m abe
#$ -q long
#$ -N RunQC_C

#module load bio/2.0
conda activate ngs

#specify output directory
declare od=.

#make output folder

if [ -d $od/trimmomatic ]; then
    echo "directory exists"
else
    mkdir $od/trimmomatic
fi

if [ -d $od/sickle ]; then
    echo "directory exists"
else
    mkdir $od/sickle
fi

echo "Trimming with Trimmomatic and Sickle"

for g in $od/Input_data/*_R1*; do
#for g in ../../../Input_data/*_R1*; do    #######IF YOUR READS ARE *R1*, please change this to *R1* instead of *_1*
    i1=$g
    i2=${g%_R1*}"_R2*"                     #######IF YOUR READS ARE *R1*, please change this to %_R1* and _R2* instead of _1* and _2*
    o=${g#$od/Input_data/}
    #o=${g#../../Input_data/}
    base=${o%_R1*}                     #######IF YOUR READS ARE *R1*, please change this to o%R1 instead of *_1*

    #trimmomatic pe
    trimmomatic PE $i1 $i2 \
    -threads 16 \
    -trimlog $od/trimmomatic/$base.trimlog.txt \
    $od/trimmomatic/${base}_1.trimclean.fq \
    $od/trimmomatic/${base}_1.u.trimclean.fq \
    $od/trimmomatic/${base}_2.trimclean.fq \
    $od/trimmomatic/${base}_2.u.trimclean.fq \
    ILLUMINACLIP:../References/TruSeq3-PE.fa:1:50:30 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:60

    #sickle pe
    sickle pe \
    -n \
    -f $od/trimmomatic/${base}_1.trimclean.fq \
    -r $od/trimmomatic/${base}_2.trimclean.fq \
    -o $od/sickle/${base}_1.trimclean.sickleclean.fq \
    -p $od/sickle/${base}_2.trimclean.sickleclean.fq \
    -t sanger \
    -q 20 \
    -l 60 \
    -s $od/sickle/${base}_u.trimclean.sickleclean.fq

    #sickle se
    sickle se \
    -n \
    -f $od/trimmomatic/${base}_1.u.trimclean.fq \
    -o $od/sickle/${base}_1.u.trimclean.sickleclean.fq \
    -t sanger \
    -q 20 \
    -l 60 \

    #sickle se
    sickle se \
    -n \
    -f $od/trimmomatic/${base}_2.u.trimclean.fq \
    -o $od/sickle/${base}_2.u.trimclean.sickleclean.fq \
    -t sanger \
    -q 20 \
    -l 60 \

    #combining unpaired
    cat $od/sickle/${base}_1.u.trimclean.sickleclean.fq \
    $od/sickle/${base}_2.u.trimclean.sickleclean.fq \
    $od/sickle/${base}_u.trimclean.sickleclean.fq > \
    $od/sickle/${base}.unpaired.trimclean.sickleclean.fq

    rm $od/sickle/${base}_1.u.trimclean.sickleclean.fq $od/sickle/${base}_2.u.trimclean.sickleclean.fq $od/sickle/${base}_u.trimclean.sickleclean.fq

done

echo "DONE Trimming with Trimmomatic and Sickle!"
