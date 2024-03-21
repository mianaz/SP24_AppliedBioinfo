# list files to pull
for f in /afs/crc/group/Bioinformatics/SP24_BIO60132/*gz; do echo $f; done
# link files to current directory
for f in /afs/crc/group/Bioinformatics/SP24_BIO60132/*gz; do ln -s $f; done
