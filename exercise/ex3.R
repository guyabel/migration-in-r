# 0.  a) Load the KOSTAT2021.Rproj file. 
#     Run the getwd() below. It should print the directory where the 
#     KOSTAT2021.Rproj file is located.
getwd()
#     b) Load the packages used in this exercise
library(tidyverse)
library(migest)
library(geosphere)
##
##
##
# 1. Run the code below to read in the bilateral data in brazil_census_tidy.csv 
#    from the 1991, 2000 and 2010 Brazilian censuses
br <- read_csv("./data/brazil_census_tidy.csv")
br
# 2. Run the code below to read in the WorldPop population data for Brazil in 
#    2000 and check that the orig and dest names in the br migration data match 
#    the region names in br_pop
br_pop <- read_csv("./data/PWD_2000_sub_national_100m.csv",
                   locale = readr::locale(encoding = "latin1")) %>%
  filter(ISO == "BRA") %>%
  select(Adm_N, contains("PWC"), Pop) 
br_pop
# check names match
unique(br$orig) %in% br_pop$Adm_N
unique(br$dest) %in% br_pop$Adm_N  
# 3. Calculate the migration intensity indices for Brazil in 2000
m <- br %>%
  #####(year == 2000) %>%
  pull(flow) %>%
  sum()
m 
p <- br_pop %>%
  pull(Pop) %>%
  #####()
#####(mig_total = #####, 
                pop_total = p,      
                n = n_distinct(br_pop$#####))
# 3. Calculate the migration connectivity indices for Brazil in 1991
br %>%
  filter(year == 1991) %>%
  #####()
# 4. Create a distance matrix using the population weighted centrods in br_pop
br_dist <- br_pop %>%
  select(PWC_Lon, #####) %>%
  #####() 
br_dist
# 5. Adapt the br_dist matrix object to
#    a. Include the relevant row and column names    
#    b. Scaled to kilometers
#####(br_dist) <- list(orig = br_pop$Adm_N, dest = br_pop$Adm_N)
br_dist <- round(#####/1000)
# 6. Calculate the migration distance indices for Brazil in 200, using the 
#    br_dist object
br %>%
  filter(year == 2000) %>%
  #####(d = br_dist)