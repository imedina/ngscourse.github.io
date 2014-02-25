##s020_analysis_edgR.r
##2013-12-10 dmontaner@cipf.es
## data form Leidinger 2013: GSE46579

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"
library (edgeR); packageDescription ("edgeR", fields = "Version") #"3.4.2"


##' # DATOS
load ("datos_conteos.RData")
ls ()

table (rownames (sinfo) == colnames (conteos))

conteos[1:3, ]
sinfo[1:3,]


##' # ANALYSIS fold change
##' ============================================================================
##' Habria que normalizar por RPKM al menos

boxplot (cbind (1 + conteos[,sinfo$disease == 0], 1 + conteos[,sinfo$disease == 1]), log = "y")

media0 <- rowMeans (conteos[,sinfo$disease == 0])
media1 <- rowMeans (conteos[,sinfo$disease == 1])

mifold <- log2 (media1 / media0)
summary (mifold)



##' ANALYSIS edgeR classic
##' ============================================================================
y <- DGEList (counts = conteos, genes = rownames (conteos), group = sinfo$disease) #FORMAT
yy <- calcNormFactors (y) #NORMALIZE

table (y$counts == yy$counts) ##ok
table (y$genes  == yy$genes) ##ok
y$samples[1:3,]
yy$samples[1:3,]  #AQUI LA DIFERENCIA

y <- yy

## plotMDS (y)
## PCA plot

y <- estimateTagwiseDisp (y) ## Estimating the dispersion
y <- estimateCommonDisp (y)  ##
## plotBCV (y)

res.edger.cls <- exactTest (y) ## Differential expression
summary (decideTestsDGE (res.edger.cls))

topTags (res.edger.cls)

is.list (res.edger.cls)  ##a list
names (res.edger.cls)

res.edger.cls$table[1:3,]  ##important ressults
res.edger.cls$genes
res.edger.cls$comparison





##' ANALYSIS edgeR glm
##' ============================================================================
design <- model.matrix (~sinfo$disease)
design

z <- DGEList (counts = conteos, group = sinfo$disease) #FORMAT
z <- calcNormFactors (z) #NORMALIZE
## plotMDS (z) #PCA plot
z <- estimateGLMCommonDisp  (z, design, verbose = TRUE)
z <- estimateGLMTrendedDisp (z, design, verbose = TRUE)
z <- estimateGLMTagwiseDisp (z, design)
fit <- glmFit (z, design)
res.edger.glm <- glmLRT (fit, coef=2) ##Fit a negative binomial generalized log-linear model to the read

topTags (res.edger.glm)

summary (decideTestsDGE (res.edger.glm))

table (decideTestsDGE (res.edger.glm), as.logical (decideTestsDGE (res.edger.glm)))

rownames (z)[as.logical (decideTestsDGE (res.edger.glm))]

plotSmear (res.edger.glm, de.tags = rownames (z)[as.logical (decideTestsDGE (res.edger.glm))])


##' Ressults
res.edger.glm$table[1:3,]





##' Compare
##' ============================================================================
table (rownames (res.edger.cls) == names (mifold))
table (rownames (res.edger.glm) == names (mifold))
dim (res.edger.cls$table)
dim (res.edger.glm$table)
length (mifold)

par (mfrow = c(2,2))
##
plot (mifold, res.edger.cls$table[,"logFC"])
abline (0, 1, col = "blue")
##
plot (mifold, res.edger.glm$table[,"logFC"])
abline (0, 1, col = "blue")
##
plot (res.edger.cls$table[,"logFC"], res.edger.glm$table[,"logFC"])
abline (0, 1, col = "blue")
##
#boxplot (res.edger.cls$table[,"PValue"], res.edger.glm$table[,"PValue"])
plot (res.edger.cls$table[,"PValue"], res.edger.glm$table[,"PValue"])
abline (0, 1, col = "blue")



##' # SALVAMOS
save (list = c("mifold"), file = "res_foldchange.RData")
save (list = c("res.edger.cls", "res.edger.glm"), file = "res_edger.RData")


###EXIT
warnings ()
sessionInfo ()
q ("no")
