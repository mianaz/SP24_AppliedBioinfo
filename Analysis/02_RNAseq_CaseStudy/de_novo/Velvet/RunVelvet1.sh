#!/bin/bash 

#$ -N RunVelvet1                                   
#$ -q long
#$ -m abe 
#$ -M zzeng4@nd.edu

##Move to correct WD
module load bio/2.0
#conda activate ngs
source ../setup_files/path_set 
cd $PWDHERE/Velvet

export PATH=$PATH:$PWDHERE/software/Velvet

#input define
reads=$PWDHERE/input_files/reads-norm.fq

##run code
velveth oases.35 35 -short -fastq  $reads &
velveth oases.45 45 -short -fastq  $reads &
velveth oases.55 55 -short -fastq  $reads &

wait

