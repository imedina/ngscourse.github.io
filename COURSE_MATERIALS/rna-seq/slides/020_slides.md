% NGS data analisis course
% [The road of excess consortium](http://www.roadofexcess.org/)
% (last update 14-02-2014)


Imagen
================================================================================

\includegraphics[scale=.1]{images/foto}

Titulo
================================================================================

![](images/diagram)


NCBI
================================================================================

- __National Center for Biotechnology Information__ (NCBI)
<http://www.ncbi.nlm.nih.gov/>

- part of the United States National Library of Medicine (NLM)
<https://www.nlm.nih.gov/>

- a division of the National Institutes of Health (NIH)
<http://www.nih.gov/>


Resources
================================================================================

Databases of biomedical and genomic information for all organisms:

- Submission
    - GenBank
- Databases
    - GenBank
    - __RefSeq__ 
	- ...
- Downloads
    - FTP sites
	- PubMed
- Tools
    - Basic Local Alignment Search Tool (BLAST)
    - ...


See: <http://www.ncbi.nlm.nih.gov/guide/all/>



Documents
================================================================================

[NCBI Help Manual](http://www.ncbi.nlm.nih.gov/books/NBK3831/):

- quick overview about topics
- usually just FAQs
- online (HTML) book


[NCBI Handbook](http://www.ncbi.nlm.nih.gov/books/NBK21101/): 

- nice introduction to each tool or database
- online (HTML) book
- but Chapters may be downloaded in PDF format
- see a [chapter example describing GenBank](http://www.ncbi.nlm.nih.gov/books/NBK21105/)


Many other:

- [Glossary](http://www.ncbi.nlm.nih.gov/books/NBK21106/)
- [NCBI Educational Resources](http://www.ncbi.nlm.nih.gov/education/)



Entrez: Search and Retrieval System
================================================================================

- the indexing and retrieval system used at the NCBI
- used for __all__ major NCBI databases:
    - PubMed
    - Nucleotide and Protein Sequences 
    - Protein Structures
    - Complete Genomes,
    - Taxonomy
    - OMIM
	- ...
- __text-based__ searches over several record fields
- In practical terms, the [web interface](http://www.ncbi.nlm.nih.gov/)



GenBank
================================================================================

- collection of publicly available _annotated_ nucleotide sequences and their __protein__ translations
    - mRNA sequences with coding regions
    - segments of genomic DNA with single or multiple genes
    - ribosomal RNA gene clusters
	- genome shotgun reads
	- isolated genes
	- complete genomes
	- ...
- primary sequence data; __not curated__; minor checks done by the NCBI
- just authors submit and revise
- may have multiple records for same loci
- records can contradict each other
- no limit to species included


INSDC: International Nucleotide Sequence Database Collaboration
================================================================================

INSDC members:

- __GenBank__
- [ENA](http://www.ebi.ac.uk/ena/): European Nucleotide Archive
- [DDBJ](http://www.ddbj.nig.ac.jp/): DNA Data Bank of Japan

\ 

<http://www.insdc.org/>


GenBank Access
================================================================================

<https://www.ncbi.nlm.nih.gov/genbank/>

Primarily access via the NCBI __Nucleotide__ database 
which is divided into three divisions: 

- [CoreNucleotide](https://www.ncbi.nlm.nih.gov/nuccore/): the main collection (same as Nucleotide) 
- [dbEST](https://www.ncbi.nlm.nih.gov/nucest/): single-read transcript sequences (Expressed Sequence Tags)
- [dbGSS](https://www.ncbi.nlm.nih.gov/nucgss/): unannotated short single-read primarily genomic sequences


But some other ways are available:

- BLAST: align against GenBank sequences
- FPT


GenBank record format
================================================================================

See an [Example of GenBank Record](http://www.ncbi.nlm.nih.gov/Sitemap/samplerecord.html)




RefSeq: The Reference Sequence database 
================================================================================

<http://www.ncbi.nlm.nih.gov/refseq/>

- a __curated__ collection of DNA, RNA, and protein sequences
- created by the NCBI from existing data (GeneBank)
- unique example of each natural biological molecule (for each major organisms)
- not all organisms available
- for each model organism, RefSeq aims to provide separate and linked records for:
    - the genomic DNA
    - the gene transcripts
    - and the proteins arising from those transcripts


RefSeq
================================================================================

- non-redundant set of reference standards (__NR__)
- includes:
    - chromosomes
	- complete genomic molecules (organelle genomes, viruses, plasmids)
	- intermediate assembled genomic contigs
	- curated genomic regions, mRNAs, RNAs
	- proteins
	- alternatively spliced transcripts

- generated to provide reference standards for multiple purposes

- facilitates database inquiries based on:
    - genomic location
    - sequence
    - text annotation




RefSeq Access
================================================================================

- [Entrez](http://www.ncbi.nlm.nih.gov/): <http://www.ncbi.nlm.nih.gov/refseq/>
- [NCBI Gene](http://www.ncbi.nlm.nih.gov/gene): include nomenclature, maps, pathways ...
- [NCBI Genome](http://www.ncbi.nlm.nih.gov/genome/): information on genomes including sequences, maps, chromosomes, assemblies, and annotations
- [NCBI Assembly](http://www.ncbi.nlm.nih.gov/assembly/): Genome assembly
- [NCBI UniGene](http://www.ncbi.nlm.nih.gov/unigene):  A Unified View of the Transcriptome

\ 

Example [Homo sapiens (human)](http://www.ncbi.nlm.nih.gov/genome/51)



RefSeq record
================================================================================

Each RefSeq record represents a synthesis, of the primary information that was generated and submitted by many researchers.

\ 

Consistent framework between:

- sequence
- genetic
- expression
- functional information
- ...

\ 

RefSeq records are similar in format to GenBank 
but may include a unique accession prefix followed by

RefSeq Accession Format
================================================================================

Accession format: accession number that begins with two characters followed by an underscore. 

There are several [RefSeq accession prefixes](http://www.ncbi.nlm.nih.gov/books/NBK21091/table/ch18.T.refseq_accession_numbers_and_mole/?report=objectonly)

- NM_:  mRNA	
- NR_:  RNA (non coding)
- NC_:  Complete genomic molecule, usually a reference assembly.


Curation __VERSION__ is indicated after a dot: 

- NM_000014.4
- NM_000014.5


Usual fasta id for a sequence:

    >gi|262118207|ref|NM_000202.5| Homo sapiens iduronate ...


Read about [GIs](http://www.ncbi.nlm.nih.gov/nuccore/NM_002020.4?report=girevhist)



RefSeq Curation Levels
================================================================================

There are several RefSeq curation levels. 

See [status codes here](http://www.ncbi.nlm.nih.gov/books/NBK21091/table/ch18.T.refseq_status_codes/?report=objectonly)

RefSeq records with a status of __VALIDATED__ or __REVIEWED__ are intended to represent the current state of genomic knowledge.




FTP Downloads
================================================================================

See: <ftp://ftp.ncbi.nlm.nih.gov/refseq/>

\ 

Use shell command: `wget`

