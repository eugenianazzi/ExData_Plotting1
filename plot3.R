library(data.table)
system("unzip exdata_data_household_power_consumption.zip")
full_data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- as.data.frame(subset.data.frame(full_data, Date %in% c("1/2/2007","2/2/2007")))
rm(full_data)

data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## Plot 3
plot.new()
png("plot3.png", width = 480, height = 480, units = "px")

with(data, {
  plot(datetime, Sub_metering_1, type = "l", col=1, ylab = "", xlab = "")
  lines(datetime, Sub_metering_2, type = "l", col=2)
  lines(datetime, Sub_metering_3, type = "l", col=4)
})

title(ylab = "Energy sub metering")
legend("topright", cex=0.75, lty=1,lwd=1 ,col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
