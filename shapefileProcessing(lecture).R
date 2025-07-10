install.packages(c("ggmap", "sp", "randomcoloR", "sf", "shapefiles", "lwgeom"))
library(ggmap)
library(sp)
library(sf)
library(randomcoloR)
library(shapefiles)
library(lwgeom)
## uh oh...
install.packages("sf")
library(sf)

addresses = c("2200 Sunport Blvd, Albuquerque, NM 87106, USA", "7401 Paseo De Colcan Northwest Albuquerque, NM 87121, USA", "121 Aviation Dr, Santa Fe, NM 87507, USA")
longlat = c(-69.7221706, 44.5424265)

