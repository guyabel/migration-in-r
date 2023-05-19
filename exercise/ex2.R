# 0.  a) Load the KOSTAT2021.Rproj file. 
#     Run the getwd() below. It should print the directory where the 
#     KOSTAT2021.Rproj file is located.
getwd()
#     b) Load the packages used in this exercise
library(tidyverse)
library(migest)
##
##
##
# 1. Run the code below to read in the bilateral data in uk_census_2011_tidy.csv 
#    from the ONS 2011 British Census
uk <- read_csv("./data/uk_census_2011_tidy.csv")
uk
# 2. Create a 12 by 12 origin-destination matrix m based on the bilateral flows
#    given in data frame uk
m <- #####(formula = flow ~ orig + #####, data = #####)
m
# 3. Print the matrix m again, this time include the in- and out-migration 
#    sum totals
#####(m1)
# 4. Create a 12 by 12 by 2 sex-specific origin-destination array based on the
#    bilateral flows given in data frame uk
s <- #####(formula = ##### ~ ##### + dest + #####, data = uk)
s
# 5. Run the code below to check that s has 12 x 12 x 2 dimensions
dim(s)
# 6. Convert object s from above into a tibble with four columns, orig, dest, 
#    sex and flow
d <- s %>%
  #####(responseName = "#####") %>%
  #####()
d
# 7. Calculate the counter-flow and net-flow for each migration pair in the 
#    matrix m. Use the arrange() function to show the top 10 migration corridors
#    with biggest net losses 
m %>%
  #####() %>%
  arrange(net_flow)
# 8. Calculate the sex-specific in-migration, out-migration, turnover and net 
#    migration totals for each origin in s. Arrange the results by the smallest
#    turnover totals
s %>%
  #####(responseName = "flow") %>%
  group_by(#####) %>%
  #####() %>%
  arrange(turn)
