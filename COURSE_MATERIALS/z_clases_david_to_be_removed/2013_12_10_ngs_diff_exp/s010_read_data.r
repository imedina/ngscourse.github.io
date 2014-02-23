##s010_read_data.r
##2013-12-10 dmontaner@cipf.es
##Read data form Leidinger 2013: GSE46579

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"


###DATOS
conteos <- read.csv (file = "GSE46579_AD_ngs_data_summarized_raw_data.csv", as.is = TRUE)
conteos[1:3,]

dim (conteos)
conteos[1:3, 1:4]
table (duplicated (conteos[,"X"])) ##OK no duplicados
rownames (conteos) <- conteos[,"X"]
conteos <- conteos[,-1]
conteos[1:3, 1:4]

summary (conteos)
boxplot (conteos)
boxplot (log (1 + conteos))


##SINFO: sample information
sinfo <- data.frame (sampleName = colnames (conteos), stringsAsFactors = FALSE)
sinfo[,"disease"] <- 1
sinfo[grep ("control", colnames (conteos)), "disease"] <- 0
sapply (sinfo, class)
rownames (sinfo) <- sinfo[,"sampleName"]
sinfo[1:3,]

table (colnames (conteos) == rownames (sinfo))


table (duplicated (rownames (conteos))) ## OK no duplicates



###SALVAMOS
save (list = c("conteos", "sinfo"), file = "datos_conteos.RData")

###EXIT
warnings ()
sessionInfo ()
q ("no")
