## load necessary libraries
library(data.table)
library(geosphere)
# set working directory
setwd("~/Documents/University of Tsukuba/Capital Cities Project/capital-cities")
# initialize data set names and file name patterns
datasets <- c("dhk09", "hni04", "jkt02", "mnl96")
sourcefiles <- c("09dhk", "04hni", "02jkt", "96mnl")


# loop through all data sets
for (d in 1:length(datasets)) {
  ## load source data
  # extract CSV files from ZIP archives
  # [-j to junk subdirectories; -d to specify output path]
  bash <- paste0("unzip -j '../raw_data/", datasets[d], "/*.zip' ", 
                 "-d ../raw_data/", datasets[d], "/")
  system.time(system(bash))
  # concatenate single 1-minute CSV files into one complete 48-hour CSV file
  bash <- paste0("cat ../raw_data/", datasets[d], "/", sourcefiles[d], "_*.csv ", 
                 "> ../raw_data/", datasets[d], "/", datasets[d], "_.csv")
  system.time(system(bash))
  # load data set from CSV
  filename <- paste0("../raw_data/", datasets[d], "/", datasets[d], "_.csv")
  system.time(data <- fread(filename, 
                            sep = ",", 
                            header = FALSE, 
                            na.strings = c(""), 
                            stringsAsFactors = FALSE, 
                            verbose = TRUE))
  # provide meaningful column names
  system.time(setnames(data, c("pid", "tno", "sno", "pdate", "lon", "lat", 
                               "sex", "age", "padd", "occup", "purpose", 
                               "magfac", "magfac2", "tmode")))
  # add puid as unique point identifier
  system.time(data[, puid := seq_len(nrow(data))])
  # order data by pid and puid
  system.time(setkeyv(data, c("pid", "pdate")))
  
  
  ## calculate segment distances
  pointDistances <- function (dat, lon, lat) {
  	# extract point coordinates
  	pts <- dat[, list(lon, lat)]
  	# calculate distances between point positions and subsequent point positions
  	dist <- distHaversine(p1 = pts[-nrow(dat),], 
                          p2 = pts[-1,])
  	# append 0 distance to last point and return
  	return(c(dist, as.numeric(0)))
  }
  system.time(distances <- pointDistances(data, lon, lat))
  # assign point distances to data set
  system.time(data[, dist := distances])
  
  
  ## export results
  # export preprocessed data as CSV file
  filename <- paste0("../raw_data/", datasets[d], "/", datasets[d], ".csv")
  system.time(write.csv(data, 
                        file = filename, 
                        row.names = FALSE))
  # export preprocessed data as RDA file
  filename <- paste0("../raw_data/", datasets[d], "/", datasets[d], ".rda")
  system.time(save(data, file = filename))
  
  
  ## clean up unnecessary source data and free memory
  # remove zip archives
  bash <- paste0("rm ../raw_data/", datasets[d], "/*.zip")
  system.time(system(bash))
  # remove single 1-minute CSV files
  bash <- paste0("rm ../raw_data/", datasets[d], "/", sourcefiles[d], "_*.csv")
  system.time(system(bash))
  # remove complete 48-hour CSV file
  bash <- paste0("rm ../raw_data/", datasets[d], "/", datasets[d], "_.csv")
  system.time(system(bash))
  # empty trash
  system.time(system("rm -rf ~/.Trash/*"))
  # free memory
  rm(data)
  rm(distances)
  gc()
}