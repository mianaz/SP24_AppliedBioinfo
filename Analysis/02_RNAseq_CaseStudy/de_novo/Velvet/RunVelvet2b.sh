#!/bin/bash 

#$ -N RunVelvet2b                                  
#$ -q long
#$ -m abe 
#$ -M 

##Move to correct WD
module load bio/2.0
# conda activate ngs
source ../setup_files/path_set 
cd $PWDHERE/Velvet

export PATH=$PATH:$PWDHERE/software/Velvet

#input define
left=$PWDHERE/input_files/left-norm.fq
right=$PWDHERE/input_files/right-norm.fq

##run code
velvetg oases.65 -read_trkg yes -ins_length 400 &
velvetg oases.75 -read_trkg yes -ins_length 400 &
velvetg oases.85 -read_trkg yes -ins_length 400 &

wait

