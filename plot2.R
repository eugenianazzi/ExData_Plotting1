library(data.table)
system("unzip exdata_data_household_power_consumption.zip")
full_data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- as.data.frame(subset.data.frame(full_data, Date %in% c("1/2/2007","2/2/2007")))
rm(full_data)

data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## Plot 2
plot.new()
png("plot2.png", width = 480, height = 480, units = "px")

with(data, plot(datetime, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)", xlab = ""))



dev.off()
