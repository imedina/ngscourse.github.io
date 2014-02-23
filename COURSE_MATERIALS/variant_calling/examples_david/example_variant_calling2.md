% NGS: Variant Calling II
% [David Montaner](http://www.dmontaner.com/)
% (26-11-2013)

<!--
Clean the starting dataset
================================================================================
#    rm -r data/*
#    cp data0/f* data/
#    cd data
-->

Preliminaries
================================================================================

We carry on with the Variant Calling practical (19-11-2013)


## Software used in this practical

- [BWA][bwa-site] (Burrows-Wheeler Aligner): A software package for mapping low-divergent sequences against a large reference genome.
- [tabix][tabix-site]: Compresses and indexes TAB-delimited files. Useful for GFF, GTF, BED and VCF files. See paper [here][tabix-paper1].
- [IGV][igv-site] (Integrative Genomics Viewer): a visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations. Download from [here][tabix-download].
  
[bcf-format-1000ge]:http://www.1000genomes.org/wiki/analysis/variant-call-format/bcf-binary-vcf-version-2

<!-- Tool References -->

[fastqc-site]:http://www.bioinformatics.babraham.ac.uk/projects/fastqc
[cutadapt-site]:http://code.google.com/p/cutadapt
[fastx-site]:http://hannonlab.cshl.edu/fastx_toolkit
[bowtie2-site]:http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
[samtools-site]:http://samtools.sourceforge.net
[picard-site]:http://picard.sourceforge.net
[tophat-site]:http://tophat.cbcb.umd.edu
[bedtools-site]:http://code.google.com/p/bedtools/
[gatk-site]:http://www.broadinstitute.org/gatk/
[bwa-site]:http://bio-bwa.sourceforge.net/     "Burrows-Wheeler Aligner"
[dwgsim-site]:http://sourceforge.net/apps/mediawiki/dnaa/index.php?title=Whole_Genome_Simulation
[cufflinks-site]:http://cufflinks.cbcb.umd.edu/

[tabix-site]:http://samtools.sourceforge.net/tabix.shtml
[tabix-download]:http://sourceforge.net/projects/samtools/files/tabix/
[tabix-paper1]:http://bioinformatics.oxfordjournals.org/content/27/5/718.full

[igv-site]:http://www.broadinstitute.org/igv/

[vcftools-download]:http://sourceforge.net/projects/vcftools/



File formats:
-------------

- FastQ: see [Wikipedia][fastq-format-wikipedia] and [NAR 2010][fastq-format-nar] specifications.
- SAM/BAM (Sequence Alignment Map): see [SAMtools][sam-format-samtools] and [UCSC][sam-format-ucsc] specifications.
- GTF: see [Ensembl][gtf-format-ensembl] and [UCSC][gtf-format-ucsc] specifications.
- VCF Variant Call Format: see [1000 Genomes][vcf-format-1000ge] and [Wikipedia][vcf-format-wikipedia] specifications.

- [BCF2][bcf-format-1000ge] is a binary compressed file equivalent of a VCF. It can be indexed with [tabix][tabix-site] and efficiently handled.


<!-- File Format References -->

[fastq-format-wikipedia]:http://en.wikipedia.org/wiki/FASTQ_format
[fastq-format-nar]:http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2847217
[sam-format-samtools]:http://samtools.sourceforge.net/SAM1.pdf
[sam-format-ucsc]:http://genome.ucsc.edu/goldenPath/help/bam.html
[gtf-format-ensembl]:http://www.ensembl.org/info/website/upload/gff.html
[gtf-format-ucsc]:http://genome.ucsc.edu/FAQ/FAQformat.html#format4
[vcf-format-1000ge]:http://www.1000genomes.org/wiki/Analysis/Variant%20Call%20Format/vcf-variant-call-format-version-41
[vcf-format-wikipedia]:http://en.wikipedia.org/wiki/Variant_Call_Format
[all-formats-ucsc]:http://genome.ucsc.edu/FAQ/FAQformat.html
[bcf-format-1000ge]:http://www.1000genomes.org/wiki/analysis/variant-call-format/bcf-binary-vcf-version-2




Exercise
================================================================================


Compress the VCF file using tabix
---------------------------------

First we need to compress the VCF file using the bgzip program:

    bgzip f090_snp_filtered.vcf


Create a tabix index for the bgzip-compressed file:

    tabix -p vcf f090_snp_filtered.vcf.gz 


Now you can easily access to the lines of the VCF file by their position:

    tabix f090_snp_filtered.vcf.gz 20:131785-200000
	
You can access to several regions at a time:
	
    tabix f090_snp_filtered.vcf.gz 20:131785-300000 20:400000-500000
	
But region definition needs to be well defined	

    tabix f090_snp_filtered.vcf.gz 20:400000-500000
    tabix f090_snp_filtered.vcf.gz 20:500000-400000  #no output


You can use tabix to list chromosomes in the VCF file:

    tabix -l f090_snp_filtered.vcf.gz


You can go back to the uncompressed VCF file doing:

    tabix -d f090_snp_filtered.vcf.gz



Visualize the BAM and the VCF files using IGV
---------------------------------------------

Open IGV and load the files. Remember you are working with chromosome 20

