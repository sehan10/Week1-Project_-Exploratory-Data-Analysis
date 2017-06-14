#Reading and subsetting the data 
data <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.' )
subset <-  data[data$Date  %in% c("1/2/2007","2/2/2007"), ]

# Converting character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Setting Device for graphics
png('plot1.png', width = 480 , height = 480)

# Creating Histogram 
hist(data$Global_active_power, col = 'red', xlab = 'Global Active Power',main = 'Global Active Power')

# Closing the connection with device
dev.off()