#!/bin/bash

#$ -M 
#$ -m abe
#$ -q long
#$ -N RunQC_B

#module load bio/2.0
conda activate ngs

#define output directory
declare od=.
echo "Running FastQC and Generating Stats"

#make output folder
if [ -d $od/fastqc ]; then
    echo "./fastqc exists"
else
    mkdir $od/fastqc
fi

#for g in ../../../Input_data/*fastq.gz; do
for g in $od/Input_data/*fastq.gz; do
      fastqc -o $od/fastqc $g
done

# run multiqc
multiqc $od/fastqc

echo "DONE Running FastQC and Generating Stats!"
