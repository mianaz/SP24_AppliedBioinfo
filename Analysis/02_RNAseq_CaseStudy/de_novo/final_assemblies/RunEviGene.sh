#!/bin/bash 

#$ -N RunEviGene                                 
#$ -q long
#$ -m abe 
#$ -M zzeng4@nd.edu

module load bio/2.0
#conda activate ngs
source ../setup_files/path_set 
cd $PWDHERE/final_assemblies

export PATH=$PATH:$PWDHERE/software/EviGene/

tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa

trclass2mainalt.pl -trclass *trclass
mv *mainalt.tab annotation/
cat okayset/combined.okay.fa okayset/combined.okalt.fa > annotation/transcripts.fa
cat okayset/combined.okay.aa okayset/combined.okalt.aa > annotation/transcripts.aa
