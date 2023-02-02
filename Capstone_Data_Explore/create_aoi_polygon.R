# Create A Shapefile of our area of interest -120.50, 33.83, -119.45, 34.49
#Load in libraries
library(tidyverse)
library(sf)

# Create a data frame from the coordinates

coordinates <- tribble(
  ~lat, ~lon,
  33.83, -120.50, 
  33.83, -119.45, 
  34.49, -120.50, 
  34.49, -119.45
) |> 
  st_as_sf(coords = c("lon", "lat"), 
           crs = "EPSG: 4326") |> 
  st_bbox() |>  
  st_as_sfc()

st_write(coordinates,
         "/Users/jfrench/Documents/MEDS/Capstone/DATA/AOI_SBchannel.shp", 
         driver = "ESRI Shapefile")
