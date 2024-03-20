#!/bin/bash 

#$ -N RunVelvet2                                  
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
velvetg oases.35 -read_trkg yes  &
velvetg oases.45 -read_trkg yes  &
velvetg oases.55 -read_trkg yes  &

wait

