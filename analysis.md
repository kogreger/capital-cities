# Capital Cities (Urban Mobility)





## Sample Populations

This section covers the descriptive statistics of the four sample populations.




### Dhaka 2009



The data were captured on October 1-2, 2009 with a sample size of 42,111 people.

Data set description:


```r
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
##  $ sex   : Factor w/ 2 levels "Male","Female": 1 2 2 1 1 2 2 1 2 2 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 11 10 5 4 8 6 2 11 10 10 ...
##  $ occup : Factor w/ 9 levels "Unknown","Government service",..: 3 7 6 6 3 7 6 3 7 7 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 4 3 3 2 4 3 2 4 4 ...
```

```r
levels(dhk09.person$sex)
```

```
## [1] "Male"   "Female"
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

![plot of chunk plotHistDhk09Person](figure/plotHistDhk09Person.png) 


### Hanoi 2004



The data were captured on October 1-2, 2004 with a sample size of 58,018 people.

Data set description:


```r
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
##  $ sex   : Factor w/ 2 levels "Male","Female": 1 1 1 1 1 2 2 1 1 1 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 10 12 7 7 6 6 6 13 5 17 ...
##  $ occup : Factor w/ 18 levels "[Undocumented_1]",..: 2 3 5 5 8 5 5 14 14 14 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 2 2 2 1 2 2 5 5 5 ...
```

```r
levels(hni04.person$sex)
```

```
## [1] "Male"   "Female"
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

![plot of chunk plotHistHni04Person](figure/plotHistHni04Person.png) 


### Jakarta 2002



The data were captured on October 1-2, 2002 with a sample size of 297,043 people.

Data set description:


```r
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
##  $ sex   : Factor w/ 2 levels "Male","Female": 1 2 1 1 2 1 2 2 1 2 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 8 7 3 14 6 6 5 2 11 10 ...
##  $ occup : Factor w/ 19 levels "Unknown","Professor, manager, director, etc.",..: 3 1 1 6 17 5 1 1 11 8 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 6 6 2 1 3 6 6 1 2 ...
```

```r
levels(jkt02.person$sex)
```

```
## [1] "Male"   "Female"
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

![plot of chunk plotHistJkt02Person](figure/plotHistJkt02Person.png) 


### Metro Manila 1996



The data were captured on October 1-2, 1996 with a sample size of 189,335 people.

Data set description:


```r
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
##  $ sex   : Factor w/ 2 levels "Male","Female": 1 2 1 2 2 1 1 1 2 2 ...
##  $ age   : Ord.factor w/ 18 levels "[0, 5["<"[5, 10["<..: 8 8 3 3 2 10 4 3 3 4 ...
##  $ occup : Factor w/ 15 levels "Executive","Professional",..: 8 12 10 10 10 5 11 11 10 11 ...
##  $ occupc: Factor w/ 6 levels "Blue-collar",..: 2 4 3 3 3 2 3 3 3 3 ...
```

```r
levels(mnl96.person$sex)
```

```
## [1] "Male"   "Female"
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

![plot of chunk plotHistMnl96Person](figure/plotHistMnl96Person.png) 


### Comparison Across Cities

#### Sex

![plot of chunk plotHistPersonSexAll](figure/plotHistPersonSexAll.png) 

#### Age

![plot of chunk plotHistPersonAgeAll](figure/plotHistPersonAgeAll.png) 

#### Occupation

![plot of chunk plotHistPersonOccupAll](figure/plotHistPersonOccupAll.png) 

#### Occupation Group

![plot of chunk plotHistPersonOccupcAll](figure/plotHistPersonOccupcAll.png) 


## Spatio-Temporal Distribution of Trip Origins

This section covers the analysis of the distribution of the origins of trips in all four cities over space and time. For analysis purposes we generated concentric ring buffers in 5km distances from the centers of all four cities (as per the OpenStreetMap data).





## Final Steps

It's always a good idea to clean up after you're done...


```
## [1] TRUE
```

```
## [1] TRUE
```
