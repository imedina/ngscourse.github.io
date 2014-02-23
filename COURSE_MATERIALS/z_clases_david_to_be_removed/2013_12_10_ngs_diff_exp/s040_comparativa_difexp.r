##s040_comparativa_difexp.r
##2013-12-10 dmontaner@cipf.es
## data form Leidinger 2013: GSE46579

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.0.1 (2013-05-16)"
library (edgeR); packageDescription ("edgeR", fields = "Version") #"3.2.4"
library (limma); packageDescription ("limma", fields = "Version") #"3.2.4"


##' ##' # DATOS
ficheros <- c("res_foldchange.RData", "res_edger.RData", "res_limma.RData")

for (fi in ficheros) {
  load (fi)
}
rm (fi, co, ficheros)
ls ()



##' Compare
##' ============================================================================
table (names (mifold) == rownames (res.edger.cls))
table (names (mifold) == rownames (res.edger.cls))

table (names (mifold) == rownames (res.limma))


##' FoldChanges
##' ----------------------------------------------------------------------------
par (mfrow = c(1,3))
##
plot (mifold, res.edger.cls$table[,"logFC"], main = "edger.cls")
abline (0, 1, col = "blue")
##
plot (mifold, res.edger.glm$table[,"logFC"], main = "edger.glm")
abline (0, 1, col = "blue")
##
plot (mifold, res.limma$coefficients[,"disease"], main = "limma")
abline (0, 1, col = "blue")
##

round (cor (cbind (mifold = mifold,
                   edger.cls = res.edger.cls$table[,"logFC"],
                   edger.glm = res.edger.glm$table[,"logFC"],
                   limma = res.limma$coefficients[,"disease"]
                   )), 2)
       

##' Pvalues
##' ----------------------------------------------------------------------------
par (mfrow = c(1,3))
##
plot (mifold, res.edger.cls$table[,"PValue"], main = "edger.cls")
abline (0, 1, col = "blue")
##
plot (mifold, res.edger.glm$table[,"PValue"], main = "edger.glm")
abline (0, 1, col = "blue")
##
plot (mifold, res.limma$p.value[,"disease"], main = "limma")
abline (0, 1, col = "blue")


par (mfrow = c(1,3))
##
plot (res.edger.cls$table[,"PValue"], res.edger.cls$table[,"PValue"], main = "edger.cls")
abline (0, 1, col = "blue")
##
plot (res.edger.cls$table[,"PValue"], res.edger.glm$table[,"PValue"], main = "edger.glm")
abline (0, 1, col = "blue")
##
plot (res.edger.cls$table[,"PValue"], res.limma$p.value[,"disease"], main = "limma")
abline (0, 1, col = "blue")


##' ### Log scale
log1 <- function (x) {
  log (1 + x)
}

par (mfrow = c(1,3))
##
plot (log1 (res.edger.cls$table[,"PValue"]), log1 (res.edger.cls$table[,"PValue"]), main = "edger.cls")
abline (0, 1, col = "blue")
##
plot (log1 (res.edger.cls$table[,"PValue"]), log1 (res.edger.glm$table[,"PValue"]), main = "edger.glm")
abline (0, 1, col = "blue")
##
plot (log1 (res.edger.cls$table[,"PValue"]), log1 (res.limma$p.value[,"disease"]), main = "limma")
abline (0, 1, col = "blue")

##' ----------------------------------------------------------------------------

round (cor (cbind (edger.cls = res.edger.cls$table[,"PValue"],
                   edger.glm = res.edger.glm$table[,"PValue"],
                   limma = res.limma$p.value[,"disease"])), 2)


###EXIT
warnings ()
sessionInfo ()
#q ("no")
