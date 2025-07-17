## using 3 files:
## Counties of Maine                        | "tl_2017_23_unsd.shp"
## Public School Districts of Maine         | "tl_2017_us_county.shp"
## csv file of the High School Addresses    | "MaineHighSchools.csv"

install.packages("ggmap")       # check
install.packages("sp")          # check
install.packages("sf")          # check
install.packages("randomcoloR") # check
install.packages("shapefiles")  # check
install.packages("lwgeom")      # check

library(ggmap)        ## google says 'please site'
library(sp)           ## good
library(sf)           ## not so good
library(randomcoloR)  ## good
library(shapefiles)   ## maybe not so good?
library(lwgeom)       ## not so good... 3/6, 4/6, I've seen worse
