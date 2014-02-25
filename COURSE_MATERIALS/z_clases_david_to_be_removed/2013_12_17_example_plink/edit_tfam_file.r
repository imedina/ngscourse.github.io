##edit_tfam_file.r
##2013-12-17 dmontaner@cipf.es
##format tfam file Phenotype column

##' Remember: Phenotype (1=unaffected; 2=affected; 0 missing; -9=missing)
##' See http://pngu.mgh.harvard.edu/~purcell/plink/data.shtml#tr for details

rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"

setwd ("data")
dir ()

datos <- read.table (file = "f020_plink_format.tfam", header = FALSE, sep = "\t", quote = "", colClasses = "character")
dim (datos)
datos[1:3,]

##' See just an example Phenotype
datos[,6] <- 1:2  ## NOTICE that the 1:2 vector gets "recycled"

datos[1:10,]


##' Save a new file
write.table (datos, file = "f040_plink_format.tfam", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
