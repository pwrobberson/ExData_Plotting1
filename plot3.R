
## Note: The .txt file has been trimmed to 2/1/2007 and 2/2/2007 as suggested in instructions
hdata <- read.table("household_power_consumption.txt", 
                    header = TRUE, sep = ";")

## Date and Time converted to POSIX format
hdata$pdt <- as.POSIXlt(paste(hdata$Date,hdata$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

## plot Energy Sub_metering by date-time
with(hdata, plot(hdata$pdt,hdata$Sub_metering_1, 
                 type="l", 
                xlab = "", ylab="Energy Sub Metering"))
lines(hdata$pdt, hdata$Sub_metering_2, col = "red")
lines(hdata$pdt, hdata$Sub_metering_3, col = "blue")
legend("top", c("Sub_metering_1", 
                     "Sub_metering_2", 
                     "Sub_metering_3"), 
       pch= 15, col = c("black", "red", "blue"))

##copy plot to .png file
dev.copy(png, file="plot3.png")
dev.off()
