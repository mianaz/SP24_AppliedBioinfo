#!/bin/bash

#$ -M zzeng4@nd.edu
#$ -m abe
#$ -q long
#$ -N RunQC_B

module load bio/2.0
#conda activate ngs

echo "Running FastQC and Generating Stats"

#Make output folder
if [ -d "fastqc" ]; then
    echo "./fastqc exists"
else
    mkdir fastqc
fi

#Change your input directory if necessary
for g in ../../../Input_data/*fastq.gz; do
      fastqc -o ./fastqc $g
done

#Run MultiQC
echo "Generating MultiQC Report"

multiqc ./fastqc

echo "DONE Running FastQC"
