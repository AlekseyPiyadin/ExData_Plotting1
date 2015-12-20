## Get data source
data_source <- read.csv("./Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", 
                        header = TRUE, 
                        sep=';', 
                        na.strings = "?", 
                        stringsAsFactors = FALSE)

## Subset of the data source
data_source$Date <- as.Date(data_source$Date, format="%d/%m/%Y")
data <- subset(data_source, 
               subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert date
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)


## Plot 3
with(data, 
{
  plot(Sub_metering_1~Datetime, 
       type = "l",
       xlab = "", 
       ylab = "Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime, col = 'Red')
  lines(Sub_metering_3~Datetime, col = 'Blue')
})
legend("topright", 
       col=c("black", "red", "blue"), 
       lty = 1, 
       lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save Plot 3 to file
dev.copy(png, 
         file = "plot3.png", 
         height = 480, 
         width = 480)
dev.off()