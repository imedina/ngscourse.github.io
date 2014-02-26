rm -r data
mkdir data
cd data
cp ../../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa .
cd ~/ngscourse.github.io/COURSE_EXAMPLE_DATA/visualization/example_1

ll
samtools index NA12878_child.bam
samtools index NA12891_dad.bam
samtools index NA12892_mom.bam
igv

