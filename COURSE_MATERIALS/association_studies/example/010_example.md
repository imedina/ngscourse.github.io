% [NGS data analysis course](http://ngscourse.github.io/)
% __Title of the practical__
% _(updated 23-02-2014)_

<!-- COMMON LINKS HERE -->

[fastqc]: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/ "notes on hover"
[bwa]: http://bio-bwa.sourceforge.net/ "notes BWA"


Preliminaries
================================================================================


Software used in this practical:
--------------------------------

- [FastQC] : (SPACE BEFORE THE COLON) Explain ...
- [BWA software][BWA] : Explain with a sentence.


File formats explored:
----------------------

FastQ:

- [Wikipedia](http://en.wikipedia.org/wiki/FASTQ_format)
- more


SAM/BAM

- links


Data used in this practical
-------------------------------

- [mirbase_mature.fa](../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa): mature micro RNAs downloaded form mirbase

You can download them or copy them to your ``data`` directory for the practical

<!-- clean directory
    rm -r data
-->

    mkdir data
	cd data
	cp ../../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa .


\ 

Find all data files for the course here: [COURSE_EXAMPLE_DATA](../../../COURSE_EXAMPLE_DATA)



Exercise
================================================================================

The file **f000_raw_mirna.fastq** in the data folder contains reads form a microRNA sequencing experiment.

Use `wc` to count how many reads there are in the file (remember you have to divide by 4)

    wc -l f000_raw_mirna.fastq


Raw Data Preprocessing
--------------------------------------------------------------------------------

Use fastqc to explore the quality of the data:

    fastqc f000_raw_mirna.fastq


Find the _Overrepresented sequences_ in [mirbase][mirbase-search].


There are 2 known adapters used in this experiment: 

    CTGGGAAATCACCATAAACGTGAAATGTCTTTGGATTTGGGAATCTTATAAGTTCTGTATGAGACCACTCTAAAAA
    CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC

Use R-Bioconductor to compute their reverse, complementary and reverse complementary.

    library (Biostrings)
    myseq <- DNAString ("CTTTTTTTCGTCCTTTCCACAAGATATATAAAGCCAAGAAATCGAAATACTTTCAAGTTACGGTAAGC")
    reverse (myseq)
    complement (myseq)
    reverseComplement (myseq)



Further work
================================================================================

Some ideas

