# 0.  a) Load the KOSTAT2021.Rproj file. 
#     Run the getwd() below. It should print the directory where the 
#     KOSTAT2021.Rproj file is located.
getwd()
#     b) Load the packages used in this exercise
library(tidyverse)
library(migest)
library(circlize)
##
##
##
# 1. Run the code below to read in the label data in korea_cd_labels.csv taken
#    from https://www.tandfonline.com/doi/full/10.1080/21681376.2018.1431149 
r <- read_csv("./data/korea_cd_labels.csv") 
View(r)
# 2. Run the code below to select the 2020 Korean internal migration data, 
#    for plotting, excluding within region movements
d <- korea_reg %>%
  filter(year == 2020, 
         orig != dest)
d
# 3. Run the code below to check that all the regions in the object r are in the 
#    migration data frame d
setdiff(x = union(d$orig, d$dest), y = r$region)
# 4. Modify d to enable a more sensible plot
#    1) divide flow column by a thousand
#    2) adjust the data frame to the three relevant columns for chordDiagram()
d <- d %>%
  select(-#####) %>%
  mutate(flow = flow/#####)
# 5. Check the data is in the correct by format by plotting a chord diagram 
#    using the default settings
chordDiagram(x = #####)
# 6. Plot a chord diagram using 
#    a. the order of provinces from r
#    b. colours from the col column in r
#    c. transparency set to 0.25
chordDiagram(x = d, order = #####$region, grid.col = r$#####, ##### = 0.25)
# 7. Edit the code below to 
#    a. add directional arrows 
#    b. change the height at the start and end of the chords to -0.04 
chordDiagram(x = d, order = r$#####, grid.col = r$col, transparency = 0.25,
             directional = #####, direction.type = c(#####, "arrows"),
             ##### = "big.arrow", diffHeight = #####)
# 8. Use the circos.par function to set
#    a. track margins to c(0.01, -0.01)
#    d. start degree to 90
#    c. gap degree to a the gap column in object r
#    d. plot a chord diagram with these setting based based on the code in the 
#       answer above
circos.par(track.margin = c(#####, -0.01), ##### = 90, gap.degree = r$#####)
chordDiagram(x = d, order = r$region, grid.col = r$col, transparency = 0.25,
             directional = 1, direction.type = c("diffHeight", "arrows"),
             link.arr.type = "big.arrow", diffHeight = -0.04)
# 9. Edit below to sort the chord links 
#    a. into and out of each section
#    b. largest links on top
chordDiagram(x = d, order = r$region, grid.col = r$col, transparency = 0.25,
             directional = 1, direction.type = c("diffHeight", "arrows"),
             link.arr.type = "big.arrow", diffHeight = -0.04, 
             link.sort = #####, link.largest.ontop = #####)
# 10. Edit the code below to
#     a. plot only the grid and the axis
#     b. set the track height of the label area to 0.1
chordDiagram(x = d, order = r$region, grid.col = r$col, transparency = 0.25,
             directional = 1, direction.type = c("diffHeight", "arrows"),
             link.arr.type = "big.arrow", diffHeight = -0.04, 
             link.sort = TRUE, link.largest.ontop = TRUE, 
             ##### = c("grid", #####),
             preAllocateTracks = list(track.height = #####))
# 11. Add the labels in the track by
#     a. setting y position of label to 1
#     b. setting text facing to bending
#     c. setting the font size to 0.7
circos.track(track.index = 1, bg.border = NA, panel.fun = function(x, y) {
  s = get.cell.meta.data("sector.index")
  xx = get.cell.meta.data("xlim")
  rr = filter(#####, region == s)
  circos.text(x = mean(xx), y = #####, labels = rr$label_en, 
              facing = #####, ##### = 0.7)
})
# 12. Use the code in question 10 and 11 to create the PDF version of the plot 
pdf(file = "./exercise/korea2020_en.pdf", width = 5, height = 5)





##### paste in here ...







dev.off()
# 13. Run the code below to check the PDF (might not work on Mac - if so, 
#     manually open PDF file to view)
file.show("./exercise/korea2020_en.pdf")
# 14. Complete the code below to add a second set of Korean labels.
#     Note: East Asian characters require a non-standard font families - see 
#           ?pdfFonts for options. Might not require to set family depending on
#           settings in your computer and/or RStudio
pdf(file = "./exercise/korea2020.pdf", width = 5, height = 5, family = "Korea1")
chordDiagram(x = d, order = r$region, grid.col = r$col, transparency = 0.25,
             directional = 1, direction.type = c("diffHeight", "arrows"),
             link.arr.type = "big.arrow", diffHeight = -0.04, 
             link.sort = TRUE, link.largest.ontop = TRUE, 
             annotationTrack = c("grid", "axis"),
             preAllocateTracks = list(track.height = 0.1))
circos.track(track.index = 1, bg.border = NA, panel.fun = function(x, y) {
  s = get.cell.meta.data("sector.index")
  ##### <- filter(r, region == s)
  xx = get.cell.meta.data("xlim")
  circos.text(x = mean(xx), y = 1.5, labels = rr$label_en, 
              facing = "bending", cex = 0.7)
  circos.text(x = mean(xx), y = 0.9, labels = rr$#####, 
              facing = "bending", cex = 0.7)
})
dev.off()
file.show("./exercise/korea2020.pdf")
# 15. Run the code below to check the PDF (might not work on Mac - if so, 
#     manually open PDF file to view)
file.show("./exercise/korea2020.pdf")
