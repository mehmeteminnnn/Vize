  url <- "https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv"
  file_name <- "MapsThatChangedOurWorld_StoryMap_Data.csv"
  download.file(url, destfile = file_name, mode = "wb")
  
  maps <- read.csv(file_name, header = TRUE,sep = ";")
  maps$Latitude <- gsub("N", "", (maps$Latitude))
  maps$Latitude<-as.numeric(maps$Latitude)
  idx <- which(grepl("W", maps$Longitude))
  maps$Longitude <- gsub("E","",maps$Longitude)
  maps$Longitude <- gsub("W","",maps$Longitude)
  maps$Longitude <- as.character(maps$Longitude)
  maps$Year <- gsub("AD","",maps$Year)
  maps$Year <- as.numeric(maps$Year)
  maps$Latitude <- as.numeric(maps$Latitude)
  maps$Longitude <- as.numeric(maps$Longitude)
  hist(maps$Year, breaks = 10)
  maps$Longitude[idx] <- maps$Longitude[idx]*-1