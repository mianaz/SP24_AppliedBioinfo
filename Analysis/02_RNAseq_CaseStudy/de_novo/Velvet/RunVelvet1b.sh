#!/bin/bash 

#$ -N RunVelvet1b                                   
#$ -q long
#$ -m abe 
#$ -M zzeng4@nd.edu

##Move to correct WD
module load bio/2.0
# conda activate ngs

source ../setup_files/path_set 
cd $PWDHERE/Velvet

#export PATH=$PATH:$PWDHERE/software/Velvet

#input define
reads=$PWDHERE/input_files/reads-norm.fq

##run code
velveth oases.65 65 -short -fastq $reads &
velveth oases.75 75 -short -fastq $reads &
velveth oases.85 85 -short -fastq $reads &

wait

