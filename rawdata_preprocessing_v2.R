## load necessary libraries  and source files
library(data.table)
library(rgeos)
library(geosphere)
library(rgdal)
library(RPostgreSQL)
source("psqlHelper.R")

# set working directories
setwd("~/Documents/University of Tsukuba/Capital Cities Project/capital-cities")

# initialize
folder <- "../raw_data/"
datasets <- c("dhk09", "hni04", "jkt02", "mnl96")
sourcefiles <- c("09dhk", "04hni", "02jkt", "96mnl")
chunksize = 50000
# database queries for data replacement
queries_occupc <- c("UPDATE dhk092.person SET occupc = (SELECT CASE occup WHEN 0 THEN 99 WHEN 1 THEN 2 WHEN 2 THEN 2 WHEN 3 THEN 2 WHEN 4 THEN 5 WHEN 5 THEN 3 WHEN 6 THEN 4 WHEN 7 THEN 1 WHEN 8 THEN 99 WHEN 99 THEN 99 END)", "UPDATE hni042.person SET occupc = (SELECT CASE occup WHEN 0 THEN 99 WHEN 1 THEN 2 WHEN 2 THEN 2 WHEN 3 THEN 2 WHEN 4 THEN 2 WHEN 5 THEN 2 WHEN 6 THEN 1 WHEN 7 THEN 1 WHEN 8 THEN 1 WHEN 9 THEN 1 WHEN 10 THEN 3 WHEN 11 THEN 3 WHEN 12 THEN 4 WHEN 13 THEN 5 WHEN 14 THEN 99 WHEN 15 THEN 99 WHEN 16 THEN 99 WHEN 99 THEN 99 END)", "UPDATE jkt022.person SET occupc = (SELECT CASE occup WHEN 1 THEN 2 WHEN 2 THEN 2 WHEN 3 THEN 2 WHEN 4 THEN 2 WHEN 5 THEN 2 WHEN 6 THEN 1 WHEN 7 THEN 1 WHEN 8 THEN 2 WHEN 9 THEN 1 WHEN 10 THEN 1 WHEN 11 THEN 1 WHEN 12 THEN 1 WHEN 13 THEN 1 WHEN 14 THEN 1 WHEN 15 THEN 1 WHEN 16 THEN 1 WHEN 17 THEN 99 WHEN 0 THEN 99 WHEN 99 THEN 99 END)", "UPDATE mnl962.person SET occupc = (SELECT CASE occup WHEN 1 THEN 2 WHEN 2 THEN 2 WHEN 3 THEN 1 WHEN 4 THEN 2 WHEN 5 THEN 2 WHEN 6 THEN 1 WHEN 7 THEN 2 WHEN 8 THEN 2 WHEN 9 THEN 1 WHEN 10 THEN 3 WHEN 11 THEN 3 WHEN 12 THEN 4 WHEN 13 THEN 5 WHEN 14 THEN 99 WHEN 99 THEN 99 END)")
queries_activity <- c("UPDATE dhk092.trip SET activity = (SELECT CASE purpose WHEN 1 THEN 1 WHEN 2 THEN 2 WHEN 3 THEN 3 WHEN 4 THEN 4 WHEN 5 THEN 5 WHEN 6 THEN 5 WHEN 7 THEN 5 WHEN 8 THEN 6 WHEN 9 THEN 2 WHEN 10 THEN 2 WHEN 11 THEN 99 WHEN 99 THEN 99 END)", "UPDATE hni042.trip SET activity = (SELECT CASE purpose WHEN 1 THEN 1 WHEN 2 THEN 2 WHEN 3 THEN 3 WHEN 4 THEN 2 WHEN 5 THEN 6 WHEN 6 THEN 4 WHEN 7 THEN 5 WHEN 8 THEN 5 WHEN 9 THEN 5 WHEN 10 THEN 5 WHEN 11 THEN 6 WHEN 99 THEN 99 END)", "UPDATE jkt022.trip SET activity = (SELECT CASE purpose WHEN 1 THEN 2 WHEN 2 THEN 3 WHEN 3 THEN 4 WHEN 4 THEN 2 WHEN 5 THEN 6 WHEN 6 THEN 1 WHEN 7 THEN 99 WHEN 9 THEN 99 WHEN 99 THEN 99 END)", "UPDATE mnl962.trip SET activity = (SELECT CASE purpose WHEN 1 THEN 1 WHEN 2 THEN 2 WHEN 3 THEN 3 WHEN 4 THEN 2 WHEN 5 THEN 2 WHEN 6 THEN 6 WHEN 7 THEN 5 WHEN 8 THEN 5 WHEN 9 THEN 4 WHEN 10 THEN 5 WHEN 11 THEN 6 WHEN 12 THEN 99 WHEN 99 THEN 99 END)")
queries_tmodec <- c("UPDATE dhk092.subtrip SET tmodec = (SELECT CASE tmode WHEN 1 THEN 1 WHEN 2 THEN 2 WHEN 3 THEN 3 WHEN 4 THEN 4 WHEN 5 THEN 5 WHEN 6 THEN 5 WHEN 7 THEN 7 WHEN 8 THEN 7 WHEN 9 THEN 7 WHEN 10 THEN 7 WHEN 11 THEN 6 WHEN 12 THEN 5 WHEN 13 THEN 7 WHEN 14 THEN 7 WHEN 15 THEN 4 WHEN 16 THEN 4 WHEN 17 THEN 9 WHEN 18 THEN 8 WHEN 19 THEN 7 WHEN 20 THEN 7 WHEN 97 THEN 97 WHEN 99 THEN 99 END)", "UPDATE hni042.subtrip SET tmodec = (SELECT CASE tmode WHEN 1 THEN 1 WHEN 2 THEN 2 WHEN 3 THEN 3 WHEN 4 THEN 3 WHEN 5 THEN 5 WHEN 6 THEN 5 WHEN 7 THEN 7 WHEN 8 THEN 7 WHEN 9 THEN 4 WHEN 10 THEN 4 WHEN 11 THEN 4 WHEN 12 THEN 7 WHEN 13 THEN 7 WHEN 14 THEN 7 WHEN 15 THEN 6 WHEN 16 THEN 9 WHEN 17 THEN 8 WHEN 18 THEN 10 WHEN 19 THEN 99 WHEN 97 THEN 97 WHEN 99 THEN 99 END)", "UPDATE jkt022.subtrip SET tmodec = (SELECT CASE tmode WHEN 1 THEN 1 WHEN 2 THEN 1 WHEN 3 THEN 2 WHEN 4 THEN 3 WHEN 5 THEN 5 WHEN 6 THEN 5 WHEN 7 THEN 5 WHEN 8 THEN 6 WHEN 9 THEN 8 WHEN 10 THEN 8 WHEN 11 THEN 7 WHEN 12 THEN 7 WHEN 13 THEN 7 WHEN 14 THEN 7 WHEN 15 THEN 4 WHEN 16 THEN 4 WHEN 17 THEN 4 WHEN 18 THEN 4 WHEN 19 THEN 4 WHEN 20 THEN 7 WHEN 21 THEN 99 WHEN 97 THEN 97 WHEN 99 THEN 99 END)", "UPDATE mnl962.subtrip SET tmodec = (SELECT CASE tmode WHEN 1 THEN 1 WHEN 2 THEN 4 WHEN 3 THEN 2 WHEN 4 THEN 3 WHEN 5 THEN 3 WHEN 6 THEN 7 WHEN 7 THEN 7 WHEN 8 THEN 7 WHEN 9 THEN 4 WHEN 10 THEN 4 WHEN 11 THEN 5 WHEN 12 THEN 7 WHEN 13 THEN 6 WHEN 14 THEN 6 WHEN 15 THEN 6 WHEN 16 THEN 8 WHEN 17 THEN 8 WHEN 18 THEN 9 WHEN 19 THEN 99 WHEN 97 THEN 97 WHEN 99 THEN 99 END)")

# load buffer geometries
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, 
                 host = "localhost", 
                 port = "1111", 
                 user = "postgres", 
                 password = "postgres", 
                 dbname = "pflow")
query <- "SELECT gid, ST_AsText(geom) AS wkt_geometry, name, radius FROM geodata.buffers_5km;"
buffers_temp <- psqlQuery(con, query)
row.names(buffers_temp) <- buffers_temp$gid
EPSG = make_EPSG()
prj = EPSG[which(EPSG$code == 4326), "prj4"]
for (i in seq(nrow(buffers_temp))) {
  if (i == 1) {
    buffers_proj <- readWKT(buffers_temp$wkt_geometry[i], 
                            buffers_temp$gid[i], 
                            prj)
  }
  else {
    buffers_proj <- rbind(buffers_proj, 
                          readWKT(buffers_temp$wkt_geometry[i], 
                                  buffers_temp$gid[i], 
                                  prj))
  }
}
buffers = SpatialPolygonsDataFrame(buffers_proj, buffers_temp[-2])
rm(buffers_temp)
rm(buffers_proj)


# loop through all data sets
for (d in 1:length(datasets)) {
  print(paste0("Processing: ", datasets[d]))
  ## load source data
  print("(1) load source data")
  # extract CSV files from ZIP archives
  # [-j to junk subdirectories; -d to specify output path]
  print("(1.1) unzip")
  bash <- paste0("unzip -j '", folder, datasets[d], "/*.zip' ", 
                 "-d ", folder, datasets[d], "/")
  print(system.time(system(bash)))
  # concatenate single 1-minute CSV files into one complete 48-hour CSV file
  print("(1.2) cat")
  bash <- paste0("cat ", folder, datasets[d], "/", sourcefiles[d], "_*.csv ", 
                 "> ", folder, datasets[d], "/", datasets[d], "_.csv")
  print(system.time(system(bash)))
  # load data set from CSV
  print("(1.3) fread")
  filename <- paste0(folder, datasets[d], "/", datasets[d], "_.csv")
  print(system.time(data <- fread(filename, 
                                  sep = ",", 
                                  header = FALSE, 
                                  na.strings = c(""), 
                                  stringsAsFactors = FALSE, 
                                  verbose = TRUE)))
  # provide meaningful column names
  print("(1.4) setnames")
  print(system.time(setnames(data, c("pid", "tno", "sno", "pdate", "lon", 
                                     "lat", "sex", "age", "padd", "occup", 
                                     "purpose", "magfac", "magfac2", "tmode"))))
  # add puid as unique point identifier
  print("(1.5) puid")
  print(system.time(data[, puid := seq_len(nrow(data))]))
  # order data by pid and puid
  print("(1.6) setkeyv")
  print(system.time(setkeyv(data, c("pid", "pdate"))))
  
  ## save data as intermediary chunks of 50,000 pids each
  print("(2) save intermediary chunks")
  # extract distinct pids
  print("(2.1) extract distinct pids")
  print(system.time(pids <- data[, length(puid), by = pid]))
  print("(2.2) assign chunks of 50,000 pids each")
  chnk <- ceiling(dim(pids)[1] / chunksize)
  print(system.time(pids[, chunk := rep(1:chnk, each = chunksize)]))
  print("(2.3) setkeyv")
  print(system.time(setkeyv(pids, c("pid"))))
  print("(2.4) extract puid and pid combinations")
  print(system.time(puids <- data[, list(puid, pid)]))
  print("(2.5) setkeyv")
  print(system.time(setkeyv(puids, c("pid"))))
  print("(2.6) merge chunk information to puid data set")
  print(system.time(chunks <- puids[pids]$chunk))
  print("(2.6) assign chunk information to main data set")
  print(system.time(data[, chunk := chunks]))
  print("(2.7) setkeyv")
  print(system.time(setkeyv(data, c("chunk"))))
  print("(2.8) write data chunks to disk")
  max_chunk <- max(chunks)
  for (c in 1:max_chunk) {
    filename <- paste0(folder, datasets[d], "/", datasets[d], "-", c, ".csv")
    print(paste0(" writing chunk ", c, " to file ", filename))
    print(system.time(write.table(data[J(c)], 
                                  file = filename, 
                                  row.names = FALSE, 
                                  col.names = FALSE,
                                  sep = ",")))
  }
  print("(2.9) clean up to free some memory")
#   # remove zip archives
#   bash <- paste0("rm ", folder, datasets[d], "/*.zip")
#   print(system.time(system(bash)))
#   # remove single 1-minute CSV files
#   bash <- paste0("rm ", folder, datasets[d], "/", sourcefiles[d], "_*.csv")
#   print(system.time(system(bash)))
#   # remove complete 48-hour CSV file
#   bash <- paste0("rm ", folder, datasets[d], "/", datasets[d], "_.csv")
#   print(system.time(system(bash)))
  # free memory
  rm(data)
  rm(pids)
  rm(puids)
  rm(chunks)
  print(gc())
  
  ## process data chunks
  print("(3) process data")
  # loop through data set chunks
  for (c in 1:max_chunk) {
    print(paste0("processing chunk ", c))
    # load data set from CSV
    print("(3.1) fread")
    filename <- paste0(folder, datasets[d], "/", datasets[d], "-", c, ".csv")
    print(system.time(data <- fread(filename, 
                                    sep = ",", 
                                    header = FALSE, 
                                    na.strings = c(""), 
                                    stringsAsFactors = FALSE, 
                                    verbose = TRUE)))
    # provide meaningful column names
    print("(3.2) setnames")
    print(system.time(setnames(data, c("chunk", "pid", "tno", "sno", "pdate", 
                                       "longitude", "latitude", "sex", "age", 
                                       "padd", "occup", "purpose", "magfac", 
                                       "magfac2", "tmode", "puid"))))

    ## calculate segment distances
    print("(3.3) segment distances")
    pointDistances <- function (dat, lon, lat) {
      # extract point coordinates
      print("(3.3.1) pts")
      print(system.time(pts <- dat[, list(longitude, latitude)]))
      # calculate distances between point positions and subsequent point positions
      print("(3.3.2) distHaversine")
      print(system.time(dist <- distHaversine(p1 = pts[-nrow(data), ], 
                                              p2 = pts[-1, ])))
      # append 0 distance to last point and return
      print("(3.3.3) append")
      print(system.time(return(c(dist, as.numeric(0)))))
    }
    system.time(distances <- pointDistances(data, longitude, latitude))
    # assign point distances to data set
    print("(3.4) add distances to data.table")
    system.time(data[, dist := distances])
    
    ## fix last segment distance
    print("(4) fix last segment distance")
    # detect max puid
    print("(4.1) maxpuids")
    print(system.time(maxpuids <- data[, list(max = max(puid)), by = pid]))
    # set segment distances to 0
    print("(4.2) dist := 0")
    print(system.time(data[puid %in% maxpuids[[2]], dist := 0]))
    
    ## calculate buffer zone
    print("(5) calculate buffer zone")
    # extract point coordinates
    print("(5.1) coordinates")
    print(system.time(coordinates(data) <- as.data.frame(data[, list(longitude, 
                                                                     latitude)])))
    proj4string(data) <- proj4string(buffers)
    # overlay with ring buffer
    print("(5.2) buff := ")
    print(system.time(data$buff <- over(data, buffers)$radius))
    # convert to data.table
    print("(5.3) as.data.table")
    print(system.time(data <- as.data.table(as.data.frame(data))))
    # remove unnecessary coordinates
    print("(5.4) remove unnecessary coordinates")
    print(system.time(data[, longitude.1 := NULL]))
    print(system.time(data[, latitude.1 := NULL]))
    
    print("(6) split and upload to database")
    # create schema (if first chunk)
    print("(6.1) CREATE SCHEMA")
    query <- paste0("CREATE SCHEMA ", datasets[d], "2 AUTHORIZATION postgres;")
    if (c == 1) {
      print(system.time(dbSendQuery(con, query)))
      overwrite = TRUE
      append = FALSE
    } else {
      print("not necessary")
      overwrite = FALSE
      append = TRUE
    }
    # upload data from memory
    print("(6.2) point")
    print("(6.2.1) dbWriteTable")
    print(system.time(psqlPutTable(con, 
                                   paste0(datasets[d], "2"), "point", 
                                   as.data.frame(data[, list(pid, tno, sno, pdate, 
                                                             longitude, latitude, 
                                                             puid, dist, buff)]),
                                   overwrite = overwrite, 
                                   append = append)))
    print("(6.3) person")
    # extract data for distinct pids
    print("(6.3.1) by = pid")
    print(system.time(person <- data[, list(sex = min(sex), age = min(age), 
                                            padd = min(padd), occup = min(occup), 
                                            magfac = min(magfac), 
                                            magfac2 = min(magfac2), 
                                            dist = sum(dist)), 
                                     by = pid]))
    print("(6.3.2) dbWriteTable")
    print(system.time(psqlPutTable(con, 
                                   paste0(datasets[d], "2"), "person", 
                                   as.data.frame(person[, list(pid, age, sex, 
                                                               padd, occup, magfac, 
                                                               magfac2, dist)]),
                                   overwrite = overwrite, 
                                   append = append)))
    print("(6.4) trip")
    # extract data for distinct tnos
    print("(6.4.1) by = tno")
    print(system.time(trip <- data[, list(purpose = min(purpose), dist = sum(dist), 
                                          puid_s = min(puid), puid_e = max(puid), 
                                          pdate_s = min(pdate), pdate_e = max(pdate)), 
                                   by = list(pid, tno)]))
    print("(6.4.2) dbWriteTable")
    print(system.time(psqlPutTable(con, 
                                   paste0(datasets[d], "2"), "trip", 
                                   as.data.frame(trip[, list(pid, tno, purpose, 
                                                             dist, puid_s, puid_e, 
                                                             pdate_s, pdate_e)]),
                                   overwrite = overwrite, 
                                   append = append)))
    print("(6.5) subtrip")
    # extract data for distinct tnos
    print("(6.5.1) by = sno")
    print(system.time(subtrip <- data[, list(tmode = min(tmode), purpose = min(purpose), 
                                             dist = sum(dist), puid_s = min(puid), 
                                             puid_e = max(puid), pdate_s = min(pdate), 
                                             pdate_e = max(pdate)), 
                                      by = list(pid, tno, sno)]))
    print("(6.5.2) dbWriteTable")
    print(system.time(psqlPutTable(con, 
                                   paste0(datasets[d], "2"), "subtrip", 
                                   as.data.frame(subtrip[, list(pid, tno, sno, 
                                                                tmode, purpose, 
                                                                dist, puid_s, 
                                                                puid_e, pdate_s, 
                                                                pdate_e)]),
                                   overwrite = overwrite, 
                                   append = append)))
    
#     ## export preprocessed data as CSV file
#     print("(6.6) write.csv")
#     filename <- paste0(folder, datasets[d], "/", datasets[d], "_", c, ".csv")
#     print(system.time(write.table(data, 
#                                   file = filename, 
#                                   row.names = FALSE, 
#                                   col.names = FALSE,
#                                   sep = ",")))
    
    ## clean up unnecessary source data and free memory
    print("(7) clean up")
    # free memory
    rm(data)
    rm(distances)
    rm(maxpuids)
    rm(person)
    rm(subtrip)
    rm(trip)
    print(gc())
    # empty trash
    #print(system.time(system("rm -rf ~/.Trash/*")))
  }
  
#   ## combine chunks to output data file
#   print("(8) combine chunk files")
#   # concatenate chunks
#   print("(8.1) cat")
#   bash <- paste0("cat ", folder, datasets[d], "/", datasets[d], "_*.csv ", 
#                  "> ", folder, datasets[d], "/", datasets[d], ".csv")
#   print(system.time(system(bash)))
#   # remove chunk files
#   print("(8.2) remove chunks (1)")
#   bash <- paste0("rm ", folder, datasets[d], "/", datasets[d], "_*.csv")
#   print(system.time(system(bash)))
#   print("(8.2) remove chunks (2)")
#   bash <- paste0("rm ", folder, datasets[d], "/", datasets[d], "-*.csv")
#   print(system.time(system(bash)))
  
  
  ## post-process database
  print("(9) post-process database")
  # create PostGIS geometry
  print("(9.1) point: geometry")
  query <- paste0("ALTER TABLE ", datasets[d], "2.point ADD COLUMN geom geometry(Point,4326);")
  print(system.time(dbSendQuery(con, query)))
  query <- paste0("UPDATE ", datasets[d], "2.point SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);")
  print(system.time(dbSendQuery(con, query)))
  # convert pdate to timestamp without time zone
  print("(9.2) point: pdate")
  query <- paste0("ALTER TABLE ", datasets[d], "2.point ALTER COLUMN pdate TYPE TIMESTAMP WITHOUT TIME ZONE USING to_timestamp(pdate, 'YYYY/MM/DD HH24:MI:SS');")
  print(system.time(dbSendQuery(con, query)))
  # create occupation group
  print("(9.3) person: occupc")
  query <- paste0("ALTER TABLE ", datasets[d], "2.person ADD COLUMN occupc smallint;")
  print(system.time(dbSendQuery(con, query)))
  query <- queries_occupc[d]
  print(system.time(dbSendQuery(con, query)))
  # convert pdate to timestamp without time zone
  print("(9.4) trip: pdate")
  query <- paste0("ALTER TABLE ", datasets[d], "2.trip ALTER COLUMN pdate_s TYPE TIMESTAMP WITHOUT TIME ZONE USING to_timestamp(pdate_s, 'YYYY/MM/DD HH24:MI:SS'), ALTER COLUMN pdate_e TYPE TIMESTAMP WITHOUT TIME ZONE USING to_timestamp(pdate_e, 'YYYY/MM/DD HH24:MI:SS');")
  print(system.time(dbSendQuery(con, query)))
  # create activity
  print("(9.5) trip: activity")
  query <- paste0("ALTER TABLE ", datasets[d], "2.trip ADD COLUMN activity smallint;")
  print(system.time(dbSendQuery(con, query)))
  query <- queries_activity[d]
  print(system.time(dbSendQuery(con, query)))
  # convert pdate to timestamp without time zone
  print("(9.6) subtrip: pdate")
  query <- paste0("ALTER TABLE ", datasets[d], "2.subtrip ALTER COLUMN pdate_s TYPE TIMESTAMP WITHOUT TIME ZONE USING to_timestamp(pdate_s, 'YYYY/MM/DD HH24:MI:SS'), ALTER COLUMN pdate_e TYPE TIMESTAMP WITHOUT TIME ZONE USING to_timestamp(pdate_e, 'YYYY/MM/DD HH24:MI:SS');")
  print(system.time(dbSendQuery(con, query)))
  # create activity
  print("(9.7) subtrip: activity")
  query <- paste0("ALTER TABLE ", datasets[d], "2.subtrip ADD COLUMN activity smallint;")
  print(system.time(dbSendQuery(con, query)))
  query <- gsub("trip", "subtrip", queries_activity[d])
  print(system.time(dbSendQuery(con, query)))
  # create tmodec
  print("(9.8) subtrip: tmodec")
  query <- paste0("ALTER TABLE ", datasets[d], "2.subtrip ADD COLUMN tmodec smallint;")
  print(system.time(dbSendQuery(con, query)))
  query <- queries_tmodec[d]
  print(system.time(dbSendQuery(con, query)))
  # fix activity of stationarity events
  print("(9.9) fix activity")
  query <- paste0("UPDATE ", datasets[d], "2.subtrip s SET activity = (SELECT activity FROM ", datasets[d], "2.trip t WHERE t.pid = s.pid AND t.tno = (s.tno - 1) LIMIT 1) WHERE s.tmode = 97; UPDATE ", datasets[d], "2.subtrip s SET activity = (SELECT CASE WHEN (SELECT activity FROM ", datasets[d], "2.trip t WHERE t.pid = s.pid AND t.tno = (s.tno + 1) LIMIT 1) > 1 THEN 1 END) WHERE s.tno = 1 AND s.tmode = 97;")
  print(system.time(dbSendQuery(con, query)))
  query <- paste0("WITH stationary AS (SELECT pid, tno, sno, activity, tmode FROM ", datasets[d], "2.subtrip WHERE tmode = 97) UPDATE ", datasets[d], "2.trip t SET activity = (SELECT s1.activity FROM stationary s1 WHERE t.pid = s1.pid AND t.tno = s1.tno LIMIT 1) FROM stationary s2 WHERE t.pid = s2.pid AND t.tno = s2.tno;")
  print(system.time(dbSendQuery(con, query)))
  # generate indices
  print("(9.9) CREATE INDEX")
  print("(9.9.1) point")
  query <- paste0("CREATE UNIQUE INDEX idx_PUID_", datasets[d], "2_point ON ", datasets[d], "2.point USING btree (puid); CREATE INDEX idx_PID_", datasets[d], "2_point ON ", datasets[d], "2.point USING btree (pid); CREATE INDEX idx_TNO_", datasets[d], "2_point ON ", datasets[d], "2.point USING btree (tno); CREATE INDEX idx_SNO_", datasets[d], "2_point ON ", datasets[d], "2.point USING btree (sno); CREATE INDEX idx_PDATE_", datasets[d], "2_point ON ", datasets[d], "2.point USING btree (pdate); CREATE INDEX idx_GEOM_", datasets[d], "2_point ON ", datasets[d], "2.point USING gist (geom); CREATE INDEX idx_BUFF_", datasets[d], "2_point ON ", datasets[d], "2.point USING btree (buff);")
  print(system.time(dbSendQuery(con, query)))
  print("(9.9.2) person")
  query <- paste0("CREATE INDEX idx_PID_", datasets[d], "2_person ON ", datasets[d], "2.person USING btree (pid); CREATE INDEX idx_OCCUP_", datasets[d], "2_person ON ", datasets[d], "2.person USING btree (occup); CREATE INDEX idx_OCCUPC_", datasets[d], "2_person ON ", datasets[d], "2.person USING btree (occupc); CREATE INDEX idx_SEX_", datasets[d], "2_person ON ", datasets[d], "2.person USING btree (sex); CREATE INDEX idx_AGE_", datasets[d], "2_person ON ", datasets[d], "2.person USING btree (age);")
  print(system.time(dbSendQuery(con, query)))
  print("(9.9.3) subtrip")
  query <- paste0("CREATE INDEX idx_PID_", datasets[d], "2_subtrip ON ", datasets[d], "2.subtrip USING btree (pid); CREATE INDEX idx_TNO_", datasets[d], "2_subtrip ON ", datasets[d], "2.subtrip USING btree (tno); CREATE INDEX idx_SNO_", datasets[d], "2_subtrip ON ", datasets[d], "2.subtrip USING btree (sno); CREATE INDEX idx_TMODE_", datasets[d], "2_subtrip ON ", datasets[d], "2.subtrip USING btree (tmode); CREATE INDEX idx_TMODEC_", datasets[d], "2_subtrip ON ", datasets[d], "2.subtrip USING btree (tmodec); CREATE INDEX idx_ACTIVITY_", datasets[d], "2_subtrip ON ", datasets[d], "2.subtrip USING btree (activity);")
  print(system.time(dbSendQuery(con, query)))
  print("(9.9.4) trip")
  query <- paste0("CREATE INDEX idx_PID_", datasets[d], "2_trip ON ", datasets[d], "2.trip USING btree (pid); CREATE INDEX idx_TNO_", datasets[d], "2_trip ON ", datasets[d], "2.trip USING btree (tno); CREATE INDEX idx_PURPOSE_", datasets[d], "2_trip ON ", datasets[d], "2.trip USING btree (purpose); CREATE INDEX idx_ACTIVITY_", datasets[d], "2_trip ON ", datasets[d], "2.trip USING btree (activity);")
  print(system.time(dbSendQuery(con, query)))
  # generate constraints
  print("(9.10) ADD CONSTRAINT")
  query <- paste0("ALTER TABLE ", datasets[d], "2.person ADD CONSTRAINT pkey_PID_", datasets[d], "2_person PRIMARY KEY(pid); ALTER TABLE ", datasets[d], "2.point ADD CONSTRAINT pkey_PUID_", datasets[d], "2_point PRIMARY KEY(puid), ADD CONSTRAINT fkey_PID_person_", datasets[d], "2_point FOREIGN KEY (pid) REFERENCES ", datasets[d], "2.person (pid) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE; ALTER TABLE ", datasets[d], "2.subtrip ADD CONSTRAINT pkey_PID_TNO_SNO_", datasets[d], "2_subtrip PRIMARY KEY(pid, tno, sno), ADD CONSTRAINT fkey_PID_person_", datasets[d], "2_subtrip FOREIGN KEY (pid) REFERENCES ", datasets[d], "2.person (pid) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE; ALTER TABLE ", datasets[d], "2.trip ADD CONSTRAINT pkey_PID_TNO_", datasets[d], "2_trip PRIMARY KEY(pid, tno), ADD CONSTRAINT fkey_PID_person_", datasets[d], "2_trip FOREIGN KEY (pid) REFERENCES ", datasets[d], "2.person (pid) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE;")
  print(system.time(dbSendQuery(con, query)))
  # analyze database tables
  print("(9.11) ANALYZE")
  query <- paste0("ANALYZE ", datasets[d], "2.person; ANALYZE ", datasets[d], "2.point; ANALYZE ", datasets[d], "2.subtrip; ANALYZE ", datasets[d], "2.trip;")
  print(system.time(dbSendQuery(con, query)))
}


## clean up database connection and database driver
print("(10) close database connection")
dbDisconnect(con)
dbUnloadDriver(drv)