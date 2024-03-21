#!/bin/bash 

#$ -N RunVelvet1                                   
#$ -q long
#$ -m abe 
#$ -M 

##Move to correct WD
module load bio/2.0
#conda activate ngs
source ../setup_files/path_set 
cd $PWDHERE/Velvet

export PATH=$PATH:$PWDHERE/software/Velvet

#input define
left=$PWDHERE/input_files/left-norm.fq
right=$PWDHERE/input_files/right-norm.fq

##run code
velveth oases.35 35 -shortPaired -fastq  $left $right &
velveth oases.45 45 -shortPaired -fastq  $left $right &
velveth oases.55 55 -shortPaired -fastq  $left $right &

wait

