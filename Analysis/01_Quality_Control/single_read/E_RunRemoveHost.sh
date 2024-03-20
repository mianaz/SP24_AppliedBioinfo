#!/bin/bash

#$ -M zzeng4@nd.edu 
#$ -m abe
#$ -q long
#$ -N RunQC_E

# use the following command if software are not installed locally
module load bio/2.0
# use the following command if wanting to use a pre-configured conda environment
#conda activate ngs


#make output folder

if [ -d bbmap ]; then
    echo "directory exists"
else
    mkdir bbmap
fi

echo "Removing host contamination and generating stats using BBMAP"

#Index Reference Genome
#if [ -f ../References/human/ref/gemome/1/summary.txt]; then
#    echo "Reference exists"
#else
#    echo "Reference not found. Indexing..."
#    cd ../References/human/
#    bbmap.sh ref=hsref_GRCh38_p12_clean.fasta
#    cd ../../single_read/
#fi

for f in ./bbmap/*trimclean.sickleclean.spikeclean.fq; do
    base=${f%_1.trim*}

    bbwrap.sh \
    threads=16 \
    minid=0.95 \
    maxindel=3 \
    bwr=0.16 \
    bw=12 \
    quickmatch \
    fast \
    minhits=2 \
    qtrim=rl \
    trimq=20 \
    minlength=60 \
    in=$f,${base}_1.trimclean.sickleclean.spikeclean.fq \
    outu1=${base}_1.trimclean.sickleclean.spikeclean.hostclean.fq \
    path=../References/human 2>&1 >/dev/null | \
    awk '{print "HOST CONTAMINATION SEQUENCES "$0}' | \
    tee -a ./bbmap/$(basename ${base}.stats.txt)
done

echo "DONE Removing host contamination and generating stats using BBMAP!"
