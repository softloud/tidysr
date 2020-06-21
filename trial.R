#' Wide-to-condensed walkthrough
#'
#' Import an abridged version of the systematic map database from Haddaway et al. 2018
#' (https://doi.org/10.1186/s13750-018-0126-2).
#' Variable names have been converted to snake_case naming conventions and latter colums removed.

trial<-read.csv(file.choose()) #imports the dataset from a .csv file
attach(trial) #attaches the dataset in the workspace
names(trial) #displays column/variable names within the dataset

library(tidyverse) #loads the tidyverse set of libraries

newdf <- unite(trial, "studydesign", studydesign_observational, studydesign_manipulative, sep = ";", remove = TRUE, na.rm = TRUE)

library(dplyr)
df <- mutate(trial, studydesign = paste(studydesign_observational, "; ", studydesign_manipulative))
names(df)

trial2 <- gsub("^,*|(?<=,),|,*$", "", unite(trial, col="studydesign", studydesign_observational, studydesign_manipulative, sep = ","), perl=T)
