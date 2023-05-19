# 0.  a) Load the KOSTAT2021.Rproj file. 
#     Run the getwd() below. It should print the directory where the 
#     KOSTAT2021.Rproj file is located.
getwd()
#     b) Load the packages used in this exercise
library(tidyverse)
library(migest)
library(DemoTools)
##
##
##
# 1. Run the code below to read in the population age structure data for flows
#    from Florida to New York based on the 2015 American Community Survey
flny <- read_csv("./data/florida_new_york_acs_2015.csv")
flny
# 2. Run the code below to plot the age schedule for migration from New York to 
#    Florida. Note, the uneven spread of the age groups
ggplot(data = x, mapping = aes(x = AGE_label, y = mig_in, group = 1)) +
  geom_point() +
  geom_line() +
  theme(axis.text = element_text(angle = 45, hjust = 1))
# 3. Estimate the age schedule based on single years up to 100, based on a 
#    graduation of the migration data in flny
mx <- #####(Value = flny$#####, Age = #####$age_min, 
               method = "pclm", OAG =  TRUE, OAnew = #####)
mx
# 4. Build a data frame to store the graduated data frame and a migration 
#    intensities (mx rescaled so that age specific intensities sum to one)
d <- tibble(
  age = 1:100, 
  mx = mx,
  mi = #####/sum(mx)
)
d
# 5. Plot the graduated age schedule 
d %>%
  ggplot(mapping = aes(x = #####, y = #####)) +
  geom_line()
# 6. Use the age and migration intensities in d to fit a 11 parameter Rogers-
#    Castro age schedule (with a retirement peak, but no post retirement peak)
f <- mig_estimate_rc(ages = d$#####, mx = d$mi,
                     pre_working_age = #####, working_age = TRUE,
                     retirement = #####, post_retirement = FALSE)
# 7. Run the code below to plot the fitted Rogers Casto age schedule
ggplot(data = f[[2]],
       mapping = aes(x = age, y = data)) +
  geom_ribbon(mapping = aes(ymin = lower, ymax = upper), fill = "lightblue") +
  geom_line(mapping = aes(y = median), colour = "blue") +
  geom_point()
# 8. Calculate the indices based on the median of the parameter distributions 
#    for the Rogers Castro age schedule
f[[1]] %>%
  select(variable, median) %>%
  #####() %>%
  #####()