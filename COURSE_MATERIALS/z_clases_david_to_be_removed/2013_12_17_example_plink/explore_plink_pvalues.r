##explore_plink_pvalues.r
##2013-12-17 dmontaner@cipf.es
##explore p-value adjustment form plink in the association test results

##' See
##' http://pngu.mgh.harvard.edu/~purcell/plink/anal.shtml#cc
##' for details on the statistical analysis performed by PLINK.

rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"

setwd ("data")
dir ()

datos <- read.table (file = "f060_res_plink.assoc.adjusted", header = TRUE, as.is = TRUE)
dim (datos)
sapply (datos, class)
datos[1:3,]
summary (datos)  ##NOTICE that there are no missing data.


colnames (datos)

##' Some plots
par (mfrow = c(2,3))
for (co in c ("BONF", "HOLM", "SIDAK_SS", "SIDAK_SD", "FDR_BH", "FDR_BY")) {
    print (co)
    plot (datos[,"UNADJ"], datos[,co], xlim = c(0,1), ylim = c(0,1))
    title (main = co)
}
