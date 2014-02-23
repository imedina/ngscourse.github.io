% [NGS data analysis course](http://ngscourse.github.io/)
% __miRNA Mapping__
% _(updated 22-10-2013)_

<!-- COMMON LINKS HERE -->

[fastqc]: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/ "notes on hover"
[bwa]: http://bio-bwa.sourceforge.net/ "notes BWA"



Preliminaries
================================================================================


Software used in this practical
-------------------------------

- [FastQC][FastQC-site]: A quality control tool for high throughput sequence data.
- [cutadapt][cutadapt-site]: A tool that removes adapter sequences from DNA sequencing reads.
- [FASTX-Toolkit][fastx-site]: A collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing.
- [Bowtie 2][bowtie2-site]: Tool for aligning sequencing reads to long reference sequences.

File formats: FastQ
-------------------

See :

- [Wikipedia][fastq-format-wikipedia].
- [NAR 2010][fastq-format-nar].



Exercise
================================================================================

The file **f000_raw_mirna.fastq** in the data folder contains reads form a microRNA sequencing experiment.

<!--
    cd data
-->

Use `wc` to count how many reads there are in the file (remember you have to divide by 4)

    wc -l f000_raw_mirna.fastq


Raw Data Preprocessing
--------------------------------------------------------------------------------

Use fastqc to explore the quality of the data:

    fastqc f000_raw_mirna.fastq


Find the _Overrepresented sequences_ in [mirbase][mirbase-search].


There are 2 known adapters used in this experiment: 

<!--
    <<"COMMENT"
-->

    CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA
    CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC

<!--
    COMMENT
-->



Use R-Bioconductor to compute their reverse, complementary and reverse complementary.

Hint:
<!--
    <<"COMMENT"
-->

    library (Biostrings)
    myseq <- DNAString ("CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC")
    reverse (myseq)
    complement (myseq)
    reverseComplement (myseq)

<!--
    cat (c (as.character (myseq),
            as.character (reverse (myseq)),
            as.character (complement (myseq)),
            as.character (reverseComplement (myseq))),
         sep = "\n")
-->

<!--
    COMMENT
-->



Use grep form Linux shell to find out which of the versions of the adapter is in your data.


<!--

Adapter 1
----------

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


Adapter 2
----------

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

-->

Use cutadapt to make an adapter trimming of the reads. Check the options:

+ **-a** for adapter to the 3' end.
+ **-g** for adapter to the 5' end.


command:  

    cutadapt -g CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA -o f010_mirna_trim1.fastq f000_raw_mirna.fastq
    
    cutadapt -a TTTTTAGAGTGGTCTCATACAGAACTTATAAGATTCCCAAATCCAAAGACATTTCACGTTTATGGTGATTTCCCAG -o f010_mirna_trim2.fastq f010_mirna_trim1.fastq
    
    cutadapt -g GCTTACCGTAACTTGAAAGTATTTCGATTTCTTGGCTTTATATATCTTGTGGAAAGGACGAAAAAAAG         -o f010_mirna_trim3.fastq f010_mirna_trim2.fastq
    
    cutadapt -a CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC         -o f010_mirna_trim4.fastq f010_mirna_trim3.fastq
    


<!--

Adapter 1
----------

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


Adapter 2
----------

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

-->

Check the quality again using fastqc:

    fastqc f010_mirna_trim4.fastq


Use cutadapt to filter reads by quality and length. Check the options:

+ **-q** quality cutoff.
+ **-m** minimum length.
+ **-M** maximum length.
  
  
    cutadapt -m 17 -M 30 -q 10 -o f020_mirna_cut.fastq f010_mirna_trim4.fastq


And check quality again using fastqc

    fastqc f020_mirna_cut.fastq

Find again the _Overrepresented sequences_ in [mirbase][mirbase-search].

Count how many reads are left for the analysis (divide by 4)

    wc -l f000_raw_mirna.fastq
    wc -l f020_mirna_cut.fastq


Make a non-redundant dataset
--------------------------------------------------------------------------------

Use fastx to to create a non-redundant fasta file with the reads
by collapsing identical sequences.

    fastx_collapser -Q33 -v -i f020_mirna_cut.fastq -o f030_mirna_collapsed.fasta

The parameter `-Q33` indicates that we are using Illumina encoded quality scores, not Sanger encoding.

See the first lines of the new file `030_mirna_collapsed.fasta`

- ¿Can you find the number of times each read is replicated?
- Find the most common sequence. Find it in the results form the FastQC analysis.


Format miRBase
--------------------------------------------------------------------------------

Download the __mature__ microRNA sequences form the [miRBase web page][mirbase-ftp].

Filter the human microRNAs. Generally you will write an script for this kind of task: 
Python, Perl, R-Bioconductor... 
but in this very easy case you can directly use Linux shell command `grep`.

    grep -A 1 "Homo sapiens" mature.fa > mature_human0.fa
    grep -v  "^--" mature_human0.fa > mature_human1.fa 

where `-A` indicates how many lines should be returned after the line matching the pattern.
`-A` introduces some separator lines (`--`) that are removed in the `grep -v` line.


Observe that the database we downloaded form miRBase is a database of __RNA__ 
we will need to convert it into a __DNA__ fasta file.
You can use fastx for this purpose.

    fasta_nucleotide_changer -i mature_human1.fa -o mature_human.fa -d


Map against miRBase using bowtie2
--------------------------------------------------------------------------------

Fist we need to __build an index__ for bowtie:

    bowtie2-build mature_human.fa mature_human
    

And now we can run the __alignment step__:

    bowtie2-align -x mature_human -f f030_mirna_collapsed.fasta -S f040_mirna_mapped.sam

<!-- bowtie2 AND bowtie2-align ARE THE SAME -->


Explore the __SAM__ file that has been created. 
[Here][sam-format-samtools] 
you can find the SAM format specifications. 
More information is available in [SAMtools home page][samtools-site]. 


Homework
================================================================================


- Increase the parameter `-N` in bowtie and see whether more reads align to the reference of miRNAs.   
<!--
```
    bowtie2-align -x mature_human -N 1 -f f030_mirna_collapsed.fasta -S f040_mirna_mapped_N1.sam
```
-->

- Align the uncollapsed fastq file against the human microRNAs.   
<!--
```
    bowtie2 -x mature_human -U f020_mirna_cut.fastq -S f045_mirna_cut_mapped.sam
```
-->

- Align the collapsed and uncollapsed files against all miRNAs in miRBase.   
<!--
```
    ##prepare the reference
    fasta_nucleotide_changer -i mature.fa -o matureDNA.fa -d
    bowtie2-build matureDNA.fa matureDNA

    ##align collapsed
    bowtie2-align -x matureDNA -f f030_mirna_collapsed.fasta -S g040_mirna_mapped.sam
    
    ##align uncollapsed
    bowtie2-align -x matureDNA -U f020_mirna_cut.fastq -S g045_mirna_cut_mapped.sam
```
-->

<!-- ---------------------------------------------------------------------------
References
================================================================================
-->

[fastqc-site]:http://www.bioinformatics.babraham.ac.uk/projects/fastqc
[cutadapt-site]:http://code.google.com/p/cutadapt
[fastx-site]:http://hannonlab.cshl.edu/fastx_toolkit
[bowtie2-site]:http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
[samtools-site]:http://samtools.sourceforge.net

[fastq-format-wikipedia]:http://en.wikipedia.org/wiki/FASTQ_format
[fastq-format-nar]:http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2847217
[sam-format-samtools]:http://samtools.sourceforge.net/SAM1.pdf


[mirbase-search]:http://www.mirbase.org/search.shtml
[mirbase-ftp]:http://www.mirbase.org/ftp.shtml
