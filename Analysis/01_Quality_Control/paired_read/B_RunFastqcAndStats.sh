#!/bin/bash

#$ -M zzeng4@nd.edu
#$ -m abe
#$ -q long
#$ -N RunQC_B

#module load bio/2.0
conda activate ngs

declare od=/afs/crc.nd.edu/user/g/gliu4/LabData/RNAseq
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
