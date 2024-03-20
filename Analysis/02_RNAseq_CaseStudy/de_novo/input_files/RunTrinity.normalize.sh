#!/bin/bash 

#$ -N RunTrinityNorm                                 
#$ -q long
#$ -M zzeng4@nd.edu
#$ -m abe

source ../setup_files/path_set 

#conda activate ngs
module load bio/2.0

export PATH=$PATH:$PWDHERE/software/Trinity

cd $PWDHERE/input_files

export reads=$PWDHERE/input_files/reads.fq

insilico_read_normalization.pl --seqType fq -JM 100G --max_cov 30 --single $reads --PARALLEL_STATS --CPU 16
ln -s $PWDHERE/input_files/single.norm.fq $PWDHERE/input_files/reads-norm.fq
