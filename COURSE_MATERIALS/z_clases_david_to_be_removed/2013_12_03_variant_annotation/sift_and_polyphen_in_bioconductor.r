##sift_and_polyphen_in_bioconductor.r
##2013-12-03 dmontaner@cipf.es
##We explore the Bioconductor libraries which contain SIFT and PolyPhen data


date ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-05-16)"


##' You may need to install the libraries

# source ("http://bioconductor.org/biocLite.R")
# biocLite ("SIFT.Hsapiens.dbSNP132")
# biocLite ("PolyPhen.Hsapiens.dbSNP131")



##' SIFT library
##' ============================================================================


##' Load the SIFT library and see the package description:
library (SIFT.Hsapiens.dbSNP132); packageDescription ("SIFT.Hsapiens.dbSNP132", fields = "Version") ##"1.0.2"
help (package = SIFT.Hsapiens.dbSNP132)

##' explore the class of the SIFT object:
class (SIFT.Hsapiens.dbSNP132)
help ("SIFTDb-class")


##' Get informatioin about the database:
metadata (SIFT.Hsapiens.dbSNP132)


## Get the names of the fields available in the database:
columns (SIFT.Hsapiens.dbSNP132)


##' Get SIFT information for a subset of SNPs:
rsids <- c ("rs17970171", "rs2142947", "rs3026284")
select (SIFT.Hsapiens.dbSNP132, keys = rsids)


##' Get SIFT information just for some columns:
subst <- c ("RSID", "METHOD", "PREDICTION", "SCORE")
select (SIFT.Hsapiens.dbSNP132, keys = rsids, columns = subst)




##' PolyPhen library
##' ============================================================================


##' Load the PolyPhen library and see the package description:
library (PolyPhen.Hsapiens.dbSNP131); packageDescription ("PolyPhen.Hsapiens.dbSNP131", fields = "Version") ##"1.0.2"
help (package = PolyPhen.Hsapiens.dbSNP131)

##' explore the class of the PolyPhen object:
class (PolyPhen.Hsapiens.dbSNP131)
help ("PolyPhenDb-class")


##' Get informatioin about the database:
metadata (PolyPhen.Hsapiens.dbSNP131)


## Get the names of the fields available in the database:
columns (PolyPhen.Hsapiens.dbSNP131)


##' Get PolyPhen information for a subset of SNPs:
rsids <- c ("rs17970171", "rs2142947", "rs3026284")
select (PolyPhen.Hsapiens.dbSNP131, keys = rsids)


##' Get PolyPhen information just for some columns:
subst <- c ("RSID", "DSCORE", "SCORE1", "SCORE2" )
select (PolyPhen.Hsapiens.dbSNP131, keys = rsids, columns = subst)

