#!/bin/bash

#$ -M 
#$ -m abe
#$ -q debug
#$ -N PullRef

#download human reference genome from NCBI
#echo 'Downloading human reference genome GRCh38...'
#wget 'https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.fna.gz'
#gunzip GRCh38_latest_genomic.fna.gz
#mv GRCh38_latest_genomic.fna GRCh38_genomic.fa
#echo 'Downloading human genome annotation...'
#wget 'https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.gff.gz'
#gunzip GRCh38_latest_genomic.gff.gz
#mv GRCh38_latest_genomic.gff GRCh38_genomic.gff
#wget 'https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.gtf.gz'
#gunzip GRCh38_latest_genomic.gtf.gz
#mv GRCh38_latest_genomic.gtf GRCh38_genomic.gtf

# Download human reference genome from Ensembl
wget 'https://ftp.ensembl.org/pub/release-111/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz'
gunzip Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
mv Homo_sapiens.GRCh38.dna.primary_assembly.fa GRCh38_ens.fa

wget 'https://ftp.ensembl.org/pub/release-111/gtf/homo_sapiens/Homo_sapiens.GRCh38.111.gtf.gz'
gunzip Homo_sapiens.GRCh38.111.gtf.gz
mv Homo_sapiens.GRCh38.111.gtf GRCh38_ens.gtf

wget 'https://ftp.ensembl.org/pub/release-111/gff3/homo_sapiens/Homo_sapiens.GRCh38.111.gff3.gz'
gunzip Homo_sapiens.GRCh38.111.gff3.gz
mv Homo_sapiens.GRCh38.111.gff3 GRCh38_ens.gff3
echo 'DONE downloading human reference genome GRCh38!'
