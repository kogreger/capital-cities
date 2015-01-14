## initialize
# load libraries
#install.packages("maptools")
library(ggmap)
library(gridExtra)
library(Hmisc)
library(maptools)
library(rgdal)
library(rgeos)
library(RPostgreSQL)
library(sp)

# connect to database
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, 
                 host = "localhost", 
                 port = "1111", 
                 user = "postgres", 
                 password = "postgres", 
                 dbname = "pflow")
source("psqlHelper.R")

# initialize variables
datasets <- c("dhk09", "hni04", "jkt02", "mnl96")
labelsSex <- read.table("labels_all_sex.txt", sep = "\t")
labelsAge <- read.table("labels_all_age.txt", sep = "\t")
labelsOccupC <- read.table("labels_all_occupc.txt", sep = "\t")
labelsOccupC[, 2] <- gsub(" ", "\n", labelsOccupC[, 2])
labelsActivity <- read.table("labels_all_activity.txt", sep = "\t")
labelsActivity[, 2] <- gsub(" ", "\n", labelsActivity[, 2], fixed = TRUE)
labelsTModeC <- read.table("labels_all_tmodec.txt", sep = "\t")
labelsTModeC[, 2] <- gsub("-", "-\n", labelsTModeC[, 2], fixed = TRUE)

# load capital city centroids from database
query <- "SELECT gid, name, ST_X(geom) longitude, ST_Y(geom) latitude FROM geodata.capital_cities;"
capital.cities <- psqlQuery(con, query)

# load buffer rings from database
query <- "SELECT gid, ST_AsText(geom) AS wkt_geometry, name, radius FROM geodata.buffers_5km;"
buffers_raw <- psqlQuery(con, query)
row.names(buffers_raw) <- buffers_raw$gid
EPSG = make_EPSG()
wgs84 = EPSG[which(EPSG$code == 4326), "prj4"]
for (i in seq(nrow(buffers_raw))) {
  if (i == 1) {
    buffers_proj <- readWKT(buffers_raw$wkt_geometry[i], 
                            buffers_raw$gid[i], 
                            wgs84)
  }
  else {
    buffers_proj <- rbind(buffers_proj, 
                          readWKT(buffers_raw$wkt_geometry[i], 
                                  buffers_raw$gid[i], 
                                  wgs84))
  }
}
buffers_spdf = SpatialPolygonsDataFrame(buffers_proj, buffers_raw[-2])
buffers_temp <- fortify(buffers_spdf, region = "gid")
buffers <- merge(buffers_temp, buffers_spdf@data, by.x = "id", by.y = "gid")
rm(buffers_proj)
rm(buffers_raw)
rm(buffers_temp)
rm(buffers_spdf)


## maps of point distribution
# (for some reason doesn't work in loop ... therefore manually)
for (d in 1:length(datasets)) {
  # load point data from database
  query <- paste0("SELECT p.longitude, p.latitude FROM ", datasets[d], "2.point p JOIN ", datasets[d], "2.subtrip s ON p.pid = s.pid AND p.tno = s.tno AND p.sno = s.sno WHERE s.tmodec <> 97;")
  data <- psqlQuery(con, query)
  # create background map, centered on city centroid, 
  # incl. buffer rings and buffer ring labels
  centroid = as.numeric(capital.cities[capital.cities$gid == d, 
                                       c("longitude", "latitude")])
  buff_label_coeff <- cbind(c(.03, .03, -.03, .03), c(.304, .306, -.316, .312))
  longitude <- centroid[1] + seq(from = buff_label_coeff[d, 1], 
                                 to = buff_label_coeff[d, 2], 
                                 length.out = 10)
  latitude <- centroid[2] + seq(from = buff_label_coeff[d, 1], 
                                  to = buff_label_coeff[d, 2], 
                                  length.out = 10)
  buff_label_pos <- 
    data.frame(logitude = longitude, 
               latitude = latitude, 
               label = paste(seq(5, 50, 5), rep("km", 10)))
  assign(paste0("map", capitalize(datasets[d]), "Points"), 
         qmap(location = centroid, zoom = 10, 
              source = "stamen", maptype = "toner") + 
           geom_path(data = buffers, aes(x = long, y = lat), 
                     color = "blue", size = .1) + 
           geom_text(data = buff_label_pos, 
                     aes(x = longitude, y = latitude, label = label), 
                     color = "blue", angle = -45, 
                     size = 2) + 
           geom_point(data = data, aes(x = longitude, y = latitude), 
                      size = .5, color = "red", alpha = .1))
}
rm(data)
gc()


## maps of point density per hour
for (d in 1:length(datasets)) {
  # load point data from database
  query <- paste0("WITH stationary AS (SELECT pid, tno, sno, MIN(activity) activity FROM ", datasets[d], "2.subtrip WHERE tmodec = 97 GROUP BY pid, tno, sno ORDER BY pid, tno, sno) SELECT p.pid, date_part('hour', p.pdate) phour, MIN(s.activity) activity, MIN(p.longitude) longitude, MIN(p.latitude) latitude FROM ", datasets[d], "2.point p JOIN stationary s ON p.pid = s.pid AND p.tno = s.tno AND p.sno = s.sno GROUP BY p.pid, phour ORDER BY p.pid, phour;")
  data <- psqlQuery(con, query)
  # create background map, centered on city centroid, 
  # incl. buffer rings and buffer ring labels
  centroid = as.numeric(capital.cities[capital.cities$gid == d, 
                                       c("longitude", "latitude")])
  buff_label_coeff <- cbind(c(.0303, .0306, -.03, .03), c(.303, .306, -.316, .317))
  longitude <- centroid[1] + seq(from = buff_label_coeff[d, 1], 
                                 to = buff_label_coeff[d, 2], 
                                 length.out = 10)
  latitude <- centroid[2] + seq(from = buff_label_coeff[d, 1], 
                                to = buff_label_coeff[d, 2], 
                                length.out = 10)
  buff_label_pos <- 
    data.frame(logitude = longitude, 
               latitude = latitude, 
               label = paste(seq(5, 50, 5), rep("km", 10)))
  zoom_levels <- c(12, 13, 11, 12)
  for (hour in c(0, 12)) {
    assign(paste0("map", capitalize(datasets[d]), "Density", hour), 
           qmap(location = centroid, zoom = zoom_levels[d], 
                source = "stamen", maptype = "toner") + 
             geom_path(data = buffers, aes(x = long, y = lat), 
                       color = "blue", size = .1) + 
             geom_text(data = buff_label_pos, 
                       aes(x = longitude, y = latitude, label = label), 
                       color = "blue", angle = -45, 
                       size = 2) + 
             stat_density2d(
               aes(x = longitude, y = latitude, 
                   fill = ..level.., alpha = ..level..), 
               size = .01, bins = 16, 
               data = data[data$phour == hour, ], 
               geom = "polygon"
             ) + 
             scale_fill_gradient(low = "white", high = "red", guide = FALSE) +
             scale_alpha(range = c(0, .7), guide = FALSE))
  }
}
rm(data)
gc()


## maps of binned point distribution of starionarity
for (d in 1:length(datasets)) {
  # load point data from database
  query <- paste0("WITH stationary AS (SELECT pid, tno, sno, MIN(activity) activity FROM ", datasets[d], "2.subtrip WHERE tmodec = 97 GROUP BY pid, tno, sno ORDER BY pid, tno, sno) SELECT p.pid, date_part('hour', p.pdate) phour, MIN(s.activity) activity, MIN(p.longitude) longitude, MIN(p.latitude) latitude FROM ", datasets[d], "2.point p JOIN stationary s ON p.pid = s.pid AND p.tno = s.tno AND p.sno = s.sno GROUP BY p.pid, phour ORDER BY p.pid, phour;")
  data <- psqlQuery(con, query)
  # factorize activity
  data$activity <- factor(data$activity, 
                          levels = c(1:6, 99), 
                          labels = labelsActivity[, 2])
  # create background map, centered on city centroid, 
  # incl. buffer rings and buffer ring labels
  centroid = as.numeric(capital.cities[capital.cities$gid == d, 
                                       c("longitude", "latitude")])
  buff_label_coeff <- cbind(c(.03, .03, -.03, .03), c(.295, .302, -.32, .312))
  longitude <- centroid[1] + seq(from = buff_label_coeff[d, 1], 
                                 to = buff_label_coeff[d, 2], 
                                 length.out = 10)
  if(buff_label_coeff[d, 1] > 0) {
    latitude <- centroid[2] + seq(from = buff_label_coeff[d, 1], 
                                  to = buff_label_coeff[d, 2], 
                                  length.out = 10)
  } else {
    latitude <- centroid[2] - seq(from = buff_label_coeff[d, 1], 
                                  to = buff_label_coeff[d, 2], 
                                  length.out = 10)
  }
  buff_label_pos <- 
    data.frame(logitude = longitude, 
               latitude = latitude, 
               label = paste(seq(5, 50, 5), rep("km", 10)))
  map <- qmap(location = centroid, zoom = 10, 
              source = "stamen", maptype = "toner") + 
    geom_path(aes(x = long, y = lat), 
              data = buffers, color = "blue", size = .1) + 
    geom_text(data = buff_label_pos, 
              aes(x = longitude, y = latitude, label = label), 
              color = "blue", 
              angle = -45)
  # add binned stationarity locations to map
  # binwidth of .005 equals distance of:
  # N/S: 556.6m
  # E/W: dhk09 509.5m
  #      hni04 519.5m
  #      jkt02 553.4m
  #      mnl96 538.7m
  # formula: (111.32 * cos(latitude)degrees) * 5
  assign(paste0("map", datasets[d], "Bins"), map +
    stat_bin2d(
      aes(x = longitude, y = latitude, fill = activity),
      binwidth = c(.005, .005), alpha = .5,
      data = subset(data, activity %in% c("Home", "Work", "Education"))
    ) + 
    scale_fill_brewer(palette = "Set1", name = "Activity") + 
    theme(legend.justification=c(1,1), legend.position=c(1,1)))
}
rm(data)
gc()


### not run

# load point locations from database
query <- "WITH stationary AS (SELECT pid, tno, sno, MIN(activity) activity FROM dhk092.subtrip WHERE tmodec = 97 GROUP BY pid, tno, sno ORDER BY pid, tno, sno) SELECT p.pid, date_part('hour', p.pdate) phour, MIN(s.activity) activity, MIN(r.sex) sex, MIN(r.age) age, MIN(r.occupc) occupc, MIN(p.longitude) longitude, MIN(p.latitude) latitude FROM dhk092.point p JOIN stationary s ON p.pid = s.pid AND p.tno = s.tno AND p.sno = s.sno JOIN dhk092.person r ON s.pid = r.pid GROUP BY p.pid, phour ORDER BY p.pid, phour;"

