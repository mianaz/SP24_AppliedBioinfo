#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=2.11.0
PACKAGE=Trinity
TOOL=/usr/local/bin/trinityrnaseq/util/insilico_read_normalization.pl
DIRECTORY=$PWDHERE/software/Trinity
STORAGE=/scratch365/zzeng4/SP24_AppliedBioinfo/

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"

