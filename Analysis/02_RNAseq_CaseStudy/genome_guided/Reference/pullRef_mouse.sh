#!/bin/bash

#$ -M 
#$ -m abe
#$ -q debug
#$ -N PullRef

#download mouse reference genome from NCBI
echo 'Downloading mouse reference genome GRCm39..'
#wget "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCF_000001635.27/download?include_annotation_type=GENOME_FASTA,GENOME_GFF"

#mv 'download?include_annotation_type=GENOME_FASTA,GENOME_GFF' ref.zip
#unzip ref.zip

#cd ncbi_dataset/data/GCF_000001635.27/
#mv * ../../../
#cd ../../../
#rm -R ncbi_dataset
#rm ref.zip
#mv genomic.gff GRCm39_genomic.gff
#mv genomic.gtf GRCm39_genomic.gtf
#mv GCF_000001635.27_GRCm39_genomic.fna GRCm39_refseq.fa

#wget 'https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz'
#gunzip GCF_000001635.27_GRCm39_genomic.fna.gz
#mv GCF_000001635.27_GRCm39_genomic.fna GRCm39_refseq.fa

#wget 'https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.gff.gz'
#gunzip GCF_000001635.27_GRCm39_genomic.gff.gz
#mv GCF_000001635.27_GRCm39_genomic.gff GRCm39_refseq.gff

#Uncomment if using STAR to build index, which uses gtf format
#wget 'https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.gtf.gz'
#gunzip GCF_000001635.27_GRCm39_genomic.gtf.gz
#mv GCF_000001635.27_GRCm39_genomic.gtf GRCm39_refseq.gtf

# Download mouse reference genome from Ensembl
wget 'https://ftp.ensembl.org/pub/release-111/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz'
gunzip Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
mv Mus_musculus.GRCm39.dna.primary_assembly.fa GRCm39_ens.fa

wget 'https://ftp.ensembl.org/pub/release-111/gtf/mus_musculus/Mus_musculus.GRCm39.111.gtf.gz'
gunzip Mus_musculus.GRCm39.111.gtf.gz
mv Mus_musculus.GRCm39.111.gtf GRCm39_ens.gtf

wget 'https://ftp.ensembl.org/pub/release-111/gff3/mus_musculus/Mus_musculus.GRCm39.111.gff3.gz'
gunzip Mus_musculus.GRCm39.111.gff3.gz                
mv Mus_musculus.GRCm39.111.gff3 GRCm39_ens.gff3

echo 'DONE downloading mouse reference genome GRCm39!'
