##s030_analysis_limma.r
##2013-12-10 dmontaner@cipf.es
## data form Leidinger 2013: GSE46579

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"
library (limma); packageDescription ("limma", fields = "Version") #"3.18.3"
library (edgeR); packageDescription ("edgeR", fields = "Version") #"3.4.2"

##' # DATOS
load ("datos_conteos.RData")
ls ()

table (rownames (sinfo) == colnames (conteos))

conteos[1:3, ]
sinfo[1:3,]


##' # ANALYSIS fold change
##' ============================================================================
media0 <- rowMeans (conteos[,sinfo$disease == 0])
media1 <- rowMeans (conteos[,sinfo$disease == 1])

mifold <- log2 (media1 / media0)
summary (mifold)



##' ANALYSIS limma
##' ============================================================================
y <- DGEList (counts = conteos, group = sinfo$disease) #FORMAT
y <- calcNormFactors (y) #NORMALIZE

## limma 
design <- model.matrix (~sinfo$disease)
colnames (design)[2] <- "disease"
cbind (design, sinfo$disease)

v <- voom (y, design,plot = TRUE)

class (v)
names (v)
lapply (v, head)

## par (mfrow = c(2,1))
## boxplot (conteos)
## boxplot (v$E)

## table (colnames (conteos) == colnames (v$E)) ##OK
## table (rownames (conteos) == rownames (v$E)) ##OK 

## plot (conteos[,1], v$E[,1], log = "x")

## plotMDS (v)  ## TIPO PCA

fit <- lmFit (v, design)
res.limma <- eBayes (fit)

topTable (res.limma, coef=2)

res.limma$t[1:3,]
res.limma$p.value[1:3,]


##' Compare
##' ============================================================================
table (rownames (res.limma$t) == names (mifold))
length (mifold)

## par (mfrow = c(1,2))
## ##
## plot (mifold, res.limma$coefficients[,"disease"])
## abline (0, 1, col = "blue")
## ##
## plot (mifold, res.limma$t[,"disease"])
## abline (0, 1, col = "blue")

##' # SALVAMOS
save (list = c("res.limma"), file = file.path ("res_limma.RData"))


###EXIT
warnings ()
sessionInfo ()
q ("no")
