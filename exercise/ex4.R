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
# 1. Run the code below to read in the population age structure data for Quebec 
#    and a range of survival ratios
q <- read_csv("./data/quebec_1956.csv")
q
# 2. Estimate the age specific net migration counts based on the national census 
#    survival ratio (column national_csr)
d1 <- #####(.data = q, 
             p##### = "pop1951", 
             pop1_col = #####, 
             survival_ratio_col = #####)
d1
# 3. Find the total net migration estimates for the net_average method for the 
#    estimates in the previous question
#####(d1$net_average)
# 4. Estimate the age specific net migration counts based on the Quebec life
#    tables survival ratio (column quebec_ltsr)
d2 <- net_sr(.data = #####, 
             pop0_col = #####, 
             pop1_col = "pop1956", 
             ##### = #####)
d2
# 5. Find the total net migration estimates for the net_average method for the 
#    estimates in the previous question
#    Note: the total should have the opposite sign, as the national survival 
#          ratios do not account for international migration and regional
#          differences in mortality
sum(d2$#####)
# 6. Run the code below to read in the population age structure data for 
#    Franklin, Ohio
f <- read_csv("./data/franklin_1960.csv") 
f
# 7. Run the code below to move the births into the pop1950 column
f <- f %>%
  mutate(pop1950 = ifelse(is.na(pop1950), births, pop1950))
f
# 8. Estimate the age specific net migration counts based on the national census 
#    survival ratio (column national_csr)
d3 <- net_sr(.data = #####, 
             pop0_col = "pop1950", 
             pop1_col = #####, 
             survival_ratio_col = #####, 
             net_children = #####)
# 9. Compare the total net migration estimates from each method
d3 %>%
  select(contains("#####")) %>%
  summarise_all(sum)