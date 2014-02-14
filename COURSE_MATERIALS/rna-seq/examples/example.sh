rm -r data
mkdir data
cd data
cp ../../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa .
cd data
wc -l f000_raw_mirna.fastq
fastqc f000_raw_mirna.fastq
<<"COMMENT"
CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA
CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC
COMMENT
<<"COMMENT"
library (Biostrings)
myseq <- DNAString ("CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC")
reverse (myseq)
complement (myseq)
reverseComplement (myseq)
cat (c (as.character (myseq),
        as.character (reverse (myseq)),
        as.character (complement (myseq)),
        as.character (reverseComplement (myseq))),
     sep = "\n")
COMMENT
grep CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA f000_raw_mirna.fastq | wc -l  ## at the beginning is there
grep GACCCTTTAGTGGTATTTGCACTTTACAGAAACCTAAACCCTTAGAATATTCAAGACATACTCTGGTGAGATTTTT f000_raw_mirna.fastq | wc -l 
grep TTTTTAGAGTGGTCTCATACAGAACTTATAAGATTCCCAAATCCAAAGACATTTCACGTTTATGGTGATTTCCCAG f000_raw_mirna.fastq | wc -l  ## is there at the end ... but not so much
grep AAAAATCTCACCAGAGTATGTCTTGAATATTCTAAGGGTTTAGGTTTCTGTAAAGTGCAAATACCACTAAAGGGTC f000_raw_mirna.fastq | wc -l 
grep CTGGGAAATCACCATAAACGTGAAATGTCTTTGGA f000_raw_mirna.fastq | wc -l 
grep GACCCTTTAGTGGTATTTGCACTTTACAGAAACCT f000_raw_mirna.fastq | wc -l 
grep TTTTTAGAGTGGTCTCATACAGAACTTATAAGATT f000_raw_mirna.fastq | wc -l 
grep AAAAATCTCACCAGAGTATGTCTTGAATATTCTAA f000_raw_mirna.fastq | wc -l 
grep GAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA f000_raw_mirna.fastq | wc -l 
grep CTTAGAATATTCAAGACATACTCTGGTGAGATTTTT f000_raw_mirna.fastq | wc -l 
grep ATCCAAAGACATTTCACGTTTATGGTGATTTCCCAG f000_raw_mirna.fastq | wc -l 
grep TAGGTTTCTGTAAAGTGCAAATACCACTAAAGGGTC f000_raw_mirna.fastq | wc -l 
grep CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC f000_raw_mirna.fastq | wc -l   ## is there at the end ... but not so much
grep GAAAAAAAGCAGGAAAGGTGTTCTATATATTTCGGTTCTTTAGCTTTATGAAAGTTCAATGCCATTCG f000_raw_mirna.fastq | wc -l 
grep GCTTACCGTAACTTGAAAGTATTTCGATTTCTTGGCTTTATATATCTTGTGGAAAGGACGAAAAAAAG f000_raw_mirna.fastq | wc -l   ## is there at the beginning
grep CGAATGGCATTGAACTTTCATAAAGCTAAAGAACCGAAATATATAGAACACCTTTCCTGCTTTTTTTC f000_raw_mirna.fastq | wc -l 
grep CTTTTTTTCGTCCTTTCCACAAGATATATA f000_raw_mirna.fastq | wc -l 
grep GAAAAAAAGCAGGAAAGGTGTTCTATATAT f000_raw_mirna.fastq | wc -l 
grep GCTTACCGTAACTTGAAAGTATTTCGATTT f000_raw_mirna.fastq | wc -l 
grep CGAATGGCATTGAACTTTCATAAAGCTAAA f000_raw_mirna.fastq | wc -l 
grep AAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC f000_raw_mirna.fastq | wc -l 
grep TTCGGTTCTTTAGCTTTATGAAAGTTCAATGCCATTCG f000_raw_mirna.fastq | wc -l 
grep CTTGGCTTTATATATCTTGTGGAAAGGACGAAAAAAAG f000_raw_mirna.fastq | wc -l 
grep GAACCGAAATATATAGAACACCTTTCCTGCTTTTTTTC f000_raw_mirna.fastq | wc -l 
cutadapt -g CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA -o f010_mirna_trim1.fastq f000_raw_mirna.fastq
cutadapt -a TTTTTAGAGTGGTCTCATACAGAACTTATAAGATTCCCAAATCCAAAGACATTTCACGTTTATGGTGATTTCCCAG -o f010_mirna_trim2.fastq f010_mirna_trim1.fastq
cutadapt -g GCTTACCGTAACTTGAAAGTATTTCGATTTCTTGGCTTTATATATCTTGTGGAAAGGACGAAAAAAAG         -o f010_mirna_trim3.fastq f010_mirna_trim2.fastq
cutadapt -a CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC         -o f010_mirna_trim4.fastq f010_mirna_trim3.fastq
grep CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA f010_mirna_trim4.fastq | wc -l  ## at the beginning is there
grep GACCCTTTAGTGGTATTTGCACTTTACAGAAACCTAAACCCTTAGAATATTCAAGACATACTCTGGTGAGATTTTT f010_mirna_trim4.fastq | wc -l 
grep TTTTTAGAGTGGTCTCATACAGAACTTATAAGATTCCCAAATCCAAAGACATTTCACGTTTATGGTGATTTCCCAG f010_mirna_trim4.fastq | wc -l  ## is there at the end ... but not so much
grep AAAAATCTCACCAGAGTATGTCTTGAATATTCTAAGGGTTTAGGTTTCTGTAAAGTGCAAATACCACTAAAGGGTC f010_mirna_trim4.fastq | wc -l 
grep CTGGGAAATCACCATAAACGTGAAATGTCTTTGGA f010_mirna_trim4.fastq | wc -l 
grep GACCCTTTAGTGGTATTTGCACTTTACAGAAACCT f010_mirna_trim4.fastq | wc -l 
grep TTTTTAGAGTGGTCTCATACAGAACTTATAAGATT f010_mirna_trim4.fastq | wc -l 
grep AAAAATCTCACCAGAGTATGTCTTGAATATTCTAA f010_mirna_trim4.fastq | wc -l 
grep GAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA f010_mirna_trim4.fastq | wc -l 
grep CTTAGAATATTCAAGACATACTCTGGTGAGATTTTT f010_mirna_trim4.fastq | wc -l 
grep ATCCAAAGACATTTCACGTTTATGGTGATTTCCCAG f010_mirna_trim4.fastq | wc -l 
grep TAGGTTTCTGTAAAGTGCAAATACCACTAAAGGGTC f010_mirna_trim4.fastq | wc -l 
grep CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC f010_mirna_trim4.fastq | wc -l   ## is there at the end ... but not so much
grep GAAAAAAAGCAGGAAAGGTGTTCTATATATTTCGGTTCTTTAGCTTTATGAAAGTTCAATGCCATTCG f010_mirna_trim4.fastq | wc -l 
grep GCTTACCGTAACTTGAAAGTATTTCGATTTCTTGGCTTTATATATCTTGTGGAAAGGACGAAAAAAAG f010_mirna_trim4.fastq | wc -l   ## is there at the beginning
grep CGAATGGCATTGAACTTTCATAAAGCTAAAGAACCGAAATATATAGAACACCTTTCCTGCTTTTTTTC f010_mirna_trim4.fastq | wc -l 
grep CTTTTTTTCGTCCTTTCCACAAGATATATA f010_mirna_trim4.fastq | wc -l 
grep GAAAAAAAGCAGGAAAGGTGTTCTATATAT f010_mirna_trim4.fastq | wc -l 
grep GCTTACCGTAACTTGAAAGTATTTCGATTT f010_mirna_trim4.fastq | wc -l 
grep CGAATGGCATTGAACTTTCATAAAGCTAAA f010_mirna_trim4.fastq | wc -l 
grep AAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC f010_mirna_trim4.fastq | wc -l 
grep TTCGGTTCTTTAGCTTTATGAAAGTTCAATGCCATTCG f010_mirna_trim4.fastq | wc -l 
grep CTTGGCTTTATATATCTTGTGGAAAGGACGAAAAAAAG f010_mirna_trim4.fastq | wc -l 
grep GAACCGAAATATATAGAACACCTTTCCTGCTTTTTTTC f010_mirna_trim4.fastq | wc -l 
fastqc f010_mirna_trim4.fastq
cutadapt -m 17 -M 30 -q 10 -o f020_mirna_cut.fastq f010_mirna_trim4.fastq
fastqc f020_mirna_cut.fastq
wc -l f000_raw_mirna.fastq
wc -l f020_mirna_cut.fastq
fastx_collapser -Q33 -v -i f020_mirna_cut.fastq -o f030_mirna_collapsed.fasta
grep -A 1 "Homo sapiens" mature.fa > mature_human0.fa
grep -v  "^--" mature_human0.fa > mature_human1.fa 
fasta_nucleotide_changer -i mature_human1.fa -o mature_human.fa -d
bowtie2-build mature_human.fa mature_human
bowtie2-align -x mature_human -f f030_mirna_collapsed.fasta -S f040_mirna_mapped.sam
samtools view -SH f040_mirna_mapped.sam 

emacs f040_mirna_mapped.sam
samtools view -S f040_mirna_mapped.sam > f041_mirna_mapped_nohead.sam
emacs f041_mirna_mapped_nohead.sam
wc -l f041_mirna_mapped_nohead.sam
grep -v "^@" f041_mirna_mapped_nohead.sam | wc -l
head -n 2 f030_mirna_collapsed.fasta 
head -n 1 f041_mirna_mapped_nohead.sam


samtools view -bS -o f050_mirna_mapped.bam f040_mirna_mapped.sam
samtools view -H f050_mirna_mapped.bam            ## the header
samtools view    f050_mirna_mapped.bam  | head    ## the alignment
    samtools sort f050_mirna_mapped.bam f060_mirna_mapped_sorted   ## no extension in the output prefix
    samtools index f060_mirna_mapped_sorted.bam     ## creates a .bai file     
samtools idxstats f060_mirna_mapped_sorted.bam > f070_mirna_mapped_stats.txt
head f070_mirna_mapped_stats.txt
grep hsa-let-7a-5p f041_mirna_mapped_nohead.sam | wc -l
bowtie2-align -x mature_human -N 1 -f f030_mirna_collapsed.fasta -S f040_mirna_mapped_N1.sam
bowtie2 -x mature_human -U f020_mirna_cut.fastq -S f045_mirna_cut_mapped.sam
##prepare the reference
fasta_nucleotide_changer -i mature.fa -o matureDNA.fa -d
bowtie2-build matureDNA.fa matureDNA
##align collapsed
bowtie2-align -x matureDNA -f f030_mirna_collapsed.fasta -S g040_mirna_mapped.sam
##align uncollapsed
bowtie2-align -x matureDNA -U f020_mirna_cut.fastq -S g045_mirna_cut_mapped.sam
