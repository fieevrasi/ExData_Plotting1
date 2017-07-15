
# Tehtävä 1

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="C:/WD/data/community_survey.csv", method="curl")

dt <- data.table(read.csv("C:/WD/data/community_survey.csv"))
varNames <- names(dt)
varNamesSplit <- strsplit(varNames, "wgtp")
varNamesSplit[[123]]


# Tehtävä 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="C:/WD/data/FGDP.csv")
dt <- data.table(read.csv("C:/WD/data/FGDP.csv"))



# Vastaus
-16776939 -10092545 

# Tehtävä 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)