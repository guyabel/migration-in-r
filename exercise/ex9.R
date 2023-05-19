# 0.  a) Load the KOSTAT2021.Rproj file. 
#     Run the getwd() below. It should print the directory where the 
#     KOSTAT2021.Rproj file is located.
getwd()
#     b) Load the packages used in this exercise
library(tidyverse)
library(ggforce)
##
##
##
##
# 1. Run the code below to read in the migrant stock data from Gabon taken
#    from Table 21-6 in Shryock & Siegel (1979)
ga <- read_csv("./data/gabon_1961_tidy.csv") 
ga
# 2. Run the code below to remove the totals groups and migrants from abroad
d <- ga %>%
  rename(orig = place_of_birth, 
         dest = place_of_enumeration) %>%
  filter(sex == "total", 
         !orig %in% c("Grand total", "Abroad", "Total Gabon"), 
         dest != "Total") %>%
  select(-sex)
d
# 3. Create a data frame s1 using the gather_set_data() function to organise the
#    Gabon data in d ready for a Sankey plot using geom_parallel_sets
s1 <- d %>%
  select(orig, dest, #####) %>%
  #####(x = 1:#####)
s1
# 4. Run an initial plot on s1 to inspect for potential changes required to the
#    the data frame
ggplot(data = s1,
       mapping = aes(x = x, id = id, value = migrants, split = y)) +
  geom_parallel_sets(mapping = aes(fill = orig)) 
# 5. Create a new data s2, based on d, that 
#    a. Sets migrant counts to zero for the migrant corridors for native born
#       persons, where the place of enumeration is the same as the place of 
#       birth (orig == dest)
#    b. Divide the migrant counts by one thousand
#    c. Re-organises the data using the gather_set_data() function
#    d. Sets both x and y to factors based on order of appearance using the 
#       fct_inorder() function (which broadly follows a north to south order)
s2 <-  d %>%
  mutate(migrants = ifelse(test = orig == #####, yes = #####, no = migrants),
         migrants = migrants/#####) %>%
  select(orig, dest, migrants) %>%
  #####(x = 1:2) %>%
  mutate(x = fct_inorder(x),
         y = #####(y))
s2
levels(s2$y)
# 6. Create an object p that sets the horizontal positioning and nudge amount
#    for each origin and destination label
p <- s2 %>%
  #####(x, y) %>%
  mutate(h = as.numeric(x == "orig"),
         n = h * -0.1 + 0.05)
p
# 7. Complete the code below for a plot of the intra-regional migrant 
#    distributions for Gabon
ggplot(data = s2,
       mapping = aes(x = x, id = id, value = #####, split = y)) +
  geom_parallel_sets(mapping = aes(fill = orig), alpha = 0.8, 
                     axis.width = -0.05) +
  geom_parallel_sets_axes(fill = "transparent", colour = "black", 
                          axis.width = #####) +
  guides(fill = #####) +
  geom_parallel_sets_labels(angle = #####, hjust = p$h, 
                            position = position_nudge(x = p$n, )) +
  scale_x_discrete(labels = c(orig = "Place of Birth", 
                              dest = "Place of Residence")) +
  labs(y = "Migrants (thousands)", x = "") +
  theme_bw()
# 9. Run the code below to check the PDF (might not work on Mac - if so, 
#    manually open PDF file to view)
ggsave(filename = "./exercise/gabon1961.pdf", height = 8, width = 8)
file.show("./exercise/gabon1961.pdf")
