% [NGS data analysis course](http://ngscourse.github.io/)
% __Variant annotation__
% _(updated 23-02-2014)_


<!--
Clean the starting dataset
================================================================================
#    rm -r data/*
#    cp data0/f* data/
#    cd data
-->

Introduction
================================================================================


Once variants have been called in our dataset, 
data from many different sources may be pulled to filter 
the most important of those variants according to our experiment.


See [Ensembl Variation data] (http://www.ensembl.org/info/genome/variation/predicted_data.html)


Two of the most used filters for our variants are SIFT and PolyPhen.


SIFT
----

Sorting Intolerant from Tolerant (SIFT) predicts whether an amino acid substitution affects protein function
and thus is likely to have a phenotypic effect.

SIFT prediction is based on the degree of conservation of amino acid residues in sequence alignments derived from closely related sequences, 

See [SIFT site][sift-site] for details.


<!-- References -->
[sift-site]:http://sift.jcvi.org/
[polyphen-site]:http://genetics.bwh.harvard.edu/pph2/


PolyPhen
--------

Polymorphism Phenotyping (PolyPhen-2) is a software tool which predicts possible impact of amino acid substitutions 
on the structure and function of human proteins using straightforward physical and evolutionary comparative considerations.

PolyPhen makes its predictions using UniProt features, PSIC
profiles scores derived from multiple alignment and matches to PDP
or PQS structural databases.



1000 Genomes Exercise
================================================================================

Go to the 1000 Genomes FTP site:

<ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase1/analysis_results/integrated_call_sets>

The files in this directory represent the final variant call set associated with the phase1 analysis.


You can use `tabix` to get the header of the VCF file and see the identifiers fore each of the samples:

    tabix -H ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase1/analysis_results/integrated_call_sets/ALL.chr20.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.vcf.gz > header.txt


Download the first variants in chromosome 20
	
    tabix -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase1/analysis_results/integrated_call_sets/ALL.chr20.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.vcf.gz 20:1-100000 > first_chr20.vcf

and extract their IDs suing the Linux command `cut`

    cut -f 3 first_chr20.vcf > SNPids


See [here](http://www.1000genomes.org/category/tabix) for more examples on the usage of `tabix` for the 1000 Genomes project.




Annotation example using SIFT
-----------------------------

Download the precomputed SIFT scores form the FTP of the [SIFT web page][sift-site]

<ftp://ftp.jcvi.org/pub/data/sift/dbSNP_132>

and try to include the information into the __first_chr20.vcf__ file

The scritp __sift_and_polyphen_in_bioconductor.r__ shows how to get the same information from Bioconductor precompiled packages.




Unknown Variants Exercise
================================================================================

In our VCF file __f090_snp_filtered.vcf__ created in previous sessions there are not 
dbSNP identifiers. It is likely that most of the variants are novel.

Use the data form [SIFT web page][sift-site]

<ftp://ftp.jcvi.org/pub/data/sift/Human_db_37_ensembl_63/>

to find out which of the variants have a SIFT score and filter the variants in the file according to such information.


The scritp __read_sqlite.r__ shows how to extract the information form the SQLite file.
