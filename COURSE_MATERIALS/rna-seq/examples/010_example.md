% [NGS data analisis course](http://ngscourse.github.io/)
% __Quality control & adapter trimming example__
% _(updated 05-11-2013)_

<!-- COMMON LINKS -->

Preliminaries
================================================================================


Software used in this practical
-------------------------------

- [FastQC][FastQC-site]: A quality control tool for high throughput sequence data.
- [cutadapt][cutadapt-site]: A tool that removes adapter sequences from DNA sequencing reads.
- [FASTX-Toolkit][fastx-site]: A collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing.
- [Bowtie 2][bowtie2-site]: Tool for aligning sequencing reads to long reference sequences.
- [SAMtools][samtools-site]: Tool for aligning sequencing reads to long reference sequences.

Data used in this practical
-------------------------------

- [mirbase_mature.fa](../../../COURSE_EXAMPLE_DATA/mirbase_mature.fa): mature micro RNAs downloaded form mirbase

You can download them or copy them to your ``data`` directory for the practical

<!-- clean directory
    rm -r data
-->

    mkdir data
	cd data
	cp ../../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa .


\ 
Find all data files for the course here: [COURSE_EXAMPLE_DATA](../../../COURSE_EXAMPLE_DATA)



File formats:
-------------

FastQ:

- [Wikipedia][fastq-format-wikipedia].
- [NAR 2010][fastq-format-nar].


SAM/BAM

- [SAMtools][sam-format-samtools].



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



Use cutadapt to make an adapter trimming of the reads. Check the options:

+ **-a** for adapter to the 3' end.
+ **-g** for adapter to the 5' end.


command:  

    cutadapt -g CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA -o f010_mirna_trim1.fastq f000_raw_mirna.fastq
    cutadapt -a TTTTTAGAGTGGTCTCATACAGAACTTATAAGATTCCCAAATCCAAAGACATTTCACGTTTATGGTGATTTCCCAG -o f010_mirna_trim2.fastq f010_mirna_trim1.fastq
    cutadapt -g GCTTACCGTAACTTGAAAGTATTTCGATTTCTTGGCTTTATATATCTTGTGGAAAGGACGAAAAAAAG         -o f010_mirna_trim3.fastq f010_mirna_trim2.fastq
    cutadapt -a CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC         -o f010_mirna_trim4.fastq f010_mirna_trim3.fastq


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



Use SAMtools to explore the alignment
--------------------------------------------------------------------------------

The file `f040_mirna_mapped.sam` is a text file. 
You can open it with a text editor or visualize it in the shell using commands such as `less`, `head` or `tail`.

The SAM (Sequence Alignment/Map) format is described [here][sam-format-samtools].
It is basically a TAB-delimited file with an optional __header section__ and an __alignment section__.

The alignment of each read is described in a row of the file __11 fields__:

- QNAME: read name
- FLAG: bitwise flag (See [here](http://picard.sourceforge.net/explain-flags.html) for interpretation)
- RNAME: chromosome
- POS: leftmost genomic position
- MAPQ:	mapping quality ([Phred scale][phred-quality-score-wikipedia])
- CIGAR: CIGAR string (gaps, clipping)
- RNEXT: paired read name
- PNEXT: paired read position
- TLEN: total length of template
- SEQ: read base sequence
- QUAL: read base quality

We can use [SAMtools][samtools-man] to explore and analyze the results of our mapping.
Read the [SAMtools manual][samtools-man] for details on the available tools.


You can use samtools to extract the header of the SAM file: 

    samtools view -SH f040_mirna_mapped.sam 


Or the alignment section without the header:
	
    emacs f040_mirna_mapped.sam
    samtools view -S f040_mirna_mapped.sam > f041_mirna_mapped_nohead.sam
    emacs f041_mirna_mapped_nohead.sam


Or the number of alignment rows of the SAM file:

    wc -l f041_mirna_mapped_nohead.sam


You could alternatively use `grep` instead of SAMtools to count the number of alignments:

	grep -v "^@" f041_mirna_mapped_nohead.sam | wc -l


--------------------------------------------------------------------------------


Remember the fasta file with the reads we aligned :

    head -n 2 f030_mirna_collapsed.fasta 

And find the read names in the sam file:

    head -n 1 f041_mirna_mapped_nohead.sam
	

--------------------------------------------------------------------------------


The SAM file is a text format. 
It may be transformed into a binary format using SAMtools. 
The resulting file is called BAM file.
The binary format is desirable in order to speed up computations and efficiency.
It is required by some of the tools in SAMtools and in many third-party software.


Transform to BAM format:
	
    samtools view -bS -o f050_mirna_mapped.bam f040_mirna_mapped.sam

you can now still access to all the information in the file as before

    samtools view -H f050_mirna_mapped.bam            ## the header
    samtools view    f050_mirna_mapped.bam  | head    ## the alignment

but now you will not be able to read it with text editors, or shell commands as `less`, `head` or `tail`.


--------------------------------------------------------------------------------


The BAM files can be prepared for efficient computation by:

- __Sorting__ the alignments in them

        samtools sort f050_mirna_mapped.bam f060_mirna_mapped_sorted   ## no extension in the output prefix

- __Indexing__ the file.

        samtools index f060_mirna_mapped_sorted.bam     ## creates a .bai file     


--------------------------------------------------------------------------------


We can now get some statistics about our mapping

    samtools idxstats f060_mirna_mapped_sorted.bam > f070_mirna_mapped_stats.txt


`idxstats` produces a TAB delimited file each line consisting of 

- reference sequence name
- sequence length
- number of mapped reads
- unmapped reads


You can check that the number of reads assigned to the to the first sequence is correct:

    head f070_mirna_mapped_stats.txt
    grep hsa-let-7a-5p f041_mirna_mapped_nohead.sam | wc -l




<!--

We now have a sorted BAM file called ec_snp.sorted.bam. 
Sorted BAM is a useful format because the alignments are both compressed, 
which is convenient for long-term storage, 
and sorted, which is convenient for variant discovery. 
Finally, we call variants from the Sorted BAM:

#    samtools mpileup -f f030_mirna_collapsed.fasta f060_mirna_mapped_sorted.bam > f070_mirna_pileup.bcf
-->



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

[samtools-man]:http://samtools.sourceforge.net/samtools.shtml

[phred-quality-score-wikipedia]:http://en.wikipedia.org/wiki/Phred_quality_score
