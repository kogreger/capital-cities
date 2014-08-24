##
## psqlHelper.R
##
## Version 0.1.20140617
## Author: Konstantin Greger
##
##
## This file contains a few helper functions to ease working with PostgreSQL
## databases from within R. Under the hood it requires the 'RPostgreSQL' 
## package, so you should run 'install.packages("RPostgreSQL")' to make sure
## everything works.
##
## None of the functions have any error handing, so they will crash (or worse) 
## is used improperly. Use on your own risk!
##
library(RPostgreSQL)


## psqlQuery takes an RPostgreSQL connection and an SQL string and returns 
## a data.frame with as many rows as records were fetched and as many columns 
## as fields in the result set.
##
psqlQuery <- function(connection, queryString) {
  resultSet <- dbSendQuery(connection, queryString)
  data <- fetch(resultSet, n=-1)
  data
}


## psqlGetTable is a wrapper to the RPostgreSQL function dbReadTable. It takes 
## an RPostgreSQL connection, a PostgreSQL schema name and a PostgreSQL 
## table name and returns a data.frame.
##
psqlGetTable <- function(connection, schema, table) {
  queryString = paste("SET search_path TO ", schema, "")
  dbGetQuery(connection, queryString)
  data <- dbReadTable(connection, table)
  dbGetQuery(connection, "SET search_path TO \"$user\",public")
  data
}


## psqlGetTable is a wrapper to the RPostgreSQL function dbWriteTable. It takes 
## an RPostgreSQL connection, a PostgreSQL schema name and a data.frame 
## (or an object that can be coerced to one) and returns a boolean.
##
psqlPutTable <- function(connection, schema, table, dataframe, 
                         rownames = FALSE, ...) {
  queryString = paste("SET search_path TO ", schema, "")
  dbGetQuery(connection, queryString)
  success <- dbWriteTable(connection, table, dataframe, 
                          row.names = rownames, ...)
  dbGetQuery(con, "SET search_path TO \"$user\",public")
  success
}