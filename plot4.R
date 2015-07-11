
## Note: The .txt file has been trimmed to 2/1/2007 and 2/2/2007 as suggested in instructions
hdata <- read.table("household_power_consumption.txt", 
                    header = TRUE, sep = ";")

## Date and Time converted to POSIX format
hdata$pdt <- as.POSIXlt(paste(hdata$Date,hdata$Time), 
                     format = "%d/%m/%Y %H:%M:%S")

## Set 2 rows, 2 columns
par(mfrow = c(2,2), mar = c(4,4,2,2))
## plot Global Active Power by date-time

with(hdata, plot(hdata$pdt,hdata$Global_active_power, type="l", 
                 xlab = "", ylab="Global Active Power (kilowatts)"))

## plot Voltage

with(hdata, plot(hdata$pdt,hdata$Voltage, type="l", 
                 xlab = "Date-Time", ylab="Voltage"))



## plot Sub_metering

with(hdata, plot(hdata$pdt,hdata$Sub_metering_1, 
                 type="l", 
                xlab = "", ylab="Energy Sub Metering"))
lines(hdata$pdt, hdata$Sub_metering_2, col = "red")
lines(hdata$pdt, hdata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", 
                     "Sub_metering_2", 
                     "Sub_metering_3"), 
       pch= 15, col = c("black", "red", "blue"))

## plot Global Reactive Power

with(hdata, plot(hdata$pdt,hdata$Global_reactive_power, type="l", 
                 xlab = "Date-Time", ylab="Global Reactive Power"))


##copy plot to .png file
dev.copy(png, file="plot4.png")
dev.off()
