#!/bin/bash 

#$ -N RunVelvet2b                                  
#$ -q long
#$ -m abe 
#$ -M zzeng4@nd.edu

##Move to correct WD
module load bio/2.0
# conda activate ngs
source ../setup_files/path_set 
cd $PWDHERE/Velvet

export PATH=$PATH:$PWDHERE/software/Velvet

#input define
reads=$PWDHERE/input_files/reads-norm.fq

##run code
velvetg oases.65 -read_trkg yes &
velvetg oases.75 -read_trkg yes &
velvetg oases.85 -read_trkg yes &

wait

