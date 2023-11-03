
## Get working directory ##
getwd()

## Set/Change working directory ##
setwd("~/Documents/deom_data.csv")

## See the objects in working directory ##
list.files()

## See the objects in other directory ##
list.files("../abcd")

## Install a new package ##
install.packages("Hmisc")
install.packages("readxl")

## Know more about a package ##
?? Hmisc

## See the Installed Packages ##
library()

## Load an installed package in search path ##
library(Hmisc)
require(Hmisc)

## See which packages are currently loaded ##
search()

## See the currently available packages dataset ##
data()
data(package="cluster")

## To list the data sets in all *available* packages.##
data(package= .packages(all.available = TRUE))

## Load an available packages dataset ##
data(BOD)

## Load an available packages dataset from other packaages ##
data(flower, package="cluster")

## Creat a dataset by typing manually in data window ##
datatest <- edit(data.frame())
fix(datatest)
View(datatest)

## See the class of an object ##
class(datatest)
class(datatest$binary)

## List the structure of the variables of a dataset ##
str(datatest)

## See the heading of a dataset ##
head(datatest)

## See the names of the variables of a dataset ##
names(datatest)

## See the class of an object ##
dim(datatest)
dim(datatest$binary)

## See an object in a data window ##
View(datatest)

## See the data of a particular variable in a dataset ## 
datatest$binary

## Attach a data frame in search path to access variables of a data frame without typing the name of the data frame ##
attach(datatest)
binary

## Detach a data frame from search path ##
detach(datatest)
datatest$binary

## Edit a dataset and save as a new dataset ##
new_datatest <- edit(datatest)

## Edit a dataset and replace to old dataset ##
fix(datatest)

## Save all the commands as a text file ##
savehistory("intro.txt")
