# 0.  a) Load the KOSTAT2021.Rproj file. 
#     Run the getwd() below. It should print the directory where the 
#     KOSTAT2021.Rproj file is located.
getwd()
#     b) Load the packages used in this exercise
library(tidyverse)
library(mipfp)
##
##
##
# 1. Run the code below to read in the bilateral data in uk_census_2011_tidy.csv 
#    from the ONS 2011 British Census
cen11 <- read_csv("./data/uk_census_2011_tidy.csv")
cen11
# 2. Run the code below to read in the bilateral data in 
#    uk_nhs_hesa_2018.csv from the British administrative data (National
#    Health Service patient records and Higher Education Statistics Authority)
nhs18 <- read_csv("./data/uk_nhs_hesa_2018_tidy.csv")
nhs18
# 3. Run the code below to create data with abbreviated region names - to make 
#    it easier to view the matrices for each time period
#    Note: the census data is more detailed (orig - dest - age - sex) than the 
#          administrative data (orig - dest)
cen11 <- cen11 %>%
  mutate(orig_full = orig, 
         dest_full = dest, 
         orig = abbreviate(orig),
         dest = abbreviate(dest)) %>%
  mutate_if(is.character, fct_inorder)
nhs18 <- nhs18 %>%
  mutate(orig_full = orig, 
         dest_full = dest, 
         orig = abbreviate(orig),
         dest = abbreviate(dest)) %>%
  mutate_if(is.character, fct_inorder)
cen11
nhs18
# 4. Create an origin-destination-age-sex array object c11 from census flow data
#    in cen2011
#     (Hint: use xtabs())
c11 <- xtabs(formula = ##### ~ orig + dest + ##### + sex, data = #####)
# 5. Create a origin-destination matrix object a18 from the administrative flow 
#    data in nhs18
a18 <- #####(formula = flow ~ orig + #####, data = #####)
# 6. Use the colSums() and rowSums() functions to create objects a18_tot and 
#    a18_out, the targets for use later on.
a18_out <- #####(a18)
a18_in <- #####(a18)
a18_out
a18_in
# 7.  Complete the code below to estimate using IPFP the 
#     origin-destination-age-sex flows in 2018 based on 
#     a. seed from the 2011 census 
#     (Hint: c11)
#     b. target list for the dimensions of the target totals (see c.)
#     (Hint: out total are for rows and in totals are columns)
#     c. target totals based on the a18_out and a18_in objects
e18 <- Ipfp(seed = #####, 
            target.list = list(1, #####), 
            target.data = list(#####, a18_in))
# 8. Run the code below to show the beginning of a data frame version of 
#    the 2018 origin - destination - age - sex estimates, combining the detailed
#    2011 census estimates with the in and out migration totals in the 2018 
#    administrative data
e18$x.hat %>%
  as.data.frame.table(responseName = "est") %>%
  as_tibble()
# 9. Run the code below to check the row and column totals of the detailed 2018
#    estimates, summed over age and sex, matches the observed in and out totals 
#    from the administrative data
# totals outflow from estimated array
rowSums(e18$x.hat)
a18_out
# totals inflow from estimated array
colsSums(e18$x.hat)
a18_in
# Bonus - run the code below and note the lack of match in estimated origin - 
#  destination totals and the observed administrative flows - did not
#  use target.list = list(c(1, 2)) and target.data = list(a18) in Ipfp()
(apply(X = e18$x.hat, MARGIN = c(1, 2), FUN = sum) - a18) %>%
  round()