####### Bude exploration

library(ggmap)
library(tidyverse)

#Find the town of Bude in Western England. This is a town that is well-known as a beach resort. 

Bude_coord <- geocode("S W Coast Path, Bude EX23 8HN, UK") 
#centering the map at the cricket grounds, rather than center of Bude



# Make two maps of Bude:

# (1) a road map

Bude_roadmap <- get_map(Bude_coord, zoom = 15)
ggmap(Bude_roadmap)



# (2) a watercolor map

Bude_watercolor <- get_map(Bude_coord, maptype = "watercolor", zoom = 15)
ggmap(Bude_watercolor)




# Vacation Spots

#### The coordinates


#two local beaches
  #(1) Summerleaze Beach
        summerleaze <- geocode("Summerleaze Beach, Summerleaze Cres, Bude EX23 8HN, UK")
        
  #(2) Crooklets Beach
        crooklets <- geocode("Crooklets Beach, S W Coast Path, Bude EX23 8NE, UK")

#cricket grounds (Bude North Cornwall Cricket Club)
        cricket_grounds_coord <-geocode("Bude North Cornwall Cricket Club")

        
### On the map
        
        
ggmap(Bude_roadmap) +
  geom_point(mapping = aes(x = summerleaze$lon, y = summerleaze$lat)) +
  geom_label(x = summerleaze$lon, y = summerleaze$lat, label = "Summerleaze Beach", hjust = 1, vjust=1) +
  geom_point(mapping = aes(x = crooklets$lon, y = crooklets$lat)) +
  geom_label(x = crooklets$lon, y = crooklets$lat, label = "Crooklets Beach", hjust = 1, vjust=1) +
  geom_point(mapping = aes(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat)) +
  geom_label(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat, label = "Cricket Grounds", hjust = 1, vjust = 1)
  
ggmap(Bude_watercolor) +
  geom_point(mapping = aes(x = summerleaze$lon, y = summerleaze$lat)) +
  geom_label(x = summerleaze$lon, y = summerleaze$lat, label = "Summerleaze Beach", hjust = 1, vjust=1) +
  geom_point(mapping = aes(x = crooklets$lon, y = crooklets$lat)) +
  geom_label(x = crooklets$lon, y = crooklets$lat, label = "Crooklets Beach", hjust = 1, vjust=1) +
  geom_point(mapping = aes(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat)) +
  geom_label(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat, label = "Cricket Grounds", hjust = 1, vjust = 1)



# Directions to the pub

### The Barrel at Bude Coordinates
barrel <- geocode("36 Lansdown Rd, Bude EX23 8BN, UK")

### The route
from <- "Bude North Cornwall Cricket Club"
to <- "36 Lansdown Rd, Bude EX23 8BN, UK"
route_df <- route(from, to, structure = "route")


### The maps
ggmap(Bude_roadmap) +
  geom_point(mapping = aes(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat)) +
  geom_label(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat, label = "Cricket Grounds", hjust = 1, vjust = 1) +
  geom_point(mapping = aes(x = barrel$lon, y = barrel$lat)) +
  geom_label(x = barrel$lon, y = barrel$lat, label = "The Barrel at Bude", hjust = 1, vjust = 1) +  
  geom_path(aes(x = lon, y = lat), colour = "red", size = 1.5,
            data = route_df, lineend = "round")

ggmap(Bude_watercolor) +
  geom_point(mapping = aes(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat)) +
  geom_label(x = cricket_grounds_coord$lon, y = cricket_grounds_coord$lat, label = "Cricket Grounds", hjust = 1, vjust = 1) +
  geom_point(mapping = aes(x = barrel$lon, y = barrel$lat)) +
  geom_label(x = barrel$lon, y = barrel$lat, label = "The Barrel at Bude", hjust = 1, vjust = 1) +  
  geom_path(aes(x = lon, y = lat), colour = "red", size = 1.5,
            data = route_df, lineend = "round")


