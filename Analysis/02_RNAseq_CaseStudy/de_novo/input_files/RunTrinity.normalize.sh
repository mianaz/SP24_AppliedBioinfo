#!/bin/bash 

#$ -N RunTrinityNorm                                 
#$ -q long
#$ -M 
#$ -m abe

source ../setup_files/path_set 

#conda activate ngs
module load bio/2.0

export PATH=$PATH:$PWDHERE/software/Trinity

cd $PWDHERE/input_files

export left=$PWDHERE/input_files/left.fq
export right=$PWDHERE/input_files/right.fq

insilico_read_normalization.pl --seqType fq -JM 100G --max_cov 30 --left $left --right $right --pairs_together --PARALLEL_STATS --CPU 16
ln -s $PWDHERE/input_files/left.norm.fq $PWDHERE/input_files/left-norm.fq
ln -s $PWDHERE/input_files/right.norm.fq $PWDHERE/input_files/right-norm.fq
