# Needed packages
library(data.table)

# Read data
DT_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") 

# Subset the data
DT_sub <- DT_full[DT_full$Date %in% c("1/2/2007","2/2/2007") ,] 

# Datetime
datetime <- strptime(paste(DT_sub$Date, DT_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

# Global active power
globalActivePower <- as.numeric(DT_sub$Global_active_power)

# Make a plot
# Please note that I live in Finland and the language settings in my computer is set to finnish, so
# days are shown as a finnish language to = thu, pe = fri, la = sat
png("plot2.png", width=480, height=480) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 


