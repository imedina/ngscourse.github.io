% NGS: Variant Calling III
% [David Montaner](http://www.dmontaner.com/)
% (28-11-2013)

<!--
Clean the starting dataset
================================================================================
#    rm -r data/*
#    cp data0/f* data/
#    cd data
-->

Preliminaries
================================================================================

We carry on with the Variant Calling practical (19-11-2013 and 26-11-2013)


Software used in this practical:
--------------------------------

- [tabix][tabix-site]: Compresses and indexes TAB-delimited files. Useful for GFF, GTF, BED and VCF files. See paper [here][tabix-paper1].
- [VCFtools][vcftools-site]: A package for working with VCF files: merging, comparing, annotating ...
    

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

[vcftools-site]:http://vcftools.sourceforge.net/index.html
[vcftools-download]:http://sourceforge.net/projects/vcftools/
[vcftools-install]:http://vcftools.sourceforge.net/docs.html#install



File formats:
-------------

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


Install
-------

Pay attention to the __PERL5LIB__ variable required for the installation. See [VCFtools install section][vcftools-install].





Exercise
================================================================================


We will use __VCFtools__ to perform some common computations over VCF files.



Extract parts of the VCF file according to chromosome position:
--------------------------------------------------------------------------------

    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f091_part --chr 20 --from-bp 131785 --to-bp 265205 --recode


Get just the __allele frequency__ from the VCF file...

- from some positions:

    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f092_part_freq --chr 20 --from-bp 131785 --to-bp 265205 --freq

- from the whole file:

    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f092_all_freq --freq


You can also extract the raw allele counts instead the frequency:

    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f092_all_count --counts




Filter by flags
--------------------------------------------------------------------------------

We can use __VCFtools__  to filter the rows in the VCF file according to the _FILTER_ filed.

We can for instance filter the _low confidence_ calls in our VCF file (flagged as "LowConf"). 

We could find such rows using the Linux command `grep`:

    grep "LowConf" f090_snp_filtered.vcf


but this does not maintain the VCF file structure. We my prefer to __print__ them in the shell doing:

    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f093_lowconf --keep-filtered LowConf --recode-to-stream


or to save them into a new file by:
    
    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f094_lowconf --keep-filtered LowConf --recode
    
¿What happens if you do not use the options `--recode-to-stream` or `--recode`?


But usually we will be more keen on getting a new file just with the variants which _pass_ the filtering:

    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f095_pass --remove-filtered-all --recode

    grep "LowConf" f095_pass.recode.vcf




Filtering based on qualities
--------------------------------------------------------------------------------

We can select the variants with high quality:

    vcftools --gzvcf f090_snp_filtered.vcf.gz --out f096_qual --minQ 40 --recode




Include known identifiers for our variants
--------------------------------------------------------------------------------

We can use VCFtools to include variant names in the _ID_ column of the VCF file.

We can for instance code the information for the know SNPs in a file which will look like this:

    #CHR	FROM	TO	ANNOTATION
    20	131785	131785	mySNPid1
    20	235987	235987	mySNPid3
    20	238627	238627	mySNPid4
    20	265205	265205	mySNPid5


Then we can include this information in our VCF file.

First we will compress the annotation file to be used with tabix:

    bgzip mock_snp_annotation.txt

And index it:

    tabix -s 1 -b 2 -e 3 mock_snp_annotation.txt.gz

¿What do they mean the parameters `-s`, `-b` and `-e`?

Then we can use the command `vcf-annotate` from VCFtools for inserting SNP IDs in the VCF file:

    cat f090_snp_filtered.vcf | vcf-annotate -a mock_snp_annotation.txt.gz -c CHROM,FROM,TO,ID > f100_snp_annotated.vcf

Notice that the input vcf file needs to be uncompressed... use `bgzip` to decompress the file before you call `vcf-annotate`.

¿What does it mean the parameter `-c`?
    

Include GENE annotations
--------------------------------------------------------------------------------

We can use gen chromosome position to annotate our VCF file.

Gen coordinates may be codded in a file which will look like this:

    #CHR	FROM	TO	ANNOTATION
    20	131785	235987	myGENEid1
    20	238627	265205	myGENEid2


Prepare the file to be used by tabix:

    bgzip mock_gen_annotation.txt
    tabix -s 1 -b 2 -e 3 mock_gen_annotation.txt.gz

Now we can use VCFtools `vcf-annotate` command to include the annotation into the VCF file:

    cat f100_snp_annotated.vcf | vcf-annotate -a mock_gen_annotation.txt.gz -d key=INFO,ID=GN,Number=1,Type=String,Description='Gene Name' -c CHROM,FROM,TO,INFO/GN > f110_snp_and_gene_annotated.vcf


