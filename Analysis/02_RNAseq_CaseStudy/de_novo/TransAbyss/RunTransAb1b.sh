#!/bin/bash 

#$ -N TransAb1b                                    
#$ -q long
#$ -M 
#$ -m abe

#set wd
module load bio/2.0
#conda activate ngs
source ../setup_files/path_set 
cd $PWDHERE/TransAbyss

#export PATH=$PATH:$PWDHERE/software/TransABySS
export PATH=$PWDHERE/software/TransABySS:$PATH

#run
reads=$PWDHERE/input_files/reads.fq.normalized_K25_maxC30_minC0_maxCV10000.fq
#symlinks does not work on CRC
#reads=$PWDHERE/input_files/reads-norm.fq
OD=`pwd`

transabyss -k 65 --se $reads --outdir $OD --name k65.transabyss.fa --threads 2 -c 12 &
transabyss -k 75 --se $reads --outdir $OD --name k75.transabyss.fa --threads 2 -c 12 &
transabyss -k 85 --se $reads --outdir $OD --name k85.transabyss.fa --threads 2 -c 12 &

wait
