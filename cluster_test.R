## initialize and load required packages
library(ggplot2)
library(gridExtra)
library(Hmisc)
library(plyr)
library(RColorBrewer)
library(reshape2)
library(RPostgreSQL)
library(scales)
library(xtable)

## initialize database connection and psql helper functions
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, 
                 host = "localhost", 
                 port = "1111", 
                 user = "postgres", 
                 password = "postgres", 
                 dbname = "pflow")

# helper files
source("psqlHelper.R")
source("ggplot2Helper.R")

## initialize ggplot and style presets
theme_set(theme_bw())


# load data
query <- "WITH hourly_trips AS (SELECT p.pid, date_part('hour', p.pdate) phour, MAX(p.tno) tno FROM dhk09.point p WHERE date_part('minute', p.pdate) = 0 GROUP BY p.pid, date_part('hour', p.pdate) ORDER BY p.pid, phour) SELECT h.pid, h.phour, t.activity FROM hourly_trips h JOIN dhk09.trip t ON h.pid = t.pid AND h.tno = t.tno ORDER BY h.pid, h.phour;"
data <- psqlQuery(con, query)

# make data wide
data <- dcast(data, pid ~ phour)

# draw sample
set.seed(2811)
data <- data[sample(nrow(data), 500), ]

# make data long
data <- melt(data, id = "pid")
names(data) <- c("pid", "phour", "activity")

# factorize activity
data$activity <- factor(data$activity, levels = c(1:6, 99))

# plot using ggplot
ggplot(data, aes(phour, pid, color = activity)) +
  geom_point(size = 1) + 
  scale_color_brewer(palette = "Set1", name = "Activity", drop = FALSE) + 
  labs(x = "Time", y = "") + 
  theme(legend.position = "right")

# plot as heatmap (acast earlier to wide data)
class(data) <- "numeric"
heatmap(data)
