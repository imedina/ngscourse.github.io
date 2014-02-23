rm -r data
mkdir data
cd data
cp ../../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa .
wc -l f000_raw_mirna.fastq
fastqc f000_raw_mirna.fastq
CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA
CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC
library (Biostrings)
myseq <- DNAString ("CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC")
reverse (myseq)
complement (myseq)
reverseComplement (myseq)
