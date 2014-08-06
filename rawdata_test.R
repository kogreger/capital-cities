## load necessary libraries and initialize
library(data.table)
#library(ff)
library(geosphere)
#library(plyr)


## load data
# concatenate single 1-minute CSV files into one complete 48-hour CSV file
#system("cat /Volumes/WD_8TB/Data_Transfer/pflow/jkt02/02jkt_*.csv > /Volumes/WD_8TB/Data_Transfer/pflow/jkt02/jkt02.csv")
# remove single 1-minute CSV files
#system("rm ~/Dropbox/AAA/jkt02/02jkt_*.csv")

# load data set from CSV
data <- fread("/Volumes/WD_8TB/Data_Transfer/pflow/jkt02/jkt02.csv", 
              sep = ",", 
              header = FALSE, 
              na.strings = c(""), 
              stringsAsFactors = FALSE, 
              verbose = TRUE)
# provide meaningful column names
setnames(data, c("pid", "tno", "sno", "pdate", "lon", "lat", "sex", "age", 
                 "padd", "occup", "purpose", "magfac", "magfac2", "tmode"))
# add puid as unique point identifier
data[, puid := seq_len(nrow(data))]
# load data set from RDA
#load("jkt02_.rda")
# order data by pid and puid
keyColumns <- c("pid", "pdate")
setkeyv(data, keyColumns)


# calculate point distances: for loop 
# timing: 8s for 10 pids, 37,545s (~10.4h) for 42,114 pids
# extract distinct pids
pids <- data[, length(puid), by = pid]

# create empty vector for point distances
distances <- numeric(0)

system.time(for(p in pids$pid) {
  # extract one person
  person <- data[J(p)]
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

# assign point distances to data set
data[, dist := distances]


# calculate point distances: apply (doesn't work)
# append coordinates from following point location
coordsShifted <- rbindlist(list(data[-1, list(puid, lon, lat)], 
                                data[nrow(data), list(puid, lon, lat)]))
data[, c("lon.s","lat.s") := coordsShifted[, list(lon, lat)]]
# calculate distance between location and next (shifted) location
setkey(data, pid)


# calculate point distances: vectorized operation ()
# timing: 0.1s for 10 pids, 68s for 42,114 pids
pointDistances <- function (df, lon, lat) {
	# extract point coordinates
	pts <- df[, list(lon, lat)]
	# calculate distances between shifted point positions
	dist <- distHaversine(p1 = pts[-nrow(df),], 
	p2 = pts[-1,])
	# append 0 distance to last point and return
	return(c(dist, as.numeric(0)))
}

system.time(distances <- pointDistances(data, lon, lat))

# assign point distances to data set
system.time(data[, dist := distances])


# calculate point distances: vectorized operation () using ff
# timing: 
# load data set into ffdf
data <- read.table.ffdf(file = "/Volumes/WD_8TB/Data_Transfer/pflow/jkt02/jkt02.csv")



# remove complete 48-hour CSV file
#system("rm ~/Dropbox/AAA/jkt02/jkt02.csv")
# export preprocessed data as CSV
write.csv(data, 
          file = "/Volumes/WD_8TB/Data_Transfer/pflow/jkt02/jkt02_01.csv", 
          row.names = FALSE)
# export preprocessed data as RDA
save(data, file="/Volumes/WD_8TB/Data_Transfer/pflow/jkt02/jkt02_01.rda")