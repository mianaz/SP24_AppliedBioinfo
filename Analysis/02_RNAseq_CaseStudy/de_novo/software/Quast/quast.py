#!/bin/bash

if [ ! $(command -v singularity) ]; then
	module load singularity
fi

VERSION=5.0.2
PACKAGE=quast
TOOL=quast.py
DIRECTORY=$PWDHERE/software/Quast
STORAGE=/N/home/,/N/slate,/N/project

OPTIONS=$OPTIONS" -B $STORAGE"

singularity exec $OPTIONS $DIRECTORY/singularity-$PACKAGE-$VERSION.sif $TOOL "$@"
