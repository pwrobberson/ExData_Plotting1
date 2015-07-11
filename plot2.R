
## Note: The .txt file has been trimmed to 2/1/2007 and 2/2/2007 as suggested in instructions
hdata <- read.table("household_power_consumption.txt", 
                    header = TRUE, sep = ";")

## Date and Time converted to POSIX format
hdata$pdt <- as.POSIXlt(paste(hdata$Date,hdata$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

## plot Global Active Power by date-time
with(hdata, plot(hdata$pdt,hdata$Global_active_power, type="l", 
                xlab = "", ylab="Global Active Power (kilowatts)"))

##copy plot to .png file
dev.copy(png, file="plot2.png")
dev.off()
