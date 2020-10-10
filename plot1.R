library(data.table)
system("unzip exdata_data_household_power_consumption.zip")
full_data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- as.data.frame(subset.data.frame(full_data, Date %in% c("1/2/2007","2/2/2007")))
rm(full_data)

## Plot 1
plot.new()
png("plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
