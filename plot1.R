
## Note: The .txt file has been trimmed to 2/1/2007 and 2/2/2007 as suggested in instructions
hdata <- read.table("household_power_consumption.txt", 
                    header = TRUE, sep = ";")

## plot histogram Global Active Power
hist(hdata$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

##copy plot to .png file
dev.copy(png, file="plot1.png")
dev.off()
