#Reading Dataset.
data <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.' )
#Subsetting the dataset according to requirement of this task.
subset <-  data[data$Date  %in% c("1/2/2007","2/2/2007"), ]

# Converting character to numeric for graphs.
globalActivePower <- as.numeric(subset$Global_active_power)
voltage <- as.numeric(subset$Voltage)
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)
globalReactivePower <- as.numeric(subset$Global_reactive_power)

# Setting device to PNG.
png("plot4.png", width = 480, height = 480)

# Making portions in screen for different graphs. 
par(mfrow = c(2,2) )


# Merging data and time.
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 



# First graph
plot(datetime, globalActivePower, type="l", ylab = "Global Active Power(Kilowatts)", xlab = "")


# Second graph
plot(datetime, Voltage, type="l", ylab = "Voltage")


# Third graph
plot(datetime, subMetering1, type="l", ylab = 'Energy Sub Metering',  xlab="")
lines(datetime, subMetering2, type="l", col = 'red')
lines(datetime, subMetering3, type="l", col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

# fourth graph
plot(datetime,globalReactivePower, type ="l", ylab = "Global_reactive_power")


# Closing the connection to device in this case PNG.
dev.off()
