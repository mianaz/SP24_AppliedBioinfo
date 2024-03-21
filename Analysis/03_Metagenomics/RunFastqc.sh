#!/bin/bash

#$ -M zzeng4@nd.edu
#$ -m abe
#$ -q long
#$ -N fastqc

#module load bio/2.0
conda activate ngs

declare od=.
echo "Running FastQC and Generating Stats"

#make output folder
if [ -d $od/fastqc ]; then
    echo "./fastqc exists"
else
    mkdir $od/fastqc
fi

#for g in ../../../Input_data/*fastq.gz; do
for g in $od/*fastq; do
      fastqc -o $od/fastqc $g
done

# run multiqc
multiqc $od/fastqc

echo "DONE Running FastQC and Generating Stats!"
