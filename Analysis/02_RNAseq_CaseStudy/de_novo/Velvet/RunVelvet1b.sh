#!/bin/bash 

#$ -N RunVelvet1b                                   
#$ -q long
#$ -m abe 
#$ -M 

##Move to correct WD
module load bio/2.0
# conda activate ngs

source ../setup_files/path_set 
cd $PWDHERE/Velvet

#export PATH=$PATH:$PWDHERE/software/Velvet

#input define
left=$PWDHERE/input_files/left-norm.fq
right=$PWDHERE/input_files/right-norm.fq

##run code
velveth oases.65 65 -shortPaired -fastq $left $right &
velveth oases.75 75 -shortPaired -fastq $left $right &
velveth oases.85 85 -shortPaired -fastq $left $right &

wait

