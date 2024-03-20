#!/bin/bash


if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=14dec30
PACKAGE=evigene
TOOL=/usr/local/evigene14dec30/scripts/prot/trclass2mainalt.pl
DIRECTORY=$PWDHERE/software/EviGene
STORAGE=/scratch365/zzeng4/SP24_AppliedBioinfo/

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif perl $TOOL "$@"
