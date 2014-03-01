% [NGS data analysis course](http://ngscourse.github.io/)
% __Variant calling__
% _(updated 28-02-2014)_

<!-- COMMON LINKS HERE -->

[BWA]: http://bio-bwa.sourceforge.net/ "BWA"
[SAMTools]: http://samtools.sourceforge.net/ "samtools"
[Picard]: http://picard.sourceforge.net/ "Picard"
[gatk-site]: http://www.broadinstitute.org/gatk/ "GATK"

Preliminaries
================================================================================

Software used in this practical:
--------------------------------

- [BWA] : BWA is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.
- [SAMTools] : SAM Tools provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format.
- [Picard] : Picard comprises Java-based command-line utilities that manipulate SAM files, and a Java API (SAM-JDK) for creating new programs that read and write SAM files.
- [GATK] : (Genome Analysis Toolkit): A package to analyze next-generation re-sequencing data, primary focused on variant discovery and genotyping.


File formats explored:
----------------------

- [SAM](http://samtools.sourceforge.net/SAMv1.pdf)
- [BAM](http://www.broadinstitute.org/igv/bam)
- VCF Variant Call Format: see [1000 Genomes][vcf-format-1000ge] and [Wikipedia][vcf-format-wikipedia] specifications.


Data used in this practical
-------------------------------

- [mirbase_mature.fa](../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa): mature micro RNAs downloaded form mirbase

You can download them or copy them to your ``data`` directory for the practical

<!-- clean directory

    rm -r data
    mkdir data
    cd data
    cp ../../../../COURSE_EXAMPLE_DATA/f010_mirbase_mature.fa .
-->

\ 

Find all data files for the course here: [COURSE_EXAMPLE_DATA](../../../COURSE_EXAMPLE_DATA)



Exercise 1: Variant calling with paired-end data
================================================================================

<!-- Go to the directory where you have downoaded your data: 

    cd my_visual_data_dir  

In the following **folder** you wil find mapped sequencing data from a CEU trio (father, mother and child) from the 1000 Genomes Project:

    cd ~/ngscourse.github.io/COURSE_EXAMPLE_DATA/visualization/example_1
    
    ll

These datasets contain reads only for the [GABBR1](http://www.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG00000204681;r=6:29523406-29601753) gene.
-->

1. Prepare reference genome: generate the BWA index
--------------------------------------------------------------------------------

Use ``BWA`` to index the the reference genome:

    bwa index -a bwtsw f000-reference.fa

where ``-a bwtsw`` specifies that we want to use the indexing algorithm that is capable of handling the whole human genome.


Use ``SAMTools`` to generate the fasta file index:

    samtools faidx f000-reference.fa

This creates a file called f000-reference.fa.fai, with one record per line for each of the contigs in the FASTA reference file.

Generate the sequence dictionary using ``Picard``:

    java -jar CreateSequenceDictionary.jar REFERENCE=f000-reference.fa OUTPUT=f000-reference.dict


2. Mark duplicates (using Picard)
--------------------------------------------------------------------------------

Run the following **Picard** command to mark duplicates:

    java -jar MarkDuplicates.jar INPUT=paired_end.bam OUTPUT=paired_end_noDup.bam METRICS_FILE=metrics.txt

This creates a sorted BAM file called ``paired_end_noDup.bam`` with the same content as the input file, except that any duplicate reads are marked as such. It also produces a metrics file called ``metrics.txt`` containing (can you guess?) metrics.

Run the following **Picard** command to index the new BAM file:

    java -jar BuildBamIndex.jar INPUT=paired_end_noDup.bam

Q1. How many reads are removed as duplicates from the files (hint view the on-screen output from the two commands)?
    

3. Local realignment around INDELS (using GATK)
--------------------------------------------------------------------------------

There are 2 steps to the realignment process:

1. Create a target list of intervals which need to be realigned

    java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator -R f000-reference.fa -I paired_end_noDup.bam -known gold_indels.vcf -o forIndelRealigner.intervals
    java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator -R f000-reference.fa -I paired_end_noDup.bam -o forIndelRealigner.intervals

2. Perform realignment of the target intervals

    java -jar GenomeAnalysisTK.jar -T IndelRealigner -R reference.fa -I paired_end_noDup.bam -targetIntervals forIndelRealigner.intervals -o realigned_reads.bam 


4. Loading and browsing files
--------------------------------------------------------------------------------

- Go to ``File`` --> ``Load from file...``  
Select NA12878_child.bam, NA12891_dad.bam and NA12892_mom.bam

**Steps:**

1. Enter the name of our gene (_**GABBR1**_) in the search box and hit ``Go``.
2. Zoom in until you find some SNPs - they might be in exons or introns.
3. Identify at least one example of a short insertion variant and deletion arround exon 4.
4. Load and look at the SNP track: ``File`` --> ``Load from server`` --> ``Annotations`` --> ``Variants and Repeats`` --> ``dbSNP``


