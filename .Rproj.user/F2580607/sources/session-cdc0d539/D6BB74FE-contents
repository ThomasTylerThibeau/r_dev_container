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
install.packages("purrr")                             ## check
install.packages("rgdal")                             ## fail

library(ggmap)                                        ## google says 'please site'
library(sp)                                           ## good
library(sf)                                           ## not so good
library(randomcoloR)                                  ## good
library(shapefiles)                                   ## maybe not so good?
library(lwgeom)                                       ## not so good... 3/6, 4/6, I've seen worse
library(purrr)                                        ## yes?
library(rgdal)                                        ## nooo 3/8... =[

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

## why do I spell things like this? it's not kewl
skewlz <- c(hscsv$School.Name)
## this creates the spatial points... okay
proj4string(hsll) <- CRS("+proj=longlat+datum=WGS84") ## because the video did this?

## create the spatial file
hs.shp <- SpatialPointsDataFrame(coordinates(hsll), data<-as.data.frame(skewlz))
## wait, no this, right?
hs.shape <- st_as_sf(hs.shp)

## where are we? okay. so, hopefully we have a spatial file for the high schools
## the question suggests overlaying hs.shp & Maine Counties shape (non-existent atm)
## (even though hscsv$Region likely tells me everything I need to know, right?)

st_write(hs.shape, "HighSchoolShapes.shp", driver = "ESRI Shapefile")

hsMap <- st_read("HighSchoolShapes.shp")              ## pretend computer can read
sdMap <- st_read("Data Files/tl_2017_23_unsd.shp")    ## mine can't... yay DOC restrictions (5 more weeks)
scMap <- st_read("Data Files/tl_2017_us_county.shp")  ## similar names, I know

## see what's in the HS-shape, state district shape, and state counties shape
names(hsMap)                                          ## oh, nothing... need the libraries to do this stuff
names(sdMap)                                          ## oh, nothing... need the libraries to do this stuff
names(scMap)                                          ## oh, nothing... need the libraries to do this stuff

## at this point, I should see something about state fips code (STATEFP)
mcMap <- subset(scMap, scMap$STATEFP = 23)                           ## will it work?
## (can't touch this, da duh na na, da na, da naaa) (get it? mc? hammer? maine counties?)

## uhh, plot them now? (this is so difficult trying to find out where I was when I get an hour,
## maybe two at a time and I have to stop and come back in a day, maybe two [lather, rinse, repeat])
plot(hsMap)
plot(sdMap, add=TRUE, col="blue")
plot(mcMap, add=TRUE, col="limegreen")                ## see the maps over each other

## maybe the districts are the same as the counties? nah, that'd be too easy...


## 3.) append the school address to the district it resides in
## Idek, this is what AI suggests, but it's on thge assumption that hsll is some data table including district names
## or that I have a file of district names. and I have NO idea what's in the shapefile, or any other file for that matter

hsMap.sf <- st_as_sf(hsMap)
sdMap.sf <- st_as_sf(sdMap)
mcMap.sf <- st_as_sf(mcMap) ## McLovin'

layers <- st_join(hsMap.sf, sdMap.sf)
## summarize the results?

## shit. I'm outta guesses. I have no idea what table I'd even be on...
## I FEEL like school column is well beyond Schools.Names/Mailing.Address... I think we're onto
## the ~ long + lat table, since that went into the shapefile... And I can't see the district columns
## not that I'm really confident they exist (the lecture leads me to believe they would, the state FP codes are there)
inDisTable <- layers[,c("column-representing-schools","column-representing-districts")]

## (append school address to district it resides in)
inDisTable$School.Address <- hscsv$Mailing.Address



## 4.) Calculate the centroid of the school districts
plot(st_geometry(mcMap), cd="grey")                       ## possibly need .sf post-fix on these
plot(st_geometry(sdMap), cd="transparent", border="blue", add=TRUE)

sdCen <- st_centroid(sdMap, byid=TRUE)
sdCen.map <- st_transform(sdCen, CRS("+proj= longlat +datum=WSG84"))

centers <- st_coordinates(sdCen.map)
plot(st_geometry(centers), add=TRUE, pch=4, col=2) ## since 42 is the answer (life, the universe, and everything)


## 5.) find distance from HS to center of district... oh yay
st_distance(centers, hsll, byid=MAYBE)

## I know this would never work. I'm assuming there are more schools than districts
## Without being able to see it, work with it, load it, I really don't even know where I would
## start guessing... And my usual source of AI help is on the fritters...

## GOOGLE suggests doing something like:

# Transform to a projected CRS (e.g., UTM Zone 18N) if needed
# district_centroids <- st_transform(district_centroids, crs = 26918)
# schools <- st_transform(schools, crs = 26918)
sdCen <- left_join(hscsv, centers, by "District", suffix=c("_school", "_centroid"))
hscsv <- st_transform(hscsv, crs=26918) ## ? no, this doesn't feel right

# Join schools with their district centroids
# schools_with_centroids <- left_join(schools, district_centroids, by = "district_id", suffix = c("_school", "_centroid"))
someNewDF <- left_join(hscsv, centers, by = "District")#... wait a minute isn't this... didn't I just?

# Calculate distance between each school and its assigned district centroid
# schools_with_centroids$distance_to_centroid <- st_distance(
#   schools_with_centroids$geometry_school,
#   schools_with_centroids$geometry_centroid,
#   by_element = TRUE # Calculates distance for each pair
# )

## sure sounds good

## 6.) some other impossible task... (quit, this is ridiculous)

## no but seriously...

## 6.) find the closest centroid, WITHOUT using a ruler and measuring tape!

## sweet, the better one (Ecosia chat) appears to back... says I dplyr
# Convert to sf object
# high_schools_sf <- st_as_sf(high_schools, coords = c("longitude", "latitude"), crs = 4326)
## mm, I think I have this already as hsMap

# Assuming districts_sf has a geometry column for centroids
# centroids_sf <- st_centroid(districts_sf)
## okay, centers fits this bill

# Join high schools with their district centroids
# high_schools_with_centroids <- st_join(high_schools_sf, centroids_sf, join = st_within)

hsMap.distCentses <- st_join(hsMap, centers, join=st_within) ## definitely will work...

# Calculate distance to the centroid of their district
# high_schools_with_centroids <- high_schools_with_centroids %>%
#   mutate(distance_to_centroid = st_distance(geometry, geometry_centroid, by_element = TRUE))

hsMap.distCentses <- hsMap.distCentses %>%
    mutate(distCentse = st_distance(geometry, geometry, algebra, calculus_centroid, by_element=TRUE))
## just math it out!


# Calculate distance to the closest centroid
# distances_matrix <- st_distance(high_schools_sf, centroids_sf)
# closest_centroid_indices <- apply(distances_matrix, 1, which.min)
# closest_centroid_distances <- apply(distances_matrix, 1, min)

distCent.mtrx <- st_distance(hsMap, centers)
closestDist <- apply(distCent.mtrx, 1, which.min)
closestDist.maybe <- apply(distCent.mtrx, 1, min)

# high_schools_with_centroids <- high_schools_with_centroids %>%
#   mutate(closest_centroid_distance = closest_centroid_distances)
# print(high_schools_with_centroids)

## uhh.... mmm
hsMap.distCentses <- hsMap.distCentses %>%
  mutate(closestDist.maybe = closestDist.maybe)
print(hsMap.distCentses)                    ## plz lmk if this works, I'm sure it willn't


## 7.) ah, finally, pick some addresses and find out what hs they go to
# 55 Hermon Hts, Hermon ME 04401 -> Hermon High School
# 78 Birch St, Bangor ME 04401 -> Bangor High School
# 76 Church St/123 Water St/89 Church St Oakland ME 04963 -> Messalongname High School

## no? haha?

aOne <- "" # put some address here
aTwo <- "" # and here
aThr <- "" # and here

homes <- c(aOne, aTwo, aThr)

homes.codes <- geocode(homes)
coordinates(homes.codes) = ~ lon + lat ## long + lat or lon + lat?!

## AI says I been doing it wrong bad?
address.sf <- st_as_sf(data.frame(lon=homes.codes$lon, lat=homes.codes$lat))

