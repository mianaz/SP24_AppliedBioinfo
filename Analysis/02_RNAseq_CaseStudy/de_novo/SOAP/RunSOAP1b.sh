#!/bin/bash 

#$ -N RunSOAP1                                     
#$ -q long
#$ -m abe
#$ -M 

module load bio/2.0
#conda activate ngs

##Move to correct WD
source ../setup_files/path_set
cd $PWDHERE/SOAP/

##load modules
export PATH=$PATH:$PWDHERE/software/SOAPdenovo

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 65 -o output65 &
SOAPdenovo-Trans-127mer all -s config_file -K 75 -o output75 &
SOAPdenovo-Trans-127mer all -s config_file -K 85 -o output85 &

wait
