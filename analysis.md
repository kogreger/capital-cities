# Capital Cities (Urban Mobility)

Capital Cities (Urban Mobility)
===============================







## Sample Populations

This section covers the descriptive statistics of the four sample populations.

### Dhaka 2009



The data were captured on October 1-2, 2009 with a sample size of 42,111 people. The personal data occupies 3.5 Mb of memory.

Data set description:


```r
describe(dhk09.person)
```

```
## dhk09.person 
## 
##  6  Variables      42111  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##   42111       0   42111 
## 
## lowest : 1     2     3     4     5    
## highest: 47486 47489 47491 47492 47493 
## ---------------------------------------------------------------------------
## sex 
##       n missing  unique 
##   42111       0       2 
## 
## Male (22541, 54%), Female (19570, 46%) 
## ---------------------------------------------------------------------------
## age 
##       n missing  unique 
##   42111       0      18 
## 
##           [0, 5[ [5, 10[ [10, 15[ [15, 20[ [20, 25[ [25, 30[ [30, 35[
## Frequency    319    3555     4567     4236     4949     5161     4133
## %              1       8       11       10       12       12       10
##           [35, 40[ [40, 45[ [45, 50[ [50, 55[ [55, 60[ [60, 65[ [65, 70[
## Frequency     4031     3138     2693     2123     1363      972      476
## %               10        7        6        5        3        2        1
##           [70, 75[ [75, 80[ [80, 85[ [85, Inf[
## Frequency      269       97       21         8
## %                1        0        0         0
## ---------------------------------------------------------------------------
## occup 
##       n missing  unique 
##   42111       0       9 
## 
## Unknown (865, 2%), Government service (1925, 5%) 
## Private service (6901, 16%) 
## Business (6468, 15%), Unemployed (841, 2%) 
## Student (13861, 33%), Housewife (10571, 25%) 
## Agriculture, farming (31, 0%) 
## Others (specify) (648, 2%) 
## ---------------------------------------------------------------------------
## occupc 
##       n missing  unique 
##   42111       0       6 
## 
## Blue-collar (31, 0%), White-collar (15294, 36%) 
## Student (13861, 33%) 
## Housewife, househusband (10571, 25%) 
## Unemployed, retired (841, 2%) 
## Other, unknown (1513, 4%) 
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##   42111       0   41963   11584    1250    1893    3713    7839   15293 
##     .90     .95 
##   25342   33859 
## 
## lowest :      0.00     14.97     30.46     55.55     61.39
## highest: 126406.08 126643.55 135625.47 152718.42 182414.31 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistDhk09Person](./analysis_files/figure-html/plotHistDhk09Person.png) 

### Hanoi 2004



The data were captured on October 1-2, 2004 with a sample size of 34,846 people.  The personal data occupies 2.8 Mb of memory.

Data set description:


```r
describe(hni04.person)
```

```
## hni04.person 
## 
##  6  Variables      34846  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##   34846       0   34846 
## 
## lowest : 2     3     4     5     6    
## highest: 47486 47489 47491 47492 47493 
## ---------------------------------------------------------------------------
## sex 
##       n missing  unique 
##   34846       0       2 
## 
## Male (17343, 50%), Female (17503, 50%) 
## ---------------------------------------------------------------------------
## age 
##       n missing  unique 
##   34846       0      18 
## 
##           [0, 5[ [5, 10[ [10, 15[ [15, 20[ [20, 25[ [25, 30[ [30, 35[
## Frequency      1    1033     2265     2594     3521     3507     2957
## %              0       3        7        7       10       10        8
##           [35, 40[ [40, 45[ [45, 50[ [50, 55[ [55, 60[ [60, 65[ [65, 70[
## Frequency     1943     2285     2892     2546     2340     2122     1926
## %                6        7        8        7        7        6        6
##           [70, 75[ [75, 80[ [80, 85[ [85, Inf[
## Frequency     1360      803      433       318
## %                4        2        1         1
## ---------------------------------------------------------------------------
## occup 
##       n missing  unique 
##   34846       0      18 
## 
## [Undocumented_1] (7, 0%) 
## Leader of branches, units (553, 2%) 
## Professional (1417, 4%) 
## Technical and associate professional (1493, 4%) 
## Clerical worker (5250, 15%) 
## Service worker, shop, market sales (578, 2%) 
## Skilled agriculture, forestry, fishery (1802, 5%) 
## Craft and related trades (1372, 4%) 
## Plant, machine operator, assembler (569, 2%) 
## Elementary occupation (1387, 4%) 
## Elementary student (5391, 15%) 
## High school & university student (1896, 5%) 
## Housewife (1012, 3%), Jobless, retired (9642, 28%) 
## [Undocumented_2] (2253, 6%) 
## [Undocumented_3] (80, 0%) 
## [Undocumented_4] (60, 0%), Unknown (84, 0%) 
## ---------------------------------------------------------------------------
## occupc 
##       n missing  unique 
##   34846       0       6 
## 
## Blue-collar (5130, 15%), White-collar (9291, 27%) 
## Student (7287, 21%) 
## Housewife, househusband (1012, 3%) 
## Unemployed, retired (9642, 28%) 
## Other, unknown (2484, 7%) 
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##   34846       0   34754   11522    1289    1938    3774    7880   15211 
##     .90     .95 
##   24994   33378 
## 
## lowest :      0.00     14.97     30.46     55.55     61.39
## highest: 126406.08 126643.55 135625.47 152718.42 182414.31 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistHni04Person](./analysis_files/figure-html/plotHistHni04Person.png) 

### Jakarta 2002



The data were captured on October 1-2, 2002 with a sample size of 36,713 people.  The personal data occupies 2.9 Mb of memory.

Data set description:


```r
describe(jkt02.person)
```

```
## jkt02.person 
## 
##  6  Variables      36713  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##   36713       0   36713 
## 
## lowest : 1     2     3     4     6    
## highest: 47486 47489 47491 47492 47493 
## ---------------------------------------------------------------------------
## sex 
##       n missing  unique 
##   36713       0       2 
## 
## Male (19196, 52%), Female (17517, 48%) 
## ---------------------------------------------------------------------------
## age 
##       n missing  unique 
##   36713       0      17 
## 
##           [5, 10[ [10, 15[ [15, 20[ [20, 25[ [25, 30[ [30, 35[ [35, 40[
## Frequency    2964     3489     4190     4502     5135     3671     3400
## %               8       10       11       12       14       10        9
##           [40, 45[ [45, 50[ [50, 55[ [55, 60[ [60, 65[ [65, 70[ [70, 75[
## Frequency     2722     2431     1769      732      783      532      243
## %                7        7        5        2        2        1        1
##           [75, 80[ [80, 85[ [85, Inf[
## Frequency       45       58        47
## %                0        0         0
## ---------------------------------------------------------------------------
## occup 
##       n missing  unique 
##   36713       0      18 
## 
## Unknown (20723, 56%) 
## Professor, manager, director, etc. (940, 3%) 
## Industry owner, retail owner, etc. (1110, 3%) 
## Engineer, doctor, accountant, pilot, etc. (1340, 4%) 
## Teacher, lecturer (940, 3%) 
## Administration staff (2679, 7%) 
## Technician (909, 2%), Waitress (1778, 5%) 
## Vedor, salesman, etc. (1594, 4%) 
## Handyman (carpenter, jewelry) (1206, 3%) 
## Construction, station, port, warehouse (441, 1%) 
## Laborer (190, 1%), Public transport driver (186, 1%) 
## Private driver (751, 2%) 
## Housekeeper, office boy, gardener, etc. (559, 2%) 
## Farmer, fisherman, etc. (5, 0%) 
## Security guard (666, 2%), Others (696, 2%) 
## ---------------------------------------------------------------------------
## occupc 
##       n missing  unique 
##   36713       0       4 
## 
## Blue-collar (4913, 13%), White-collar (9441, 26%) 
## Student (940, 3%), Other, unknown (21419, 58%) 
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##   36713       0   36604   11592    1262    1904    3717    7841   15313 
##     .90     .95 
##   25394   34016 
## 
## lowest :      0.00     14.97     30.46     55.55     61.39
## highest: 124771.38 126406.08 126643.55 135625.47 182414.31 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistJkt02Person](./analysis_files/figure-html/plotHistJkt02Person.png) 

### Metro Manila 1996


```
## [1] TRUE
```

```
## [1] TRUE
```

```
## [1] TRUE
```

```
## [1] TRUE
```

The data were captured on October 1-2, 1996 with a sample size of 189,335 people.  The personal data occupies 15.2 Mb of memory.

Data set description:


```r
describe(mnl96.person)
```

```
## mnl96.person 
## 
##  6  Variables      189335  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##  189335       0  189335 
## 
## lowest : 1      2      3      4      5     
## highest: 203517 203518 203519 203520 203521 
## ---------------------------------------------------------------------------
## sex 
##       n missing  unique 
##  189335       0       2 
## 
## Male (87768, 46%), Female (101567, 54%) 
## ---------------------------------------------------------------------------
## age 
##       n missing  unique 
##  189335       0      18 
## 
##           [0, 5[ [5, 10[ [10, 15[ [15, 20[ [20, 25[ [25, 30[ [30, 35[
## Frequency   2617   22125    21710    22320    20383    18998    17071
## %              1      12       11       12       11       10        9
##           [35, 40[ [40, 45[ [45, 50[ [50, 55[ [55, 60[ [60, 65[ [65, 70[
## Frequency    15662    13426    11169     8274     5951     4405     2943
## %                8        7        6        4        3        2        2
##           [70, 75[ [75, 80[ [80, 85[ [85, Inf[
## Frequency     1138      597      331       215
## %                1        0        0         0
## ---------------------------------------------------------------------------
## occup 
##       n missing  unique 
##  189335       0      14 
## 
##           Executive Professional Technician Clerical Service Farmer Trade
## Frequency     18292         5933       3661     5065   10885   1309  5608
## %                10            3          2        3       6      1     3
##           Operator Laborer Pupil Student Housewife Jobless Others
## Frequency     7034   13639 35029   25624     30402   19559   7295
## %                4       7    19      14        16      10      4
## ---------------------------------------------------------------------------
## occupc 
##       n missing  unique 
##  189335       0       6 
## 
## Blue-collar (18609, 10%) 
## White-collar (52817, 28%), Student (60653, 32%) 
## Housewife, househusband (30402, 16%) 
## Unemployed, retired (19559, 10%) 
## Other, unknown (7295, 4%) 
## ---------------------------------------------------------------------------
## 
## Variables with all observations missing:
## 
## [1] dist
```


```
## Warning: Removed 87768 rows containing non-finite values (stat_density).
## Warning: Removed 101567 rows containing non-finite values (stat_density).
## Warning: Removed 2617 rows containing non-finite values (stat_density).
## Warning: Removed 22125 rows containing non-finite values (stat_density).
## Warning: Removed 21710 rows containing non-finite values (stat_density).
## Warning: Removed 22320 rows containing non-finite values (stat_density).
## Warning: Removed 20383 rows containing non-finite values (stat_density).
## Warning: Removed 18998 rows containing non-finite values (stat_density).
## Warning: Removed 17071 rows containing non-finite values (stat_density).
## Warning: Removed 15662 rows containing non-finite values (stat_density).
## Warning: Removed 13426 rows containing non-finite values (stat_density).
## Warning: Removed 11169 rows containing non-finite values (stat_density).
## Warning: Removed 8274 rows containing non-finite values (stat_density).
## Warning: Removed 5951 rows containing non-finite values (stat_density).
## Warning: Removed 4405 rows containing non-finite values (stat_density).
## Warning: Removed 2943 rows containing non-finite values (stat_density).
## Warning: Removed 1138 rows containing non-finite values (stat_density).
## Warning: Removed 597 rows containing non-finite values (stat_density).
## Warning: Removed 331 rows containing non-finite values (stat_density).
## Warning: Removed 215 rows containing non-finite values (stat_density).
## Warning: Removed 18609 rows containing non-finite values (stat_density).
## Warning: Removed 52817 rows containing non-finite values (stat_density).
## Warning: Removed 60653 rows containing non-finite values (stat_density).
## Warning: Removed 30402 rows containing non-finite values (stat_density).
## Warning: Removed 19559 rows containing non-finite values (stat_density).
## Warning: Removed 7295 rows containing non-finite values (stat_density).
```

![plot of chunk plotHistMnl96Person](./analysis_files/figure-html/plotHistMnl96Person.png) 

### Comparison Across Cities

#### Sex

![plot of chunk plotHistPersonSexAll](./analysis_files/figure-html/plotHistPersonSexAll.png) 

#### Age

![plot of chunk plotHistPersonAgeAll](./analysis_files/figure-html/plotHistPersonAgeAll.png) 

#### Occupation

![plot of chunk plotHistPersonOccupAll](./analysis_files/figure-html/plotHistPersonOccupAll.png) 

#### Occupation Group

![plot of chunk plotHistPersonOccupCAll](./analysis_files/figure-html/plotHistPersonOccupCAll.png) 

#### Distance Traveled


```
## Warning: Removed 87768 rows containing non-finite values (stat_density).
## Warning: Removed 101567 rows containing non-finite values (stat_density).
```

![plot of chunk plotHistPersonDistAll](./analysis_files/figure-html/plotHistPersonDistAll1.png) 

```
## Warning: Removed 2617 rows containing non-finite values (stat_density).
## Warning: Removed 22125 rows containing non-finite values (stat_density).
## Warning: Removed 21710 rows containing non-finite values (stat_density).
## Warning: Removed 22320 rows containing non-finite values (stat_density).
## Warning: Removed 20383 rows containing non-finite values (stat_density).
## Warning: Removed 18998 rows containing non-finite values (stat_density).
## Warning: Removed 17071 rows containing non-finite values (stat_density).
## Warning: Removed 15662 rows containing non-finite values (stat_density).
## Warning: Removed 13426 rows containing non-finite values (stat_density).
## Warning: Removed 11169 rows containing non-finite values (stat_density).
## Warning: Removed 8274 rows containing non-finite values (stat_density).
## Warning: Removed 5951 rows containing non-finite values (stat_density).
## Warning: Removed 4405 rows containing non-finite values (stat_density).
## Warning: Removed 2943 rows containing non-finite values (stat_density).
## Warning: Removed 1138 rows containing non-finite values (stat_density).
## Warning: Removed 597 rows containing non-finite values (stat_density).
## Warning: Removed 331 rows containing non-finite values (stat_density).
## Warning: Removed 215 rows containing non-finite values (stat_density).
```

![plot of chunk plotHistPersonDistAll](./analysis_files/figure-html/plotHistPersonDistAll2.png) 

```
## Warning: Removed 18609 rows containing non-finite values (stat_density).
## Warning: Removed 52817 rows containing non-finite values (stat_density).
## Warning: Removed 60653 rows containing non-finite values (stat_density).
## Warning: Removed 30402 rows containing non-finite values (stat_density).
## Warning: Removed 19559 rows containing non-finite values (stat_density).
## Warning: Removed 7295 rows containing non-finite values (stat_density).
```

![plot of chunk plotHistPersonDistAll](./analysis_files/figure-html/plotHistPersonDistAll3.png) 


## Sample Trips

### Dhaka 2009



The 42,111 people in the sample made a total of 105,121 non-stationary trips. The trip data occupies 5.9 Mb of memory.

Data set description:


```r
describe(dhk09.trip)
```

```
## dhk09.trip 
## 
##  6  Variables      105121  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##  105121       0   42098 
## 
## lowest : 1     2     3     4     5    
## highest: 47486 47489 47491 47492 47493 
## ---------------------------------------------------------------------------
## tno 
##       n missing  unique 
##  105121       0      18 
## 
##           1     2   3     4   5     6   7    8  9   10 11  12 13 14 15 16
## Frequency 2 42096 356 41689 184 10873 202 7850 63 1311 27 374  7 58  2 21
## %         0    40   0    40   0    10   0    7  0    1  0   0  0  0  0  0
##           18 20
## Frequency  4  2
## %          0  0
## ---------------------------------------------------------------------------
## activity 
##       n missing  unique 
##  105121       0       7 
## 
##            Home  Work Education Shopping Social, recreation Errand
## Frequency 45257 23676     13455     6455               6775   1851
## %            43    23        13        6                  6      2
##           Other, unknown
## Frequency           7652
## %                      7
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##  105121       0  103368    4641   500.1   765.3  1511.2  3064.1  6039.5 
##     .90     .95 
## 10120.5 13780.7 
## 
## lowest :     4.232     5.451     7.485     7.485     8.853
## highest: 56457.580 58704.836 61913.059 62614.951 66284.393 
## ---------------------------------------------------------------------------
## pdate_s 
##                   n             missing              unique 
##              105121                   0                 424 
##                Mean                 .05                 .10 
## 2009-10-01 12:05:45 2009-10-01 06:00:00 2009-10-01 07:00:00 
##                 .25                 .50                 .75 
## 2009-10-01 08:10:00 2009-10-01 11:30:00 2009-10-01 16:00:00 
##                 .90                 .95 
## 2009-10-01 18:45:00 2009-10-01 20:00:00 
## 
## lowest : 2009-10-01 00:00:00 2009-10-01 00:21:00 2009-10-01 00:31:00 2009-10-01 00:32:00 2009-10-01 00:33:00
## highest: 2009-10-01 23:20:00 2009-10-01 23:25:00 2009-10-01 23:29:00 2009-10-01 23:35:00 2009-10-01 23:39:00 
## ---------------------------------------------------------------------------
## pdate_e 
##                   n             missing              unique 
##              105121                   0                1069 
##                Mean                 .05                 .10 
## 2009-10-01 12:43:30 2009-10-01 06:30:00 2009-10-01 07:30:00 
##                 .25                 .50                 .75 
## 2009-10-01 09:00:00 2009-10-01 12:06:00 2009-10-01 16:28:00 
##                 .90                 .95 
## 2009-10-01 19:27:00 2009-10-01 20:39:00 
## 
## lowest : 2009-10-01 01:00:00 2009-10-01 01:04:00 2009-10-01 01:05:00 2009-10-01 01:07:00 2009-10-01 01:09:00
## highest: 2009-10-01 23:47:00 2009-10-01 23:49:00 2009-10-01 23:50:00 2009-10-01 23:54:00 2009-10-02 06:00:00 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistDhk09Trip](./analysis_files/figure-html/plotHistDhk09Trip.png) 

### Hanoi 2004




The 34,846 people in the sample made a total of 122,530 non-stationary trips. The trip data occupies 6.5 Mb of memory.

Data set description:


```r
describe(hni04.trip)
```

```
## hni04.trip 
## 
##  6  Variables      122530  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##  122530       0   42908 
## 
## lowest : 2     4     6     7     8    
## highest: 75912 75913 75914 75915 75918 
## ---------------------------------------------------------------------------
## tno 
##       n missing  unique 
##  122530       0      28 
## 
## lowest : 1  2  3  4  5 , highest: 24 25 26 27 28 
## ---------------------------------------------------------------------------
## activity 
##       n missing  unique 
##  122502      28       7 
## 
##            Home  Work Education Shopping Social, recreation Errand
## Frequency 56799 27966     13628     8065               4903  11011
## %            46    23        11        7                  4      9
##           Other, unknown
## Frequency            130
## %                      0
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##  122530       0   76956    3908   327.2   540.9  1160.5  2609.3  5098.8 
##     .90     .95 
##  8570.0 11436.6 
## 
## lowest :     9.199     9.202     9.207     9.220     9.221
## highest: 49427.900 51578.803 59683.450 82004.481 97926.501 
## ---------------------------------------------------------------------------
## pdate_s 
##                   n             missing              unique 
##              122530                   0                 434 
##                Mean                 .05                 .10 
## 2004-10-01 11:53:06 2004-10-01 06:15:00 2004-10-01 06:45:00 
##                 .25                 .50                 .75 
## 2004-10-01 07:30:00 2004-10-01 11:20:00 2004-10-01 16:30:00 
##                 .90                 .95 
## 2004-10-01 17:55:00 2004-10-01 19:30:00 
## 
## lowest : 2004-10-01 00:00:00 2004-10-01 01:00:00 2004-10-01 01:15:00 2004-10-01 01:30:00 2004-10-01 02:00:00
## highest: 2004-10-01 23:20:00 2004-10-01 23:25:00 2004-10-01 23:30:00 2004-10-01 23:40:00 2004-10-01 23:45:00 
## ---------------------------------------------------------------------------
## pdate_e 
##                   n             missing              unique 
##              122530                   0                 788 
##                Mean                 .05                 .10 
## 2004-10-01 12:11:44 2004-10-01 06:40:00 2004-10-01 07:00:00 
##                 .25                 .50                 .75 
## 2004-10-01 07:45:00 2004-10-01 11:40:00 2004-10-01 16:50:00 
##                 .90                 .95 
## 2004-10-01 18:10:00 2004-10-01 19:45:00 
## 
## lowest : 2004-10-01 00:05:00 2004-10-01 00:15:00 2004-10-01 01:10:00 2004-10-01 01:15:00 2004-10-01 01:20:00
## highest: 2004-10-01 23:40:00 2004-10-01 23:45:00 2004-10-01 23:50:00 2004-10-01 23:55:00 2004-10-01 23:59:00 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistHni04Trip](./analysis_files/figure-html/plotHistHni04Trip.png) 

### Jakarta 2002



The 36,713 people in the sample made a total of 746,149 non-stationary trips. The trip data occupies 41.5 Mb of memory.

Data set description:


```r
describe(jkt02.trip)
```

```
## jkt02.trip 
## 
##  6  Variables      746149  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##  746149       0  297042 
## 
## lowest : 1      2      3      4      6     
## highest: 416994 417004 417009 417027 417029 
## ---------------------------------------------------------------------------
## tno 
##       n missing  unique 
##  746149       0      26 
## 
## lowest : 1  2  3  4  5 , highest: 24 26 28 30 32 
## ---------------------------------------------------------------------------
## activity 
##       n missing  unique 
##  746149       0       6 
## 
##             Home   Work Education Shopping Errand Other, unknown
## Frequency 334970 152190    107652    53452  77765          20120
## %             45     20        14        7     10              3
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##  746149       0  714595   14836   781.8  1328.5  3619.3 11679.2 22135.0 
##     .90     .95 
## 32850.5 41483.7 
## 
## lowest : 1.827e+00 2.715e+00 2.891e+00 2.895e+00 2.901e+00
## highest: 1.123e+05 1.134e+05 1.146e+05 1.152e+05 1.240e+05 
## ---------------------------------------------------------------------------
## pdate_s 
##                   n             missing              unique 
##              746149                   0                 984 
##                Mean                 .05                 .10 
## 2002-10-01 11:42:47 2002-10-01 06:00:00 2002-10-01 06:30:00 
##                 .25                 .50                 .75 
## 2002-10-01 07:15:00 2002-10-01 11:50:00 2002-10-01 16:00:00 
##                 .90                 .95 
## 2002-10-01 17:50:00 2002-10-01 19:05:00 
## 
## lowest : 2002-10-01 00:00:00 2002-10-01 00:08:00 2002-10-01 00:09:00 2002-10-01 00:30:00 2002-10-01 01:00:00
## highest: 2002-10-01 23:40:00 2002-10-01 23:45:00 2002-10-01 23:50:00 2002-10-01 23:55:00 2002-10-01 23:57:00 
## ---------------------------------------------------------------------------
## pdate_e 
##                   n             missing              unique 
##              746149                   0                1206 
##                Mean                 .05                 .10 
## 2002-10-01 12:13:39 2002-10-01 06:40:00 2002-10-01 06:50:00 
##                 .25                 .50                 .75 
## 2002-10-01 08:00:00 2002-10-01 12:05:00 2002-10-01 16:15:00 
##                 .90                 .95 
## 2002-10-01 18:30:00 2002-10-01 19:58:00 
## 
## lowest : 2002-10-01 00:02:00 2002-10-01 00:05:00 2002-10-01 00:10:00 2002-10-01 00:15:00 2002-10-01 00:20:00
## highest: 2002-10-01 23:50:00 2002-10-01 23:54:00 2002-10-01 23:55:00 2002-10-01 23:58:00 2002-10-01 23:59:00 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistJkt02Trip](./analysis_files/figure-html/plotHistJkt02Trip.png) 

### Metro Manila 1996


```
## [1] TRUE
```

```
## [1] TRUE
```

```
## [1] TRUE
```

```
## [1] TRUE
```

The 189,335 people in the sample made a total of 324,312 non-stationary trips. The trip data occupies 13.9 Mb of memory.

Data set description:


```r
describe(mnl96.trip)
```

```
## mnl96.trip 
## 
##  4  Variables      324312  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##  324312       0  144786 
## 
## lowest : 1      3      4      5      6     
## highest: 203517 203518 203519 203520 203521 
## ---------------------------------------------------------------------------
## tno 
##       n missing  unique 
##  324312       0      38 
## 
## lowest : 1  2  3  4  5 , highest: 34 35 36 37 39 
## ---------------------------------------------------------------------------
## activity 
##       n missing  unique 
##  324312       0       7 
## 
##             Home  Work Education Shopping Social, recreation Errand
## Frequency 152507 69545     57706    21903              12531   7397
## %             47    21        18        7                  4      2
##           Other, unknown
## Frequency           2723
## %                      1
## ---------------------------------------------------------------------------
## 
## Variables with all observations missing:
## 
## [1] dist
```

![plot of chunk plotHistMnl96Trip](./analysis_files/figure-html/plotHistMnl96Trip.png) 

### Comparison Across Cities

![plot of chunk plotHistTripActivityAll](./analysis_files/figure-html/plotHistTripActivityAll.png) 



## Sample Subtrips

### Dhaka 2009



The 42,111 people in the sample made a total of 314,029 subtrips. 46.7% of these are actually stationarity events, which reduces the true number of subtrips to 167,354. The subtrip data occupies 5.9 Mb of memory.

Data set description:


```r
describe(dhk09.subtrip)
```

```
## dhk09.subtrip 
## 
##  9  Variables      167354  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##  167354       0   42098 
## 
## lowest : 1     2     3     4     5    
## highest: 47486 47489 47491 47492 47493 
## ---------------------------------------------------------------------------
## tno 
##       n missing  unique 
##  167354       0      18 
## 
##           1     2   3     4   5     6   7     8   9   10 11  12 13 14 15
## Frequency 6 68427 586 64701 254 18095 274 12311 101 1913 42 534  8 67  2
## %         0    41   0    39   0    11   0     7   0    1  0   0  0  0  0
##           16 18 20
## Frequency 26  5  2
## %          0  0  0
## ---------------------------------------------------------------------------
## sno 
##       n missing  unique 
##  167354       0       5 
## 
##                1     2     3    4   5
## Frequency 105121 44055 16012 2009 157
## %             63    26    10    1   0
## ---------------------------------------------------------------------------
## tmode 
##       n missing  unique 
##  167354       0      18 
## 
## Walking (65527, 39%), Bicycle (410, 0%) 
## Motorcycle (1529, 1%), CNG, mishuk (5684, 3%) 
## Auto temp (2163, 1%), Car (5348, 3%) 
## Microbus, jeep (465, 0%) 
## Minibus, bus (private) (10785, 6%) 
## Staff bus (908, 1%), School, college bus (686, 0%) 
## Truck (57, 0%), Auto (private) (52, 0%) 
## School van (1345, 1%), AC bus (56, 0%) 
## Rickshaw (54514, 33%), Taxi (273, 0%) 
## Bus (BRTC) (587, 0%), Bus (not BRTC) (16965, 10%) 
## ---------------------------------------------------------------------------
## tmodec 
##       n missing  unique 
##  167354       0       7 
## 
##           Walking Bicycle Motorcycle  Taxi  Car Truck   Bus
## Frequency   65527     410       1529 60471 7563    57 31797
## %              39       0          1    36    5     0    19
## ---------------------------------------------------------------------------
## activity 
##       n missing  unique 
##  167354       0       7 
## 
##            Home  Work Education Shopping Social, recreation Errand
## Frequency 70455 40388     19804    10308              12183   3227
## %            42    24        12        6                  7      2
##           Other, unknown
## Frequency          10989
## %                      7
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##  167354       0  154776    2915   426.9   636.7  1153.6  2060.8  3550.9 
##     .90     .95 
##  5873.1  8358.5 
## 
## lowest :     3.640     4.232     5.451     7.485     7.485
## highest: 50500.481 50500.493 52381.155 58704.836 66284.393 
## ---------------------------------------------------------------------------
## pdate_s 
##                   n             missing              unique 
##              167354                   0                1295 
##                Mean                 .05                 .10 
## 2009-10-01 12:16:52 2009-10-01 06:00:00 2009-10-01 07:00:00 
##                 .25                 .50                 .75 
## 2009-10-01 08:30:00 2009-10-01 11:44:00 2009-10-01 16:00:00 
##                 .90                 .95 
## 2009-10-01 19:00:00 2009-10-01 20:00:00 
## 
## lowest : 2009-10-01 00:00:00 2009-10-01 00:20:00 2009-10-01 00:21:00 2009-10-01 00:31:00 2009-10-01 00:32:00
## highest: 2009-10-01 23:30:00 2009-10-01 23:35:00 2009-10-01 23:37:00 2009-10-01 23:39:00 2009-10-02 01:30:00 
## ---------------------------------------------------------------------------
## pdate_e 
##                   n             missing              unique 
##              167354                   0                1326 
##                Mean                 .05                 .10 
## 2009-10-01 12:40:36 2009-10-01 06:18:00 2009-10-01 07:29:00 
##                 .25                 .50                 .75 
## 2009-10-01 08:52:00 2009-10-01 12:06:00 2009-10-01 16:29:00 
##                 .90                 .95 
## 2009-10-01 19:20:00 2009-10-01 20:30:00 
## 
## lowest : 2009-10-01 00:20:00 2009-10-01 00:40:00 2009-10-01 00:59:00 2009-10-01 01:00:00 2009-10-01 01:03:00
## highest: 2009-10-01 23:49:00 2009-10-01 23:50:00 2009-10-01 23:54:00 2009-10-02 01:30:00 2009-10-02 06:00:00 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistDhk09Subtrip](./analysis_files/figure-html/plotHistDhk09Subtrip.png) 

### Hanoi 2004



The 34,846 people in the sample made a total of 302,813 subtrips. 59.0% of these are actually stationarity events, which reduces the true number of subtrips to 124,062. The subtrip data occupies 6.5 Mb of memory.

Data set description:


```r
describe(hni04.subtrip)
```

```
## hni04.subtrip 
## 
##  9  Variables      124062  Observations
## ---------------------------------------------------------------------------
## pid 
##       n missing  unique 
##  124062       0   42908 
## 
## lowest : 2     4     6     7     8    
## highest: 75912 75913 75914 75915 75918 
## ---------------------------------------------------------------------------
## tno 
##       n missing  unique 
##  124062       0      28 
## 
## lowest : 1  2  3  4  5 , highest: 24 25 26 27 28 
## ---------------------------------------------------------------------------
## sno 
##       n missing  unique 
##  124062       0       4 
## 
## 1 (122530, 99%), 2 (1264, 1%), 3 (134, 0%), 4 (134, 0%) 
## ---------------------------------------------------------------------------
## tmode 
##       n missing  unique 
##  124062       0      15 
## 
## Walking (35301, 28%), Bicycle (26091, 21%) 
## Motorcycle (driver) (49217, 40%) 
## Motorcycle (passenger) (7182, 6%) 
## Car (driver) (599, 0%) 
## Car (passenger, not taxi) (578, 0%) 
## Minibus (<=25 pax) (326, 0%) 
## Standard bus (>25 pax) (2983, 2%) 
## Cyclo (47, 0%), Xe om (736, 1%), Taxi (187, 0%) 
## Tourist bus (68, 0%), Company bus (331, 0%) 
## School bus (114, 0%), Truck (302, 0%) 
## ---------------------------------------------------------------------------
## tmodec 
##       n missing  unique 
##  124062       0       7 
## 
##           Walking Bicycle Motorcycle Taxi  Car Truck  Bus
## Frequency   35301   26091      56399  970 1177   302 3822
## %              28      21         45    1    1     0    3
## ---------------------------------------------------------------------------
## activity 
##       n missing  unique 
##  124034      28       7 
## 
##            Home  Work Education Shopping Social, recreation Errand
## Frequency 57542 28254     13994     8093               4920  11097
## %            46    23        11        7                  4      9
##           Other, unknown
## Frequency            134
## %                      0
## ---------------------------------------------------------------------------
## dist 
##       n missing  unique    Mean     .05     .10     .25     .50     .75 
##  124062       0   78095    3860   326.6   537.6  1151.4  2588.8  5060.6 
##     .90     .95 
##  8466.1 11274.8 
## 
## lowest :     6.231     9.199     9.202     9.207     9.220
## highest: 46313.503 47065.393 47140.065 49427.900 51578.803 
## ---------------------------------------------------------------------------
## pdate_s 
##                   n             missing              unique 
##              124062                   0                 624 
##                Mean                 .05                 .10 
## 2004-10-01 11:53:13 2004-10-01 06:15:00 2004-10-01 06:40:00 
##                 .25                 .50                 .75 
## 2004-10-01 07:30:00 2004-10-01 11:25:00 2004-10-01 16:30:00 
##                 .90                 .95 
## 2004-10-01 17:55:00 2004-10-01 19:30:00 
## 
## lowest : 2004-10-01 00:00:00 2004-10-01 01:00:00 2004-10-01 01:15:00 2004-10-01 01:30:00 2004-10-01 02:00:00
## highest: 2004-10-01 23:20:00 2004-10-01 23:25:00 2004-10-01 23:30:00 2004-10-01 23:40:00 2004-10-01 23:45:00 
## ---------------------------------------------------------------------------
## pdate_e 
##                   n             missing              unique 
##              124062                   0                 873 
##                Mean                 .05                 .10 
## 2004-10-01 12:11:37 2004-10-01 06:35:00 2004-10-01 07:00:00 
##                 .25                 .50                 .75 
## 2004-10-01 07:45:00 2004-10-01 11:40:00 2004-10-01 16:50:00 
##                 .90                 .95 
## 2004-10-01 18:10:00 2004-10-01 19:45:00 
## 
## lowest : 2004-10-01 00:05:00 2004-10-01 00:15:00 2004-10-01 01:10:00 2004-10-01 01:15:00 2004-10-01 01:20:00
## highest: 2004-10-01 23:40:00 2004-10-01 23:45:00 2004-10-01 23:50:00 2004-10-01 23:55:00 2004-10-01 23:59:00 
## ---------------------------------------------------------------------------
```

![plot of chunk plotHistHni04Subtrip](./analysis_files/figure-html/plotHistHni04Subtrip.png) 

### Jakarta 2002



The 36,713 people in the sample made a total of 2,101,280 subtrips. 49.6% of these are actually stationarity events, which reduces the true number of subtrips to 1,058,822.

Data set description:


```r
format(object.size(jkt02.subtrip), units = "auto")
```

```
## [1] "68.4 Mb"
```

```r
names(jkt02.subtrip)
```

```
## [1] "pid"      "tno"      "sno"      "tmode"    "tmodec"   "activity"
## [7] "dist"     "pdate_s"  "pdate_e"
```

```r
str(jkt02.subtrip)
```

```
## 'data.frame':	1058822 obs. of  9 variables:
##  $ pid     : Factor w/ 297043 levels "1","2","3","4",..: 1 1 1 1 1 1 1 2 2 3 ...
##  $ tno     : Factor w/ 33 levels "1","2","3","4",..: 2 4 6 8 10 12 14 2 4 2 ...
##  $ sno     : Factor w/ 6 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ tmode   : Factor w/ 23 levels "Walking to final destination",..: 5 5 5 5 5 5 5 1 1 1 ...
##  $ tmodec  : Factor w/ 9 levels "Walking","Bicycle",..: 5 5 5 5 5 5 5 1 1 1 ...
##  $ activity: Factor w/ 7 levels "Home","Work",..: 2 4 2 4 2 4 1 7 4 7 ...
##  $ dist    : num  3929 2428 2088 5709 9023 ...
##  $ pdate_s : POSIXct, format: "2002-10-01 07:30:00" "2002-10-01 09:00:00" ...
##  $ pdate_e : POSIXct, format: "2002-10-01 08:05:00" "2002-10-01 09:10:00" ...
```

```r
levels(jkt02.subtrip$tmodec)
```

```
## [1] "Walking"    "Bicycle"    "Motorcycle" "Taxi"       "Car"       
## [6] "Truck"      "Bus"        "Railway"    "Boat"
```

```r
table(jkt02.subtrip$tmodec)
```

```
## 
##    Walking    Bicycle Motorcycle       Taxi        Car      Truck 
##     478734      17169     113412      63061      54107        636 
##        Bus    Railway       Boat 
##     331703          0          0
```

```r
levels(jkt02.subtrip$activity)
```

```
## [1] "Home"               "Work"               "Education"         
## [4] "Shopping"           "Social, recreation" "Errand"            
## [7] "Other, unknown"
```

```r
table(jkt02.subtrip$activity)
```

```
## 
##               Home               Work          Education 
##             480509             229632             157506 
##           Shopping Social, recreation             Errand 
##              70339                  0              97241 
##     Other, unknown 
##              23595
```

![plot of chunk plotHistJkt02Subtrip](./analysis_files/figure-html/plotHistJkt02Subtrip.png) 

### Metro Manila 1996


```
## [1] TRUE
```

```
## [1] TRUE
```

```
## [1] TRUE
```

```
## [1] TRUE
```

The 189,335 people in the sample made a total of 1,077,258 subtrips. 47.5% of these are actually stationarity events, which reduces the true number of subtrips to 565,041.

Data set description:


```r
format(object.size(mnl96.subtrip), units = "auto")
```

```
## [1] "27.4 Mb"
```

```r
names(mnl96.subtrip)
```

```
## [1] "pid"      "tno"      "sno"      "tmode"    "tmodec"   "activity"
## [7] "dist"
```

```r
str(mnl96.subtrip)
```

```
## 'data.frame':	565041 obs. of  7 variables:
##  $ pid     : Factor w/ 189335 levels "1","2","3","4",..: 1 1 3 3 3 3 3 3 4 4 ...
##  $ tno     : Factor w/ 40 levels "1","2","3","4",..: 2 4 2 2 2 4 4 4 2 4 ...
##  $ sno     : Factor w/ 9 levels "1","2","3","4",..: 1 1 1 2 3 1 2 3 1 1 ...
##  $ tmode   : Factor w/ 21 levels "Walking","Pedicab",..: 1 1 1 6 1 1 6 1 2 1 ...
##  $ tmodec  : Factor w/ 9 levels "Walking","Bicycle",..: 1 1 1 7 1 1 7 1 4 1 ...
##  $ activity: Factor w/ 7 levels "Home","Work",..: NA NA NA NA NA NA NA NA NA NA ...
##  $ dist    : num  NA NA NA NA NA NA NA NA NA NA ...
```

```r
levels(mnl96.subtrip$tmodec)
```

```
## [1] "Walking"    "Bicycle"    "Motorcycle" "Taxi"       "Car"       
## [6] "Truck"      "Bus"        "Railway"    "Boat"
```

```r
table(mnl96.subtrip$tmodec)
```

```
## 
##    Walking    Bicycle Motorcycle       Taxi        Car      Truck 
##     232123       2292      89554      19110      26347       1308 
##        Bus    Railway       Boat 
##     193627          0        680
```

```r
levels(mnl96.subtrip$activity)
```

```
## [1] "Home"               "Work"               "Education"         
## [4] "Shopping"           "Social, recreation" "Errand"            
## [7] "Other, unknown"
```

```r
table(mnl96.subtrip$activity)
```

```
## 
##               Home               Work          Education 
##                  0                  0                  0 
##           Shopping Social, recreation             Errand 
##                  0                  0                  0 
##     Other, unknown 
##                  0
```

![plot of chunk plotHistMnl96Subtrip](./analysis_files/figure-html/plotHistMnl96Subtrip.png) 

### Comparison Across Cities

![plot of chunk plotHistSubtripTModeCAll](./analysis_files/figure-html/plotHistSubtripTModeCAll.png) 



## Commuting Behavior

This section covers the analysis of the commuting behavior in all four cities both in the morning (0:00 - 11:59) and in the evening (12:00 - 23:59) regarding distance, duration, and multi-modality.

### Dhaka 2009



Data set description:


```r
dhk09CommBehavSexNoon <- ddply(dhk09.commbehav, c("sex", "noon"), summarize, 
                               mean_dist = mean(dist), 
                               mean_duration = mean(duration), 
                               subtrips = mean(subtrips))
dhk09CommBehavAgeNoon <- ddply(dhk09.commbehav, c("age", "noon"), summarize, 
                               mean_dist = mean(dist), 
                               mean_duration = mean(duration), 
                               subtrips = mean(subtrips))
dhk09CommBehavOccupCNoon <- ddply(dhk09.commbehav, c("occupc", "noon"), summarize, 
                                  mean_dist = mean(dist), 
                                  mean_duration = mean(duration), 
                                  subtrips = mean(subtrips))
print(xtable(dhk09CommBehavSexNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:44:30 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & sex & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & Male & 00:00 - 11:59 & 4795.30 & 36.27 & 1.64 \\ 
  2 & Male & 12:00 - 23:59 & 5170.82 & 42.12 & 1.65 \\ 
  3 & Female & 00:00 - 11:59 & 3621.71 & 30.39 & 1.44 \\ 
  4 & Female & 12:00 - 23:59 & 4040.06 & 36.69 & 1.46 \\ 
   \hline
\end{tabular}
\end{table}

```r
print(xtable(dhk09CommBehavAgeNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:44:30 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & age & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & [0, 5[ & 00:00 - 11:59 & 2970.32 & 22.97 & 1.30 \\ 
  2 & [0, 5[ & 12:00 - 23:59 & 3770.52 & 27.38 & 1.31 \\ 
  3 & [5, 10[ & 00:00 - 11:59 & 2393.65 & 21.71 & 1.18 \\ 
  4 & [5, 10[ & 12:00 - 23:59 & 2700.40 & 25.60 & 1.20 \\ 
  5 & [10, 15[ & 00:00 - 11:59 & 2696.21 & 24.25 & 1.27 \\ 
  6 & [10, 15[ & 12:00 - 23:59 & 2704.71 & 26.34 & 1.23 \\ 
  7 & [15, 20[ & 00:00 - 11:59 & 4102.80 & 33.53 & 1.62 \\ 
  8 & [15, 20[ & 12:00 - 23:59 & 4130.08 & 36.36 & 1.56 \\ 
  9 & [20, 25[ & 00:00 - 11:59 & 5481.99 & 41.96 & 1.88 \\ 
  10 & [20, 25[ & 12:00 - 23:59 & 5816.35 & 47.40 & 1.90 \\ 
  11 & [25, 30[ & 00:00 - 11:59 & 5402.64 & 39.41 & 1.74 \\ 
  12 & [25, 30[ & 12:00 - 23:59 & 5808.49 & 47.14 & 1.75 \\ 
  13 & [30, 35[ & 00:00 - 11:59 & 5534.42 & 40.65 & 1.73 \\ 
  14 & [30, 35[ & 12:00 - 23:59 & 6021.21 & 48.58 & 1.73 \\ 
  15 & [35, 40[ & 00:00 - 11:59 & 5486.78 & 39.54 & 1.72 \\ 
  16 & [35, 40[ & 12:00 - 23:59 & 5787.74 & 46.69 & 1.69 \\ 
  17 & [40, 45[ & 00:00 - 11:59 & 5508.28 & 39.57 & 1.71 \\ 
  18 & [40, 45[ & 12:00 - 23:59 & 5862.41 & 45.98 & 1.68 \\ 
  19 & [45, 50[ & 00:00 - 11:59 & 5373.47 & 41.33 & 1.74 \\ 
  20 & [45, 50[ & 12:00 - 23:59 & 5922.69 & 48.51 & 1.72 \\ 
  21 & [50, 55[ & 00:00 - 11:59 & 5513.04 & 41.02 & 1.73 \\ 
  22 & [50, 55[ & 12:00 - 23:59 & 6056.89 & 48.18 & 1.74 \\ 
  23 & [55, 60[ & 00:00 - 11:59 & 6048.95 & 45.05 & 1.72 \\ 
  24 & [55, 60[ & 12:00 - 23:59 & 6081.35 & 51.24 & 1.70 \\ 
  25 & [60, 65[ & 00:00 - 11:59 & 5519.11 & 38.74 & 1.68 \\ 
  26 & [60, 65[ & 12:00 - 23:59 & 5956.94 & 43.78 & 1.69 \\ 
  27 & [65, 70[ & 00:00 - 11:59 & 5032.82 & 45.95 & 1.64 \\ 
  28 & [65, 70[ & 12:00 - 23:59 & 5705.57 & 49.25 & 1.64 \\ 
  29 & [70, 75[ & 00:00 - 11:59 & 5815.85 & 44.26 & 1.59 \\ 
  30 & [70, 75[ & 12:00 - 23:59 & 5672.92 & 47.53 & 1.59 \\ 
  31 & [75, 80[ & 00:00 - 11:59 & 5758.00 & 47.45 & 1.59 \\ 
  32 & [75, 80[ & 12:00 - 23:59 & 4536.15 & 48.00 & 1.57 \\ 
  33 & [80, 85[ & 00:00 - 11:59 & 3570.68 & 30.00 & 1.00 \\ 
  34 & [80, 85[ & 12:00 - 23:59 & 3570.68 & 30.00 & 1.00 \\ 
   \hline
\end{tabular}
\end{table}

```r
print(xtable(dhk09CommBehavOccupCNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:44:30 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & occupc & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & Blue-collar & 00:00 - 11:59 & 15250.89 & 58.15 & 1.92 \\ 
  2 & Blue-collar & 12:00 - 23:59 & 19279.66 & 67.90 & 2.10 \\ 
  3 & White-collar & 00:00 - 11:59 & 5351.49 & 39.22 & 1.71 \\ 
  4 & White-collar & 12:00 - 23:59 & 5784.54 & 46.57 & 1.70 \\ 
  5 & Student & 00:00 - 11:59 & 3451.67 & 29.30 & 1.43 \\ 
  6 & Student & 12:00 - 23:59 & 3790.14 & 33.64 & 1.46 \\ 
  7 & Housewife, househusband & 00:00 - 11:59 & 4749.95 & 38.29 & 1.68 \\ 
  8 & Housewife, househusband & 12:00 - 23:59 & 5303.80 & 46.16 & 1.67 \\ 
  9 & Unemployed, retired & 00:00 - 11:59 & 5557.43 & 43.83 & 1.77 \\ 
  10 & Unemployed, retired & 12:00 - 23:59 & 6119.65 & 45.85 & 1.93 \\ 
  11 & Other, unknown & 00:00 - 11:59 & 4212.61 & 31.78 & 1.52 \\ 
  12 & Other, unknown & 12:00 - 23:59 & 4809.52 & 42.66 & 1.58 \\ 
   \hline
\end{tabular}
\end{table}

![plot of chunk plotCommBehavDhk09](./analysis_files/figure-html/plotCommBehavDhk09.png) 

### Hanoi 2004



Data set description:


```r
hni04CommBehavSexNoon <- ddply(hni04.commbehav, c("sex", "noon"), summarize, 
                               mean_dist = mean(dist), 
                               mean_duration = mean(duration), 
                               subtrips = mean(subtrips))
hni04CommBehavAgeNoon <- ddply(hni04.commbehav, c("age", "noon"), summarize, 
                               mean_dist = mean(dist), 
                               mean_duration = mean(duration), 
                               subtrips = mean(subtrips))
hni04CommBehavOccupCNoon <- ddply(hni04.commbehav, c("occupc", "noon"), summarize, 
                                  mean_dist = mean(dist), 
                                  mean_duration = mean(duration), 
                                  subtrips = mean(subtrips))
print(xtable(hni04CommBehavSexNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:45:08 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & sex & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & Male & 00:00 - 11:59 & 4607.51 & 19.54 & 1.02 \\ 
  2 & Male & 12:00 - 23:59 & 4655.49 & 20.67 & 1.02 \\ 
  3 & Female & 00:00 - 11:59 & 4062.93 & 19.18 & 1.02 \\ 
  4 & Female & 12:00 - 23:59 & 4069.47 & 20.11 & 1.02 \\ 
   \hline
\end{tabular}
\end{table}

```r
print(xtable(hni04CommBehavAgeNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:45:08 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & age & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & [0, 5[ & 00:00 - 11:59 & 3485.12 & 15.00 & 1.00 \\ 
  2 & [5, 10[ & 00:00 - 11:59 & 2255.45 & 12.65 & 1.00 \\ 
  3 & [5, 10[ & 12:00 - 23:59 & 2222.94 & 13.90 & 1.00 \\ 
  4 & [10, 15[ & 00:00 - 11:59 & 2407.30 & 14.34 & 1.01 \\ 
  5 & [10, 15[ & 12:00 - 23:59 & 2393.56 & 14.89 & 1.01 \\ 
  6 & [15, 20[ & 00:00 - 11:59 & 4133.85 & 19.91 & 1.03 \\ 
  7 & [15, 20[ & 12:00 - 23:59 & 4123.33 & 20.51 & 1.03 \\ 
  8 & [20, 25[ & 00:00 - 11:59 & 6436.03 & 25.52 & 1.05 \\ 
  9 & [20, 25[ & 12:00 - 23:59 & 6230.30 & 25.49 & 1.04 \\ 
  10 & [25, 30[ & 00:00 - 11:59 & 5682.34 & 22.37 & 1.01 \\ 
  11 & [25, 30[ & 12:00 - 23:59 & 5623.85 & 23.72 & 1.01 \\ 
  12 & [30, 35[ & 00:00 - 11:59 & 5263.27 & 21.14 & 1.01 \\ 
  13 & [30, 35[ & 12:00 - 23:59 & 5136.86 & 22.46 & 1.01 \\ 
  14 & [35, 40[ & 00:00 - 11:59 & 4479.63 & 19.09 & 1.01 \\ 
  15 & [35, 40[ & 12:00 - 23:59 & 4557.74 & 20.48 & 1.01 \\ 
  16 & [40, 45[ & 00:00 - 11:59 & 4126.63 & 18.39 & 1.01 \\ 
  17 & [40, 45[ & 12:00 - 23:59 & 4232.65 & 19.21 & 1.01 \\ 
  18 & [45, 50[ & 00:00 - 11:59 & 4004.81 & 18.04 & 1.01 \\ 
  19 & [45, 50[ & 12:00 - 23:59 & 3835.10 & 18.82 & 1.01 \\ 
  20 & [50, 55[ & 00:00 - 11:59 & 3715.07 & 18.03 & 1.01 \\ 
  21 & [50, 55[ & 12:00 - 23:59 & 3839.06 & 19.23 & 1.01 \\ 
  22 & [55, 60[ & 00:00 - 11:59 & 3625.79 & 17.29 & 1.01 \\ 
  23 & [55, 60[ & 12:00 - 23:59 & 3833.90 & 18.69 & 1.01 \\ 
  24 & [60, 65[ & 00:00 - 11:59 & 3426.80 & 16.93 & 1.01 \\ 
  25 & [60, 65[ & 12:00 - 23:59 & 3530.74 & 18.26 & 1.01 \\ 
  26 & [65, 70[ & 00:00 - 11:59 & 2873.27 & 16.72 & 1.02 \\ 
  27 & [65, 70[ & 12:00 - 23:59 & 3270.11 & 17.98 & 1.01 \\ 
  28 & [70, 75[ & 00:00 - 11:59 & 2480.12 & 15.41 & 1.01 \\ 
  29 & [70, 75[ & 12:00 - 23:59 & 2394.65 & 16.94 & 1.00 \\ 
  30 & [75, 80[ & 00:00 - 11:59 & 2186.26 & 15.91 & 1.02 \\ 
  31 & [75, 80[ & 12:00 - 23:59 & 1950.37 & 16.11 & 1.00 \\ 
  32 & [80, 85[ & 00:00 - 11:59 & 4165.41 & 13.24 & 1.00 \\ 
  33 & [80, 85[ & 12:00 - 23:59 & 3936.29 & 13.33 & 1.00 \\ 
  34 & [85, Inf[ & 00:00 - 11:59 & 2975.18 & 13.50 & 1.00 \\ 
  35 & [85, Inf[ & 12:00 - 23:59 & 2242.29 & 12.50 & 1.00 \\ 
   \hline
\end{tabular}
\end{table}

```r
print(xtable(hni04CommBehavOccupCNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:45:08 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & occupc & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & Blue-collar & 00:00 - 11:59 & 4729.25 & 18.18 & 1.01 \\ 
  2 & Blue-collar & 12:00 - 23:59 & 4915.18 & 19.11 & 1.01 \\ 
  3 & White-collar & 00:00 - 11:59 & 4840.47 & 21.00 & 1.01 \\ 
  4 & White-collar & 12:00 - 23:59 & 4863.13 & 22.37 & 1.01 \\ 
  5 & Student & 00:00 - 11:59 & 3779.95 & 18.73 & 1.03 \\ 
  6 & Student & 12:00 - 23:59 & 3680.21 & 19.23 & 1.03 \\ 
  7 & Housewife, househusband & 00:00 - 11:59 & 2754.35 & 17.28 & 1.04 \\ 
  8 & Housewife, househusband & 12:00 - 23:59 & 2944.81 & 19.04 & 1.00 \\ 
  9 & Unemployed, retired & 00:00 - 11:59 & 2942.34 & 15.67 & 1.01 \\ 
  10 & Unemployed, retired & 12:00 - 23:59 & 3348.44 & 18.05 & 1.01 \\ 
  11 & Other, unknown & 00:00 - 11:59 & 4607.69 & 19.45 & 1.01 \\ 
  12 & Other, unknown & 12:00 - 23:59 & 4226.71 & 20.05 & 1.01 \\ 
   \hline
\end{tabular}
\end{table}

![plot of chunk plotCommBehavHni04](./analysis_files/figure-html/plotCommBehavHni04.png) 

### Jakarta 2002



Data set description:


```r
jkt02CommBehavSexNoon <- ddply(jkt02.commbehav, c("sex", "noon"), summarize, 
                               mean_dist = mean(dist), 
                               mean_duration = mean(duration), 
                               subtrips = mean(subtrips))
jkt02CommBehavAgeNoon <- ddply(jkt02.commbehav, c("age", "noon"), summarize, 
                               mean_dist = mean(dist), 
                               mean_duration = mean(duration), 
                               subtrips = mean(subtrips))
jkt02CommBehavOccupCNoon <- ddply(jkt02.commbehav, c("occupc", "noon"), summarize, 
                                  mean_dist = mean(dist), 
                                  mean_duration = mean(duration), 
                                  subtrips = mean(subtrips))
print(xtable(jkt02CommBehavSexNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:53:29 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & sex & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & Male & 00:00 - 11:59 & 10032.60 & 35.33 & 1.49 \\ 
  2 & Male & 12:00 - 23:59 & 22473.76 & 38.37 & 1.52 \\ 
  3 & Female & 00:00 - 11:59 & 9517.82 & 32.23 & 1.52 \\ 
  4 & Female & 12:00 - 23:59 & 22091.35 & 35.92 & 1.61 \\ 
   \hline
\end{tabular}
\end{table}

```r
print(xtable(jkt02CommBehavAgeNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:53:29 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & age & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & [5, 10[ & 00:00 - 11:59 & 9092.75 & 28.30 & 1.46 \\ 
  2 & [5, 10[ & 12:00 - 23:59 & 21943.44 & 32.41 & 1.57 \\ 
  3 & [10, 15[ & 00:00 - 11:59 & 8977.69 & 29.09 & 1.48 \\ 
  4 & [10, 15[ & 12:00 - 23:59 & 21453.20 & 32.45 & 1.56 \\ 
  5 & [15, 20[ & 00:00 - 11:59 & 8994.23 & 29.91 & 1.51 \\ 
  6 & [15, 20[ & 12:00 - 23:59 & 21406.65 & 33.60 & 1.61 \\ 
  7 & [20, 25[ & 00:00 - 11:59 & 9277.52 & 31.48 & 1.52 \\ 
  8 & [20, 25[ & 12:00 - 23:59 & 21651.50 & 35.25 & 1.61 \\ 
  9 & [25, 30[ & 00:00 - 11:59 & 10020.76 & 33.73 & 1.50 \\ 
  10 & [25, 30[ & 12:00 - 23:59 & 23016.87 & 37.49 & 1.57 \\ 
  11 & [30, 35[ & 00:00 - 11:59 & 10368.11 & 38.68 & 1.52 \\ 
  12 & [30, 35[ & 12:00 - 23:59 & 21616.41 & 41.23 & 1.54 \\ 
  13 & [35, 40[ & 00:00 - 11:59 & 10763.61 & 40.61 & 1.53 \\ 
  14 & [35, 40[ & 12:00 - 23:59 & 23176.26 & 42.26 & 1.52 \\ 
  15 & [40, 45[ & 00:00 - 11:59 & 10985.78 & 40.82 & 1.51 \\ 
  16 & [40, 45[ & 12:00 - 23:59 & 23319.70 & 42.30 & 1.51 \\ 
  17 & [45, 50[ & 00:00 - 11:59 & 10782.09 & 41.12 & 1.50 \\ 
  18 & [45, 50[ & 12:00 - 23:59 & 22795.24 & 42.50 & 1.48 \\ 
  19 & [50, 55[ & 00:00 - 11:59 & 11025.18 & 41.96 & 1.50 \\ 
  20 & [50, 55[ & 12:00 - 23:59 & 22722.19 & 42.95 & 1.49 \\ 
  21 & [55, 60[ & 00:00 - 11:59 & 11157.90 & 42.46 & 1.53 \\ 
  22 & [55, 60[ & 12:00 - 23:59 & 24270.33 & 43.55 & 1.49 \\ 
  23 & [60, 65[ & 00:00 - 11:59 & 11219.69 & 39.51 & 1.47 \\ 
  24 & [60, 65[ & 12:00 - 23:59 & 25045.15 & 41.47 & 1.46 \\ 
  25 & [65, 70[ & 00:00 - 11:59 & 11045.27 & 40.12 & 1.48 \\ 
  26 & [65, 70[ & 12:00 - 23:59 & 23353.54 & 41.49 & 1.46 \\ 
  27 & [70, 75[ & 00:00 - 11:59 & 11471.93 & 38.29 & 1.48 \\ 
  28 & [70, 75[ & 12:00 - 23:59 & 25881.16 & 40.91 & 1.50 \\ 
  29 & [75, 80[ & 00:00 - 11:59 & 9028.16 & 35.92 & 1.41 \\ 
  30 & [75, 80[ & 12:00 - 23:59 & 19585.60 & 38.35 & 1.40 \\ 
  31 & [80, 85[ & 00:00 - 11:59 & 10255.78 & 39.33 & 1.47 \\ 
  32 & [80, 85[ & 12:00 - 23:59 & 22644.91 & 39.87 & 1.45 \\ 
  33 & [85, Inf[ & 00:00 - 11:59 & 8373.86 & 30.29 & 1.49 \\ 
  34 & [85, Inf[ & 12:00 - 23:59 & 19359.30 & 35.82 & 1.59 \\ 
   \hline
\end{tabular}
\end{table}

```r
print(xtable(jkt02CommBehavOccupCNoon, type = "html"))
```

```
## Warning: class of 'x' was discarded
```

% latex table generated in R 3.1.0 by xtable 1.7-3 package
% Fri Jul 18 18:53:29 2014
\begin{table}[ht]
\centering
\begin{tabular}{rllrrr}
  \hline
 & occupc & noon & mean\_dist & mean\_duration & subtrips \\ 
  \hline
1 & Blue-collar & 00:00 - 11:59 & 10604.03 & 38.51 & 1.49 \\ 
  2 & Blue-collar & 12:00 - 23:59 & 22731.96 & 40.67 & 1.50 \\ 
  3 & White-collar & 00:00 - 11:59 & 10381.26 & 36.80 & 1.50 \\ 
  4 & White-collar & 12:00 - 23:59 & 22938.81 & 39.64 & 1.53 \\ 
  5 & Student & 00:00 - 11:59 & 10270.29 & 37.93 & 1.50 \\ 
  6 & Student & 12:00 - 23:59 & 23492.89 & 39.59 & 1.49 \\ 
  7 & Other, unknown & 00:00 - 11:59 & 9360.32 & 31.58 & 1.51 \\ 
  8 & Other, unknown & 12:00 - 23:59 & 21854.53 & 35.30 & 1.59 \\ 
   \hline
\end{tabular}
\end{table}

![plot of chunk plotCommBehavJkt02](./analysis_files/figure-html/plotCommBehavJkt02.png) 

### Metro Manila 1996

### Comparison Across Cities

![plot of chunk plotCommBehavAll](./analysis_files/figure-html/plotCommBehavAll1.png) ![plot of chunk plotCommBehavAll](./analysis_files/figure-html/plotCommBehavAll2.png) ![plot of chunk plotCommBehavAll](./analysis_files/figure-html/plotCommBehavAll3.png) ![plot of chunk plotCommBehavAll](./analysis_files/figure-html/plotCommBehavAll4.png) 



## Spatio-Temporal Distribution of People

This section covers the analysis of the distribution of people in all four cities over space and time. For analysis purposes we generated concentric ring buffers in 5km distances from the centers of all four cities (as per the OpenStreetMap data).

### Dhaka 2009



![plot of chunk plotSTDistributionDhk09](./analysis_files/figure-html/plotSTDistributionDhk09.png) 

### Hanoi 2004



![plot of chunk plotSTDistributionHni04](./analysis_files/figure-html/plotSTDistributionHni04.png) 

### Jakarta 2002



![plot of chunk plotSTDistributionJkt02](./analysis_files/figure-html/plotSTDistributionJkt02.png) 

### Metro Manila 1996

### Comparison Across Cities

![plot of chunk plotSTDistAll](./analysis_files/figure-html/plotSTDistAll.png) 



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
