# Capital Cities (Urban Mobility)

## Descriptive Statistics 


```r
## initialize and load required packages
library(RPostgreSQL)
```

```
## Loading required package: DBI
```

```r
library(Unicode)

## initialize database connection and psql helper functions
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, 
                 host = "localhost", 
                 port = "1111", 
                 user = "postgres", 
                 password = "postgres", 
                 dbname = "pflow")

source("psqlHelper.R")
```

### Sample Populations

This section covers the descriptive statistics of the four sample populations.


```r
# load variable labels
labelsSex <- read.table("labels_all_sex.txt", sep = "\t")
labelsAge <- read.table("labels_all_age.txt", sep = "\t")
labelsOccupC <- read.table("labels_all_occupc.txt", sep = "\t")
labelsdhk09Occup <- read.table("labels_dhk09_occup.txt", sep = "\t")
labelshni04Occup <- read.table("labels_hni04_occup.txt", sep = "\t")
labelsjkt02Occup <- read.table("labels_jkt02_occup.txt", sep = "\t")
labelsmnl96Occup <- read.table("labels_mnl96_occup.txt", sep = "\t")
```

#### Dhaka 2009


```r
## dhk09
dhk09.person <- psqlGetTable(con, "dhk09", "person")
# remove unnecessary columns (padd, magfac, magfac2)
dhk09.person <- dhk09.person[, c("pid", "sex", "age", "occup", "occupc")]
# factorize pid
dhk09.person$pid <- factor(dhk09.person$pid)
# remove NA sex (=0) and factorize
dhk09.person <- dhk09.person[dhk09.person$sex != 0, ]
dhk09.person$sex <- factor(dhk09.person$sex, 
                           levels = c(1, 2), 
                           labels = labelsSex[, 2])
# factorize age (ordered)
dhk09.person$age <- factor(dhk09.person$age, 
                           levels = c(0:17), 
                           ordered = TRUE, 
                           labels = labelsAge[, 2])
# factorize occupation
dhk09.person$occup <- factor(dhk09.person$occup, 
                             levels = c(0:8), 
                             labels = labelsdhk09Occup[, 2])
# factorize occupation class
dhk09.person$occupc <- factor(dhk09.person$occupc, 
                              levels = c(1:5, 99), 
                              labels = labelsOccupC[, 2])

names(dhk09.person)
```

```
## [1] "pid"    "sex"    "age"    "occup"  "occupc"
```

```r
str(dhk09.person)
```

```
## 'data.frame':	42111 obs. of  5 variables:
##  $ pid   : Factor w/ 42114 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ sex   : Factor w/ 2 levels "male","female": 1 2 2 1 1 2 2 1 2 2 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 11 10 5 4 8 6 2 11 10 10 ...
##  $ occup : Factor w/ 9 levels "Unknown","Government service",..: 3 7 6 6 3 7 6 3 7 7 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 4 3 3 2 4 3 2 4 4 ...
```

```r
levels(dhk09.person$sex)
```

```
## [1] "male"   "female"
```

```r
levels(dhk09.person$age)
```

```
##  [1] "[0, 5["    "[5, 10["   "[10, 15["  "[15, 20["  "[20, 25[" 
##  [6] "[25, 30["  "[30, 35["  "[35, 40["  "[40, 45["  "[45, 50[" 
## [11] "[50, 55["  "[55, 60["  "[60, 65["  "[65, 70["  "[70, 75[" 
## [16] "[75, 80["  "[80, 85["  "[85, Inf["
```

```r
levels(dhk09.person$occup)
```

```
## [1] "Unknown"              "Government service"   "Private service"     
## [4] "Business"             "Unemployed"           "Student"             
## [7] "Housewife"            "Agriculture, farming" "Others (specify)"
```

```r
levels(dhk09.person$occupc)
```

```
## [1] "Blue-collar"             "White-collar"           
## [3] "Student"                 "Housewife, househusband"
## [5] "Unemployed, retired"     "Other, unknown"
```

#### Hanoi 2004


```r
## hni04
hni04.person <- psqlGetTable(con, "hni04", "person")
# remove unnecessary columns (padd, magfac, magfac2)
hni04.person <- hni04.person[, c("pid", "sex", "age", "occup", "occupc")]
# factorize pid
hni04.person$pid <- factor(hni04.person$pid)
# factorize sex
hni04.person$sex <- factor(hni04.person$sex, 
                           levels = c(1, 2), 
                           labels = labelsSex[, 2])
# factorize age (ordered)
hni04.person$age <- factor(hni04.person$age, 
                           levels = c(0:17), 
                           ordered = TRUE, 
                           labels = labelsAge[, 2])
# factorize occupation
hni04.person$occup <- factor(hni04.person$occup, 
                             levels = c(0:16, 99), 
                             labels = labelshni04Occup[, 2])
# factorize occupation class
hni04.person$occupc <- factor(hni04.person$occupc, 
                              levels = c(1:5, 99), 
                              labels = labelsOccupC[, 2])

names(hni04.person)
```

```
## [1] "pid"    "sex"    "age"    "occup"  "occupc"
```

```r
str(hni04.person)
```

```
## 'data.frame':	58018 obs. of  5 variables:
##  $ pid   : Factor w/ 58018 levels "2","3","4","5",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ sex   : Factor w/ 2 levels "male","female": 1 1 1 1 1 2 2 1 1 1 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 10 12 7 7 6 6 6 13 5 17 ...
##  $ occup : Factor w/ 18 levels "[Undocumented_1]",..: 2 3 5 5 8 5 5 14 14 14 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 2 2 2 1 2 2 5 5 5 ...
```

```r
levels(hni04.person$sex)
```

```
## [1] "male"   "female"
```

```r
levels(hni04.person$age)
```

```
##  [1] "[0, 5["    "[5, 10["   "[10, 15["  "[15, 20["  "[20, 25[" 
##  [6] "[25, 30["  "[30, 35["  "[35, 40["  "[40, 45["  "[45, 50[" 
## [11] "[50, 55["  "[55, 60["  "[60, 65["  "[65, 70["  "[70, 75[" 
## [16] "[75, 80["  "[80, 85["  "[85, Inf["
```

```r
levels(hni04.person$occup)
```

```
##  [1] "[Undocumented_1]"                      
##  [2] "Leader of branches, units"             
##  [3] "Professional"                          
##  [4] "Technical and associate professional"  
##  [5] "Clerical worker"                       
##  [6] "Service worker, shop, market sales"    
##  [7] "Skilled agriculture, forestry, fishery"
##  [8] "Craft and related trades"              
##  [9] "Plant, machine operator, assembler"    
## [10] "Elementary occupation"                 
## [11] "Elementary student"                    
## [12] "High school & university student"      
## [13] "Housewife"                             
## [14] "Jobless, retired"                      
## [15] "[Undocumented_2]"                      
## [16] "[Undocumented_3]"                      
## [17] "[Undocumented_4]"                      
## [18] "Unknown"
```

```r
levels(hni04.person$occupc)
```

```
## [1] "Blue-collar"             "White-collar"           
## [3] "Student"                 "Housewife, househusband"
## [5] "Unemployed, retired"     "Other, unknown"
```

#### Jakarta 2002


```r
## jkt02
jkt02.person <- psqlGetTable(con, "jkt02", "person")
# remove unnecessary columns (padd, magfac, magfac2)
jkt02.person <- jkt02.person[, c("pid", "sex", "age", "occup", "occupc")]
# factorize pid
jkt02.person$pid <- factor(jkt02.person$pid)
# factorize sex
jkt02.person$sex <- factor(jkt02.person$sex, 
                           levels = c(1, 2), 
                           labels = labelsSex[, 2])
# factorize age (ordered, no 0)
jkt02.person$age <- factor(jkt02.person$age, 
                           levels = c(0:17), 
                           ordered = TRUE, 
                           labels = labelsAge[, 2])
# factorize occupation
jkt02.person$occup <- factor(jkt02.person$occup, 
                             levels = c(0:17, 99), 
                             labels = labelsjkt02Occup[, 2])
# factorize occupation class
jkt02.person$occupc <- factor(jkt02.person$occupc, 
                              levels = c(1:5, 99), 
                              labels = labelsOccupC[, 2])

names(jkt02.person)
```

```
## [1] "pid"    "sex"    "age"    "occup"  "occupc"
```

```r
str(jkt02.person)
```

```
## 'data.frame':	297043 obs. of  5 variables:
##  $ pid   : Factor w/ 297043 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ sex   : Factor w/ 2 levels "male","female": 1 2 1 1 2 1 2 2 1 2 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 8 7 3 14 6 6 5 2 11 10 ...
##  $ occup : Factor w/ 19 levels "Unknown","Professor, manager, director, etc.",..: 3 1 1 6 17 5 1 1 11 8 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 6 6 2 1 3 6 6 1 2 ...
```

```r
levels(jkt02.person$sex)
```

```
## [1] "male"   "female"
```

```r
levels(jkt02.person$age)
```

```
##  [1] "[0, 5["    "[5, 10["   "[10, 15["  "[15, 20["  "[20, 25[" 
##  [6] "[25, 30["  "[30, 35["  "[35, 40["  "[40, 45["  "[45, 50[" 
## [11] "[50, 55["  "[55, 60["  "[60, 65["  "[65, 70["  "[70, 75[" 
## [16] "[75, 80["  "[80, 85["  "[85, Inf["
```

```r
levels(jkt02.person$occup)
```

```
##  [1] "Unknown"                                  
##  [2] "Professor, manager, director, etc."       
##  [3] "Industry owner, retail owner, etc."       
##  [4] "Engineer, doctor, accountant, pilot, etc."
##  [5] "Teacher, lecturer"                        
##  [6] "Administration staff"                     
##  [7] "Technician"                               
##  [8] "Waitress"                                 
##  [9] "Vedor, salesman, etc."                    
## [10] "Handyman (carpenter, jewelry)"            
## [11] "Construction, station, port, warehouse"   
## [12] "Laborer"                                  
## [13] "Public transport driver"                  
## [14] "Private driver"                           
## [15] "Housekeeper, office boy, gardener, etc."  
## [16] "Farmer, fisherman, etc."                  
## [17] "Security guard"                           
## [18] "Others"                                   
## [19] "Unknown_2"
```

```r
levels(jkt02.person$occupc)
```

```
## [1] "Blue-collar"             "White-collar"           
## [3] "Student"                 "Housewife, househusband"
## [5] "Unemployed, retired"     "Other, unknown"
```

#### Metro Manila 1996


```r
## mnl96
mnl96.person <- psqlGetTable(con, "mnl96", "person")
# remove unnecessary columns (padd, magfac, magfac2)
mnl96.person <- mnl96.person[, c("pid", "sex", "age", "occup", "occupc")]
# factorize pid
mnl96.person$pid <- factor(mnl96.person$pid)
# factorize sex
mnl96.person$sex <- factor(mnl96.person$sex, 
                           levels = c(1, 2), 
                           labels = labelsSex[, 2])
# factorize age (ordered, no 0)
mnl96.person$age <- factor(mnl96.person$age, 
                           levels = c(0:17), 
                           ordered = TRUE, 
                           labels = labelsAge[, 2])
# factorize occupation
mnl96.person$occup <- factor(mnl96.person$occup, 
                             levels = c(1:14, 99), 
                             labels = labelsmnl96Occup[, 2])
# factorize occupation class
mnl96.person$occupc <- factor(mnl96.person$occupc, 
                              levels = c(1:5, 99), 
                              labels = labelsOccupC[, 2])

names(mnl96.person)
```

```
## [1] "pid"    "sex"    "age"    "occup"  "occupc"
```

```r
str(mnl96.person)
```

```
## 'data.frame':	189335 obs. of  5 variables:
##  $ pid   : Factor w/ 189335 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ sex   : Factor w/ 2 levels "male","female": 1 2 1 2 2 1 1 1 2 2 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 8 8 3 3 2 10 4 3 3 4 ...
##  $ occup : Factor w/ 15 levels "Executive","Professional",..: 8 12 10 10 10 5 11 11 10 11 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 4 3 3 3 2 3 3 3 3 ...
```

```r
levels(mnl96.person$sex)
```

```
## [1] "male"   "female"
```

```r
levels(mnl96.person$age)
```

```
##  [1] "[0, 5["    "[5, 10["   "[10, 15["  "[15, 20["  "[20, 25[" 
##  [6] "[25, 30["  "[30, 35["  "[35, 40["  "[40, 45["  "[45, 50[" 
## [11] "[50, 55["  "[55, 60["  "[60, 65["  "[65, 70["  "[70, 75[" 
## [16] "[75, 80["  "[80, 85["  "[85, Inf["
```

```r
levels(mnl96.person$occup)
```

```
##  [1] "Executive"    "Professional" "Technician"   "Clerical"    
##  [5] "Service"      "Farmer"       "Trade"        "Operator"    
##  [9] "Laborer"      "Pupil"        "Student"      "Housewife"   
## [13] "Jobless"      "Others"       "Unknown"
```

```r
levels(mnl96.person$occupc)
```

```
## [1] "Blue-collar"             "White-collar"           
## [3] "Student"                 "Housewife, househusband"
## [5] "Unemployed, retired"     "Other, unknown"
```


# Final Steps

It's always a good idea to clean up after you're done...


```r
## clean up database connection and database driver
dbDisconnect(con)
```

```
## [1] TRUE
```

```r
dbUnloadDriver(drv)
```

```
## [1] TRUE
```
