#!/bin/bash 

#$ -N RunVelvet3                                  
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
oases oases.35 &
oases oases.45 &
oases oases.55 &

wait
