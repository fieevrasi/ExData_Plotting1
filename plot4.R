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

# Global reactive power
globalReactivePower <- as.numeric(DT_sub$Global_reactive_power) 

# Voltage
voltage <- as.numeric(DT_sub$Voltage) 

# Submeterings
subMeter1 <- as.numeric(DT_sub$Sub_metering_1) 
subMeter2 <- as.numeric(DT_sub$Sub_metering_2) 
subMeter3 <- as.numeric(DT_sub$Sub_metering_3) 

# Make a plot
# Please note that I live in Finland and the language settings in my computer is set to finnish, so
# days are shown as a finnish language to = thu, pe = fri, la = sat
png("plot4.png", width=480, height=480) 

par(mfrow = c(2, 2))  

# First plot 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power") 

# Second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 

# Third plot 
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMeter2, type="l", col="red") 
lines(datetime, subMeter3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
 
# Fourth plot 
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")  
 
dev.off() 



