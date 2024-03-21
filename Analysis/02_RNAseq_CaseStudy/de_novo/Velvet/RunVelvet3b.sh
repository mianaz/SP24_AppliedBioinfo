#!/bin/bash 

#$ -N RunVelvet3b                                
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
oases oases.65 &
oases oases.75 &
oases oases.85 &

wait
