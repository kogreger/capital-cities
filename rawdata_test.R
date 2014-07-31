## load necessary libraries and initialize
library(data.table)
library(fields)
library(geosphere)
library(plyr)


## load data
# concatenate single 1-minute CSV files into one complete 48-hour CSV file
#system("cat ~/Dropbox/AAA/dhk09/09dhk_*.csv > ~/Dropbox/AAA/dhk09/dhk09.csv")
#system("rm ~/Dropbox/AAA/dhk09/09dhk_*.csv")

# load data set
dhk09 <- fread("~/Dropbox/AAA/dhk09/dhk09.csv", 
               sep = ",", 
               header = FALSE, 
               na.strings = c(""), 
               stringsAsFactors = FALSE, 
               verbose = TRUE)
# provide meaningful column names
setnames(dhk09, c("pid", "tno", "sno", "pdate", "lon", "lat", "sex", "age", 
                  "padd", "occup", "purpose", "magfac", "magfac2", "tmode"))
# add puid as unique point identifier
dhk09[, puid := seq_len(nrow(dhk09))]
# order data by pid and puid
keyColumns <- c("pid", "puid")
setkeyv(dhk09, keyColumns)

# extract distinct pids
pids <- dhk09[, length(puid), by = pid]

# create empty vector for point distances
distances <- numeric(0)

# calculate point distances: for loop (8s for 10 pids)
system.time(for(p in pids$pid[1:10]) {
  # extract one person
  person <- dhk09[J(p)]
  # order sequentially (by puid)
  setkey(person, puid)
  # extract coordinates
  coords <- person[, list(lon, lat)]
  # calculate distance matrix
  dist <- distm(coords)
  # remove first column of distance matrix
  dist <- dist[-1, ]
  # extract sequential point distances from matrix diagonal
  dist <- c(diag(dist), 0)
  # append point distances to overall point distance vector
  distances <- c(distances, dist)
})


# calculate point distances: apply (doesn't work)
# append coordinates from following point location
coordsShifted <- rbindlist(list(dhk09[-1, list(puid, lon, lat)], 
                                dhk09[nrow(dhk09), list(puid, lon, lat)]))
dhk09[, c("lon.s","lat.s") := coordsShifted[, list(lon, lat)]]
# calculate distance between location and next (shifted) location
setkey(dhk09, pid)
dhk09f <- dhk09[J(1), ]


tables()
