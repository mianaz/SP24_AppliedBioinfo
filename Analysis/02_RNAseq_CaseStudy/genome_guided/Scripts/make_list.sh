cp make_1.sh make_1.listed.sh
cp make_2.sh make_2.listed.sh
#cp make_1b.sh make_1b.listed.sh
#cp make_1c.sh make_1c.listed.sh
#cp make_1d.sh make_1d.listed.sh
#cp make_2b.sh make_2b.listed.sh

declare od=/scratch365/zzeng4/SP24_AppliedBioinfo/Analysis/01_Quality_Control

#for use with _R1.fastq formatting:
#sed -i "s/()/$(ls -lAh $od/final_output/ | sed 1d | awk '{print $9}' | sed 's/_R[12].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_1.listed.sh
#sed -i "s/()/$(ls -lAh $od/final_output/ | sed 1d | awk '{print $9}' | sed 's/_R[12].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_2.listed.sh
#sed -i "s/()/$(ls -lAh $od/final_output/ | sed 1d | awk '{print $9}' | sed 's/_R[12].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_star.listed.sh

#for use with _1.fastq formatting:
sed -i "s/()/$(ls -lAh $od/final_QC_output/ | sed 1d | awk '{print $9}' | sed 's/_[12u].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_1.listed.sh
sed -i "s/()/$(ls -lAh $od/final_QC_output/ | sed 1d | awk '{print $9}' | sed 's/_[12u].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_2.listed.sh
#sed -i "s/()/$(ls -lAh $od/final_output/ | sed 1d | awk '{print $9}' | sed 's/_[12u].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_1b.listed.sh
#sed -i "s/()/$(ls -lAh $od/final_output/ | sed 1d | awk '{print $9}' | sed 's/_[12u].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_1c.listed.sh
#sed -i "s/()/$(ls -lAh $od/final_output/ | sed 1d | awk '{print $9}' | sed 's/_[12u].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_2b.listed.sh
#sed -i "s/()/$(ls -lAh $od/final_output/ | sed 1d | awk '{print $9}' | sed 's/_[12u].*$//g' | sort | uniq | tr '\n' '&' | sed -e 's/&/" "/g' -e 's/^/("/g' -e 's/ "$/)/g')/g" make_1d.listed.sh
