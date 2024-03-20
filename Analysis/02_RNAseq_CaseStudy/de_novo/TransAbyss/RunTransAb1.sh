#!/bin/bash 

#$ -N TransAb1                                    
#$ -q long
#$ -m abe
#$ -M zzeng4@nd.edu

#set wd
module load bio/2.0
#conda activate ngs
source ../setup_files/path_set 
cd $PWDHERE/TransAbyss

#if using container(with abyss-pe), use this
export PATH=$PWDHERE/software/TransABySS:$PATH
#export PATH=$PATH:$PWDHERE/software/TransABySS

#run
reads=$PWDHERE/input_files/reads.fq.normalized_K25_maxC30_minC0_maxCV10000.fq
#symlinks does not work on CRC
#reads=$PWDHERE/input_files/reads-norm.fq
OD=`pwd`

transabyss -k 35 --se $reads --outdir $OD --name k35.transabyss.fa --threads 2 -c 12 &
transabyss -k 45 --se $reads --outdir $OD --name k45.transabyss.fa --threads 2 -c 12 &
transabyss -k 55 --se $reads --outdir $OD --name k55.transabyss.fa --threads 2 -c 12 &

wait
