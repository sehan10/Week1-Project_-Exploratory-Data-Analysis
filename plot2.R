#Reading and subsetting the data 
data <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.' )
subset <-  data[data$Date  %in% c("1/2/2007","2/2/2007"), ]

# Converting character to numeric
globalActivePower <- as.numeric(subset$Global_active_power)

# Mering time and Date
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Setting Device for graphics
png('plot2.png', width = 480 , height = 480)

# Plotting a graph
plot(datetime, globalActivePower, type="l", ylab = "Global Active Power(Kilowatts)")


# Closing the device 
dev.off()