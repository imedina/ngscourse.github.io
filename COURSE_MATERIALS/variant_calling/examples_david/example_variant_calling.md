% NGS: Variant Calling
% [David Montaner](http://www.dmontaner.com/)
% (19-11-2013)

<!--
Clean the starting dataset
================================================================================
    rm -r data/*
    cp data0/f* data/
    cd data
-->



Preliminaries
================================================================================

## Software used in this practical


- [BWA][bwa-site] (Burrows-Wheeler Aligner): A software package for mapping low-divergent sequences against a large reference genome.
- [Picard][picard-site]: Java-based command-line utilities to manipulate SAM files.
- [GATK][gatk-site] (Genome Analysis Toolkit): A package to analyze next-generation re-sequencing data, primary focused on variant discovery and genotyping.

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


File formats:
-------------

- FastQ: see [Wikipedia][fastq-format-wikipedia] and [NAR 2010][fastq-format-nar] specifications.
- SAM/BAM (Sequence Alignment Map): see [SAMtools][sam-format-samtools] and [UCSC][sam-format-ucsc] specifications.
- GTF: see [Ensembl][gtf-format-ensembl] and [UCSC][gtf-format-ucsc] specifications.
- VCF Variant Call Format: see [1000 Genomes][vcf-format-1000ge] and [Wikipedia][vcf-format-wikipedia] specifications.

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



Data 
================================================================================

Our data analysis will start with a reference genome in fasta format: 

- f000_reference.fa


In this case it is the chromosome 20 of the human genome; run:

    grep ">" f000_reference.fa


and two fastq files from a _paired-end_ experiment:

- f010_reads1.fastq
- f010_reads2.fastq



Mapping using BWA
=================================================================================

First we have to create the index

    bwa index -a bwtsw f000_reference.fa


And then we align each of the files.
This step is done separately for each file; 
it will be the same for paired end or single end schemes.

    bwa aln -f f020_reads1.sai f000_reference.fa f010_reads1.fastq
    bwa aln -f f020_reads2.sai f000_reference.fa f010_reads2.fastq


Now we combine the two SAM files in a combined one (_paired-end_ protocol):

    bwa sampe -f f030_aligned.sam -r '@RG\tID:myID\tSM:mySample' f000_reference.fa f020_reads1.sai f020_reads2.sai f010_reads1.fastq f010_reads2.fastq


Convert file to binary BAM format:

    samtools view -bS f030_aligned.sam > f040_unordered_aligned.bam


Order by chromosome position:
	
    samtools sort f040_unordered_aligned.bam f050_aligned

Index the BAM file:

    samtools index f050_aligned.bam

<!--
##AddOrReplaceReadGroups ?? 
-->



Variant Calling
================================================================================

<!--

COMO INTRODUCIR LA VARIABLE RG segun Nacho: REVISAR ESTO

GATK preliminaries

Add RG to BAM file using PICARD TOOLS (http://picard.sourceforge.net/)

Mark duplicates with PICARD

java -jar MarkDuplicates.jar INPUT=sorted_reads.bam OUTPUT=dedup_reads.bam 
You can check if RG is already present

samtools view BAM_FILE -H | head 
Adding RG to BAM file:

java -jar AddOrReplaceReadGroups.jar I=/home/imedina/courses/lisbon_mda13/alignment/bams/bwa/hq-test1_se.bam O=/tmp/hq-test1_se.bam RGLB=Illumina RGPL=Illumina RGPU=run RGSM=s1

-->








GATK preliminaries
------------------

Create a sequence dictionary for the reference using [Picard Tools](#software-used-in-this-practical).

    ## this is just an example path to picard java programs
    picard_path="/home/dmontaner/bin/picard-tools-1.99/picard-tools-1.99"
	
    java -jar $picard_path/CreateSequenceDictionary.jar REFERENCE=f000_reference.fa OUTPUT=f000_reference.dict


Create an index for the reference using __samtools__:

    samtools faidx f000_reference.fa


Run __GATK__ CountReads to test that all formats are right:

    ## this is just an example path
    gatk_path="/home/dmontaner/bin/GenomeAnalysisTK-2.7-4-g6f46d11"
	
    java -jar $gatk_path/GenomeAnalysisTK.jar -T CountReads -R f000_reference.fa -I f050_aligned.bam



<!-- GATK Preprocessing -->

InDel Realignment
-----------------

First we create a target list of intervals which need to be realigned:

    java -jar $gatk_path/GenomeAnalysisTK.jar -T RealignerTargetCreator -R f000_reference.fa -I f050_aligned.bam -o f060_intervals2realign_aligned.list

<!--
Revise:
-I dedup_aligned.bam \ 
-L 20 \ 
-known gold_indels.vcf \ 
-->


Then we perform a realignment of the selected intervals: 

    java -jar $gatk_path/GenomeAnalysisTK.jar -T IndelRealigner -R f000_reference.fa -I f050_aligned.bam -targetIntervals f060_intervals2realign_aligned.list -o f070_realigned_aligned.bam


<!--
Base Recalibration
------------------

parece que el bam esta malformado::: faltara lo de recomprimirlo

  GenomeAnalysisTK.jar -T BaseRecalibrator -R f000_reference.fa -I f070_realigned_aligned.bam -knownSites 0_dbsnp_chr2.vcf -o f080_recalibration.table

  GenomeAnalysisTK.jar -T BaseRecalibrator -R f000_reference.fa -I f070_realigned_aligned.bam -knownSites mi.vcf -o f080_recalibration.table

  GenomeAnalysisTK.jar -T BaseRecalibrator -R f000_reference.fa -I f070_realigned_aligned.bam -knownSites mi.vcf -o f080_recalibration.table

  GenomeAnalysisTK.jar -T BaseRecalibrator -R f000_reference.fa -I f070_realigned_aligned.bam -knownSites /home/dmontaner/documentos/PRESENTACIONES/CursosBioinformatica/2013_09_cambridge/bundle/2.3/b37/dbsnp_137.b37.vcf -o 8_recalibration.table
-->


<!--
-knownSites bundle/hg18/dbsnp_132.hg18.vcf \
-knownSites another/optional/setOfSitesToMask.vcf \
-->



GATK Variant Discovery
----------------------

SNP calling 

    java -jar $gatk_path/GenomeAnalysisTK.jar -T UnifiedGenotyper -R f000_reference.fa -I f070_realigned_aligned.bam -glm SNP -o f080_snp_variants.vcf

<!--
-L bed file option
-->


INDEL calling 

    java -jar $gatk_path/GenomeAnalysisTK.jar -T UnifiedGenotyper -R f000_reference.fa -I f070_realigned_aligned.bam -glm INDEL -o f080_indel_variants.vcf

<!--
GATK Variant Data Analysis
--------------------------
-->



Introduce filters in the VCF file
---------------------------------

Example: filter SNPs with low confidence calling (QD < 12.0) and flag them as "LowConf".

<!--
QD:"Variant Confidence/Quality by Depth">
-->

    java -jar $gatk_path/GenomeAnalysisTK.jar -T VariantFiltration -R f000_reference.fa -V f080_snp_variants.vcf --filterExpression "QD < 12.0" --filterName "LowConf" -o f090_snp_filtered.vcf

