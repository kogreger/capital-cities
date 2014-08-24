## load necessary libraries
library(data.table)
library(ff)
library(ffbase)
library(geosphere)
# set working directories
setwd("~/Documents/University of Tsukuba/Capital Cities Project/capital-cities")
options(fftempdir = "/Volumes/LaCie/fftemp/")
# initialize source data folder, data set names, and file name patterns
#folder <- "/Volumes/LaCie/"
folder <- "../raw_data/"
datasets <- c("mnl96")
sourcefiles <- c("96mnl")


# loop through all data sets
for (d in 1:length(datasets)) {
  print(paste0("Processing: ", datasets[d]))
  ## load source data
  # extract CSV files from ZIP archives
  # [-j to junk subdirectories; -d to specify output path]
  print("(1) unzip")
  bash <- paste0("unzip -j '", folder, datasets[d], "/*.zip' ", 
                 "-d ", folder, datasets[d], "/")
  print(system.time(system(bash)))
  # concatenate single 1-minute CSV files into one complete 48-hour CSV file
  print("(2) cat")
  bash <- paste0("cat ", folder, datasets[d], "/", sourcefiles[d], "_*.csv ", 
                 "> ", folder, datasets[d], "/", datasets[d], "_.csv")
  print(system.time(system(bash)))
  # load data set from CSV
  print("(3) read.table.ffdf")
  filename <- paste0(folder, datasets[d], "/", datasets[d], "_.csv")
  print(system.time(data <- read.table.ffdf(file = filename, 
                                            FUN = "read.csv", 
                                            na.strings = "")))
  #   system.time(data <- fread(filename, 
  #                             sep = ",", 
  #                             header = FALSE, 
  #                             na.strings = c(""), 
  #                             stringsAsFactors = FALSE, 
  #                             verbose = TRUE))
  # provide meaningful column names
  print("(4) names")
  print(system.time(names(data) <- c("pid", "tno", "sno", "pdate", "lon", "lat", 
                                     "sex", "age", "padd", "occup", "purpose", 
                                     "magfac", "magfac2", "tmode")))
  #   system.time(setnames(data, c("pid", "tno", "sno", "pdate", "lon", "lat", 
  #                                "sex", "age", "padd", "occup", "purpose", 
  #                                "magfac", "magfac2", "tmode")))
  # add puid as unique point identifier
  print("(5) puid")
  print(system.time(data$puid <- as.ff(seq_len(nrow(data)))))
  #   system.time(data[, puid := seq_len(nrow(data))])
  # order data by pid and puid
  print("(6) fforder")
  print(system.time(data[fforder(data$pid, data$pdate), ]))
  #   system.time(setkeyv(data, c("pid", "pdate")))
  
  
  ## calculate segment distances
  print("(7) segment distances")
  pointDistances <- function (dat, lon, lat) {
    # extract point coordinates
    print("(7.1) pts")
    print(system.time(pts <- as.ffdf(data[, c("lon", "lat")])))
#     pts <- data[, c("lon", "lat")]
    #   	pts <- dat[, list(lon, lat)]
    # calculate distances between point positions and subsequent point positions
    print("(7.2) distHaversine")
    print(system.time(dist <- ff(distHaversine(p1 = pts[-nrow(data), ], 
                                               p2 = pts[-1, ]))))
#     dist <- distHaversine(p1 = pts[-nrow(data), ], 
#                       p2 = pts[-1, ])
    # append 0 distance to last point and return
    print("(7.3) ffappend")
    return(ffappend(dist, ff(as.numeric(0))))
#     return(c(dist, as.numeric(0)))
  }
  print(system.time(distances <- pointDistances(data, data$lon, data$lat)))
  #   system.time(distances <- pointDistances(data, lon, lat))
  # assign point distances to data set
  print("(8) add distances to ffdf")
  print(system.time(data$dist <- as.ff(distances)))
  #   system.time(data[, dist := distances])
  
  
  ## export results
  print("(9) export")
  # export preprocessed data as CSV file
  print("(9.1) write.csv")
  filename <- paste0(folder, datasets[d], "/", datasets[d], ".csv")
  print(system.time(write.csv(data, 
                              file = filename, 
                              row.names = FALSE)))
  # export preprocessed data as FF structure
  print("(9.2) save.ffdf")
  foldername <- paste0(folder, datasets[d], "/")
  print(system.time(save.ffdf(data, dir = foldername)))
#   print(system.time(save(data, file = filename)))
  
  
  ## clean up unnecessary source data and free memory
  print("(10) clean up")
  # remove zip archives
  bash <- paste0("rm ", folder, datasets[d], "/*.zip")
  print(system.time(system(bash)))
  # remove single 1-minute CSV files
  bash <- paste0("rm ", folder, datasets[d], "/", sourcefiles[d], "_*.csv")
  print(system.time(system(bash)))
  # remove complete 48-hour CSV file
  bash <- paste0("rm ", folder, datasets[d], "/", datasets[d], "_.csv")
  print(system.time(system(bash)))
  # free memory
  rm(data)
  rm(distances)
  print(gc())
  # remove ff temporary files
  #bash <- paste0("rm ", folder, "fftemp/", "*")
  #print(system.time(system(bash)))
  # empty trash
  print(system.time(system("rm -rf ~/.Trash/*")))

}