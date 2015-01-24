library(shiny)
library(googleVis) 
library(lubridate)

nationalData <- read.csv("nat.csv", as.is = T)

nationalCleanData <- subset(nationalData, subset = (Subdma != "Global"))
nationalCleanData$Week <- as.Date(mdy_hm(nationalCleanData$Week))


sData <- read.csv("spot.csv", as.is = T)

sCleanData <- subset(sData, subset = (Subdma != "Global"))
sCleanData$Week <- as.Date(mdy_hm(sCleanData$Week))

#Removing dma markets
sCleanData$Subdma <- substr(sCleanData$Subdma, 1,3)

# Applying aggregate over each dma group and 
# finding the sum of CLTV
sCleanData <- aggregate(CLTV ~ Subdma, sCleanData, sum)
