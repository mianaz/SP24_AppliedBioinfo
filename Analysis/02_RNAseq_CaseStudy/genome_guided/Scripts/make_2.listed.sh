#list of stubs
declare -a stubs=("MyC-CaP-hFOXA1-del255Y1" "MyC-CaP-hFOXA1-del255Y2" "MyC-CaP-hFOXA1-EV1" "MyC-CaP-hFOXA1-EV2" "MyC-CaP-hFOXA1-R219S1" "MyC-CaP-hFOXA1-R219S2" "MyC-CaP-hFOXA1-WT1" "MyC-CaP-hFOXA1-WT2")

for i in "${stubs[@]}"
do
#cp file into stub.htseq-count.job
cp 2_htseq-count.job.blank $i.htseq-count.job

#cp stub into stub.htseq-count.job $stub
sed -i "s/stub=/stub=$i/g" $i.htseq-count.job

#cp stub into stub.htseq-count.job jobname
sed -i "s/htseq&/htseq_$i/1" $i.htseq-count.job

done
