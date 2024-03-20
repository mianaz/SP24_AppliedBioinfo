#!/bin/bash

#$ -M zzeng4@nd.edu
#$ -m abe
#$ -q debug
#$ -N RunQC_H

#make output folder
declare od=/afs/crc.nd.edu/user/g/gliu4/LabData/RNAseq

if [ -d $od/final_QC_output ]; then
    echo "directory exists"
else
    mkdir $od/final_QC_output
fi

echo "Copying clean files to the folder"
cp $od/bbmap/*final.clean.fq $od/final_QC_output/

for f in $od/bbmap/*stats.txt; do
  cp $f $od/final_QC_output/
done

echo "DONE copying clean files to the folder!"
