#!/bin/bash 

#$ -N RunTrinity                                   
#$ -q long
#$ -m abe 
#$ -M zzeng4@nd.edu

module load bio/2.0
#conda activate ngs
source ../setup_files/path_set
cd $PWDHERE/Trinity

export PATH=$PATH:$PWDHERE/software/Trinity

export reads=$PWDHERE/input_files/reads-norm.fq

Trinity --max_memory 200G --seqType fq  --single $reads --CPU 6 --full_cleanup --output trinity_out_dir 

cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
