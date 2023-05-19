# 0.  a) Load the KOSTAT2021.Rproj file. 
#     Run the getwd() below. It should print the directory where the 
#     KOSTAT2021.Rproj file is located.
getwd()
#     b) Load the packages used in this exercise
library(tidyverse)
library(migest)
library(MuMIn)
##
##
##
# 1. Run the code below to read in the migration flow data for flows within the 
#    USA, decomposed by move type, from 6 censuses between 1940 and 2000. 
us <- read_csv("./data/us_area_1940_2000.csv")
us
# 2. Show the multiplicative components, rounded to 3 digits, for the flows from
#    the 2000 census
us %>%
  filter(year == 2000) %>%
  #####() %>%
  round(digits = #####)
# 3. Fit a log-linear model to the entire data set using all two-way 
#    interactions between the four dimensions (orig, dest, period and move_type)
f <- glm(formula = flow ~ (##### + dest + ##### + move_type) ^#####,
         family = #####(), data = us, na.action = na.fail)
# 4. View a summary of the model 
summary(#####)
# 5. Use dredge() to fit all simpler models than the model saved in f
mm <- #####(global.model = f, trace = TRUE)
# 6. Use the View() function to inspect the results of the dredging of the model 
#    space and identify the most important dimensions
View(mm)
