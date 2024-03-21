#!/bin/bash 

#$ -N RunSOAP1                                     
#$ -q long
#$ -m abe
#$ -M 

##Move to correct WD
module load bio/2.0
#conda activate ngs
source ../setup_files/path_set
cd $PWDHERE/SOAP

##load modules
export PATH=$PATH:$PWDHERE/software/SOAPdenovo

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 35 -o output35 &
SOAPdenovo-Trans-127mer all -s config_file -K 45 -o output45 &
SOAPdenovo-Trans-127mer all -s config_file -K 55 -o output55 &

wait
