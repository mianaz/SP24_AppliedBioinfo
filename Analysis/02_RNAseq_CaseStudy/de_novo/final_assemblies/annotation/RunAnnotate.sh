#!/bin/bash 

#$ -N RunAnnotate                                 
#$ -q long
#$ -m abe 
#$ -M zzeng4@nd.edu

##Move to correct WD
source ../../setup_files/path_set 
cd $PWDHERE/final_assemblies/annotation

bash ./scripts/Annotate.sh -p GENE
