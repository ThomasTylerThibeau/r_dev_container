## using 3 files:
## Counties of Maine                        | "tl_2017_23_unsd.shp"
## Public School Districts of Maine         | "tl_2017_us_county.shp"
## csv file of the High School Addresses    | "MaineHighSchools.csv"

install.packages("ggmap")                             ## check
install.packages("sp")                                ## check
install.packages("sf")                                ## check
install.packages("randomcoloR")                       ## check
install.packages("shapefiles")                        ## check
install.packages("lwgeom")                            ## check

library(ggmap)                                        ## google says 'please site'
library(sp)                                           ## good
library(sf)                                           ## not so good
library(randomcoloR)                                  ## good
library(shapefiles)                                   ## maybe not so good?
library(lwgeom)                                       ## not so good... 3/6, 4/6, I've seen worse


## 1.) Geocode the addresses

hscsv <- read.csv("Data Files/MaineHighSchools.csv")  ## header = TRUE default
names(hscsv)                                          ## use "Mailing.Address"
## returns:
## School.Name, County Mailing.Address Location Class Region

## let's look at one of them
hscsv[1,'Mailing.Address']                            ## should I append ",USA" to each?

## pretend I have access to this, or substitute your own
register_google(key = "P-p-p-ppleaaase! Google! You KNOW ME! Just lemme get one, I PROMISE I'll pay you (Tuesday!)")

## add the ",USA" just in case?
hscsv$Geo.Code.This <- paste(hscsv$Mailing.Address, ", USA", sep = "")
hscsv[1,'Geo.Code.This']    ## test checks out

hsll <- geocode(hscsv$Mailing.Address)                ## not sure
llhs <- geocode(hscsv$Geo.Code.This)                  ## which to use


## 2.) Find which county each school belongs to (csv file contains county. overlay school districts and counties)

## create spatial of the hsll/llhs (again, I can't really test it)
coordinates(hsll) <- ~ lon + lat
coordinates(llhs) <- ~ lon + lat
