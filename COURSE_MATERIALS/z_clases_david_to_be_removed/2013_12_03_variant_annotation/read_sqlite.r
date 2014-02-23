##read_sqlite.r
##2013-12-03 dmontaner@cipf.es
##Reading SIFT data from an SQLite database

## The example data has been downloaded from:
## ftp://ftp.jcvi.org/pub/data/sift/Human_db_37_ensembl_63/Human_CHR20.sqlite.gz
    
date ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-05-16)"
library (RSQLite); packageDescription ("RSQLite", fields = "Version") # "0.11.4"  ## depends on DBI

help (package = DBI)      ##DBI is the generic package for data base connections
help (package = RSQLite)  ##RSQLite


################################################################################


##' Database driver
driver.name <- dbDriver (drvName = "SQLite")
driver.name

##' Connect to the database
conection.object <- dbConnect (drv = driver.name, dbname = "Human_CHR20.sqlite")
conection.object

##' Get database information
dbGetInfo (conection.object)


##' Show tables
dbListTables (conection.object)


##' List the fields form one table
dbListFields (conn = conection.object, name = "chr20_19997760_30000641")


##' List the fields form all tables
tablas <- dbListTables (conection.object)
for (ta in tablas) {
    print (dbListFields (conn = conection.object, name = ta))
}


##' Load one table into the R session
datos <- dbReadTable (conn = conection.object, name = "chr20_19997760_30000641")
class (datos)
dim (datos)
datos[1:3,]


##' Most positions have an empty SCORE;
##' remember SIFT is just computed for coding regions.
datos[1:10, "SCORE"] 

##' Get the positions with non empty SIFT SCORE
touse <- datos[,"SCORE"] != ""
table (touse)

datos[touse,][1:10,]

##' Why are the coordinates repeated 4 times each?
