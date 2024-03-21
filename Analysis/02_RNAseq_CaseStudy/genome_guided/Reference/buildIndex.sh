#!/bin/bash

#$ -M 
#$ -m abe
#$ -q long
#$ -N buildIndex

#module load bio/2.0
conda activate ngs

#echo "Building genome index with STAR"

#human
#mkdir GRCh38_STAR
#STAR --runThreadN 16 \
#     --runMode genomeGenerate \
#     --genomeDir GRCh38_index \
#     --genomeFastaFiles GRCh38_ens.fa \
#     --sjdbGTFfile GRCh38_ens.gtf \
#     --sjdbOverhang 100 

#mouse
#mkdir GRCm39_STAR
#STAR --runThreadN 16 \
#     --runMode genomeGenerate \
#     --genomeDir GRCm39_index \
#     --genomeFastaFiles GRCm39_ens.fa \
#     --sjdbGTFfile GRCm39_ens.gtf \
#     --sjdbOverhang 100

#daphnia
hisat2-build -p 16 -f LRV0.fa LRV0

